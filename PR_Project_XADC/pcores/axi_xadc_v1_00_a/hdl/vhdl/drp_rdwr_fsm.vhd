-------------------------------------------------------------------------------
-- drp_rdwr_fsm.vhd - entity/architecture pair
-------------------------------------------------------------------------------
--
-- ************************************************************************
-- ** DISCLAIMER OF LIABILITY                                            **
-- **                                                                    **
-- ** This file contains proprietary and confidential information of     **
-- ** Xilinx, Inc. ("Xilinx"), that is distributed under a license       **
-- ** from Xilinx, and may be used, copied and/or disclosed only         **
-- ** pursuant to the terms of a valid license agreement with Xilinx.    **
-- **                                                                    **
-- ** XILINX IS PROVIDING THIS DESIGN, CODE, OR INFORMATION              **
-- ** ("MATERIALS") "AS IS" WITHOUT WARRANTY OF ANY KIND, EITHER         **
-- ** EXPRESSED, IMPLIED, OR STATUTORY, INCLUDING WITHOUT                **
-- ** LIMITATION, ANY WARRANTY WITH RESPECT TO NONINFRINGEMENT,          **
-- ** MERCHANTABILITY OR FITNESS FOR ANY PARTICULAR PURPOSE. Xilinx      **
-- ** does not warrant that functions included in the Materials will     **
-- ** meet the requirements of Licensee, or that the operation of the    **
-- ** Materials will be uninterrupted or error-free, or that defects     **
-- ** in the Materials will be corrected. Furthermore, Xilinx does       **
-- ** not warrant or make any representations regarding use, or the      **
-- ** results of the use, of the Materials in terms of correctness,      **
-- ** accuracy, reliability or otherwise.                                **
-- **                                                                    **
-- ** Xilinx products are not designed or intended to be fail-safe,      **
-- ** or for use in any application requiring fail-safe performance,     **
-- ** such as life-support or safety devices or systems, Class III       **
-- ** medical devices, nuclear facilities, applications related to       **
-- ** the deployment of airbags, or any other applications that could    **
-- ** lead to death, personal injury or severe property or               **
-- ** environmental damage (individually and collectively, "critical     **
-- ** applications"). Customer assumes the sole risk and liability       **
-- ** of any use of Xilinx products in critical applications,            **
-- ** subject only to applicable laws and regulations governing          **
-- ** limitations on product liability.                                  **
-- **                                                                    **
-- ** Copyright 2010, 2011 Xilinx, Inc.                                  **
-- ** All rights reserved.                                               **
-- **                                                                    **
-- ** This disclaimer and copyright notice must be retained as part      **
-- ** of this file at all times.                                         **
-- ************************************************************************
--
-------------------------------------------------------------------------------
-- File          : drp_rdwr_fsm.vhd
-- Description   : This file containts DRP bus rd/wr FSM
-- Standard      : VHDL-93
-------------------------------------------------------------------------------
-------------------------------------------------------------------------------
-- Structure:
-----------------------------------------------------------------
library IEEE;
    use IEEE.std_logic_1164.all;
    use IEEE.std_logic_unsigned.all;
    use IEEE.std_logic_arith.all;


entity  drp_rdwr_fsm is
  port (
  reset      : in   std_logic;
  dclk_arb   : in   std_logic;
  wait_cycle : in   std_logic_vector(15 downto 0);
  daddr_arb  : out  std_logic_vector(7 downto 0);
  den_arb    : out  std_logic;
  di_arb     : out  std_logic_vector(15 downto 0);
  dwe_arb    : out  std_logic;
  do_arb     : in   std_logic_vector(15 downto 0);
  drdy_arb   : in   std_logic;
  busy_arb   : out std_logic;
  temp_out   : out std_logic_vector(11 downto 0);
  temp_bus_update   : in   std_logic
);

end drp_rdwr_fsm;
architecture beh of drp_rdwr_fsm is

  type fsmstate is (WAIT_TEMP_BUS_UPDATE, WAIT_TIMER, RD_EN_CTRL_REG_40, RD_CTRL_REG_40, RD_EN_CTRL_REG_41, RD_CTRL_REG_41, WR_CTRL_REG_TEMP_40, WR_EN_TEMP_WAIT, WR_CTRL_REG_TEMP_41, RD_EN_CTRL_REG_TEMP, RD_EN_TEMP_WAIT,RD_EN_TEMP_WAIT1,RD_EN_TEMP_WAIT2, RD_CTRL_REG_TEMP, WR_CTRL_REG_40, WR_CTRL_REG_41);
  signal state : fsmstate;
  type ram_type is array (1 downto 0) of std_logic_vector (15 downto 0);
  signal RAM : ram_type;
  signal wait_timer_pulse : std_logic;
  signal timer_cntr : std_logic_vector(15 downto 0);

begin

  drp_fsm: process (dclk_arb, reset)
  begin
    if (reset = '1') then
      state <= WAIT_TEMP_BUS_UPDATE;
      daddr_arb <= X"00";
      di_arb <= X"0000";
      dwe_arb <= '0';
      den_arb <= '0';
      busy_arb <= '0';
    elsif dclk_arb'event and dclk_arb = '1' then
      case state is
         when WAIT_TEMP_BUS_UPDATE =>
                                       if temp_bus_update = '1' then
                                          state <= WAIT_TIMER;
                                       end if;
                                       dwe_arb <= '0';
                                       den_arb <= '0';
         when WAIT_TIMER           =>
                                       if wait_timer_pulse = '1' then
                                          state <= RD_EN_CTRL_REG_40;
                                       end if;
                                       den_arb <= '0';
         when RD_EN_CTRL_REG_40    =>
                                       state <= RD_CTRL_REG_40;
                                       daddr_arb <= X"40";
                                       dwe_arb <= '0';
                                       den_arb <= '1';
                                       busy_arb <= '1';
         when RD_CTRL_REG_40       =>
                                       den_arb <= '0';
                                       if drdy_arb  = '1' then
                                          RAM(0) <= do_arb;
                                          state <= RD_EN_CTRL_REG_41;
                                       end if;
         when RD_EN_CTRL_REG_41    =>
                                       state <= RD_CTRL_REG_41;
                                       daddr_arb <= X"41";
                                       dwe_arb <= '0';
                                       den_arb <= '1';
         when RD_CTRL_REG_41       =>
                                       den_arb <= '0';
                                       if drdy_arb  = '1' then
                                          RAM(1) <= do_arb;
                                          state <= WR_CTRL_REG_TEMP_40;
                                       end if;
         when WR_CTRL_REG_TEMP_40  =>
                                       state <= WR_EN_TEMP_WAIT;
                                       daddr_arb <= X"40";
                                       di_arb <= X"0000";
                                       dwe_arb <= '1';
                                       den_arb <= '1';
         when WR_EN_TEMP_WAIT  =>
                                       if drdy_arb  = '1' then
                                       state <= WR_CTRL_REG_TEMP_41;
                                       end if;
                                       dwe_arb <= '0';
                                       den_arb <= '0';
         when WR_CTRL_REG_TEMP_41  =>
                                       state <= RD_EN_TEMP_WAIT;
                                       daddr_arb <= X"41";
                                       di_arb <= X"3100";
                                       dwe_arb <= '1';
                                       den_arb <= '1';
         when RD_EN_TEMP_WAIT  =>
                                       if drdy_arb  = '1' then
                                       state <= RD_EN_CTRL_REG_TEMP;
                                       end if;
                                       dwe_arb <= '0';
                                       den_arb <= '0';
         when RD_EN_CTRL_REG_TEMP  =>
                                       state <= RD_CTRL_REG_TEMP;
                                       daddr_arb <= X"00";
                                       dwe_arb <= '0';
                                       den_arb <= '1';
         when RD_CTRL_REG_TEMP     =>
                                       den_arb <= '0';
                                       if drdy_arb  = '1' then
                                          state <= WR_CTRL_REG_40;
                                          temp_out <= do_arb(15 downto 4);
                                       end if;
         when WR_CTRL_REG_40  =>
                                       state <= RD_EN_TEMP_WAIT1;
                                       daddr_arb <= X"40";
                                       di_arb <= RAM(0);
                                       dwe_arb <= '1';
                                       den_arb <= '1';
          when RD_EN_TEMP_WAIT1  =>
                                       if drdy_arb  = '1' then
                                       state <= WR_CTRL_REG_41;
                                       end if;
                                       dwe_arb <= '0';
                                       den_arb <= '0';
          when WR_CTRL_REG_41  =>
                                       state <= RD_EN_TEMP_WAIT2;
                                       daddr_arb <= X"41";
                                       di_arb <= RAM(1);
                                       dwe_arb <= '1';
                                       den_arb <= '1';
          when RD_EN_TEMP_WAIT2  =>
                                       if drdy_arb  = '1' then
                                       state <= WAIT_TEMP_BUS_UPDATE;
                                       end if;
                                       dwe_arb <= '0';
                                       den_arb <= '0';
                                       busy_arb <= '0';
          when others               => Null;
      end case;
    end if;
  end process;

  timer_cntr_proc: process (dclk_arb, reset)
  begin
    if (reset = '1') then
       timer_cntr <= (others => '0');
       wait_timer_pulse <= '0';
    elsif dclk_arb'event and dclk_arb = '1' then
       if timer_cntr = X"0000" then
          wait_timer_pulse <= '1';
          timer_cntr <= wait_cycle;
       else
          wait_timer_pulse <= '0';
          timer_cntr <= timer_cntr - 1;
       end if;
    end if;
  end process;

end beh;
