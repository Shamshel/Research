-------------------------------------------------------------------------------
-- temp_rd_arbiter.vhd - entity/architecture pair
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
-- File          : temp_rd_arbiter.vhd
-- Description   : This file containts arbitration logic
-- Standard      : VHDL-93
-------------------------------------------------------------------------------
-------------------------------------------------------------------------------
-- Structure:
-----------------------------------------------------------------

library IEEE;
    use IEEE.std_logic_1164.all;

entity  temp_rd_arbiter is
  port (
	reset      : in   std_logic;                   -- input clock
	clk        : in   std_logic;                   -- input clock
        wait_cycle : in   std_logic_vector(15 downto 0);          
  	bgrant_B   : out  std_logic;  -- bus grant
	bbusy_B    : in   std_logic;                    -- bus busy
        daddr_B    : in   std_logic_vector(7 downto 0);
	den_B      : in   std_logic;
	di_B       : in   std_logic_vector(15 downto 0); 
	dwe_B      : in   std_logic;     
        do_B       : out  std_logic_vector(15 downto 0);          
        drdy_B     : out  std_logic;          
        daddr_C    : out  std_logic_vector(7 downto 0);
	den_C      : out  std_logic;
	di_C       : out  std_logic_vector(15 downto 0); 
	dwe_C      : out  std_logic;     
        do_C       : in   std_logic_vector(15 downto 0);          
        drdy_C     : in   std_logic;          
        temp_out   : out std_logic_vector(11 downto 0);
        temp_bus_update : in std_logic          
);

end temp_rd_arbiter;

architecture behv of temp_rd_arbiter is
	component drp_arbiter
	port(
		reset : in std_logic;
		clk : in std_logic;
		bbusy_A : in std_logic;
		bbusy_B : in std_logic;
		daddr_A : in std_logic_vector(7 downto 0);
		den_A : in std_logic;
		di_A : in std_logic_vector(15 downto 0);
		dwe_A : in std_logic;
		daddr_B : in std_logic_vector(7 downto 0);
		den_B : in std_logic;
		di_B : in std_logic_vector(15 downto 0);
		dwe_B : in std_logic;
		bgrant_A : out std_logic;
		bgrant_B : out std_logic;
		do_A : out std_logic_vector(15 downto 0);
		drdy_A : out std_logic;
		do_B : out std_logic_vector(15 downto 0);
		drdy_B : out std_logic;
                daddr_C  : out  std_logic_vector(7 downto 0);
	        den_C    : out  std_logic;
	        di_C     : out  std_logic_vector(15 downto 0); 
	        dwe_C    : out  std_logic;     
                do_C     : in   std_logic_vector(15 downto 0);          
                drdy_C   : in   std_logic;          
		temp_bus_update : IN std_logic          
		);
	end component;

	component drp_rdwr_fsm
	port(
		reset : in std_logic;
		dclk_arb : in std_logic;
   	wait_cycle : in   std_logic_vector(15 downto 0); 
		do_arb : in std_logic_vector(15 downto 0);
		drdy_arb : in std_logic;
		temp_bus_update : in std_logic;          
		daddr_arb : out std_logic_vector(7 downto 0);
		den_arb : out std_logic;
		di_arb : out std_logic_vector(15 downto 0);
		dwe_arb : out std_logic;
		busy_arb : out std_logic;
		temp_out : out std_logic_vector(11 downto 0)
		);
	end component;

        signal	daddr_A :  std_logic_vector(7 downto 0);
        signal	den_A :  std_logic;
        signal	di_A :  std_logic_vector(15 downto 0);
        signal	dwe_A :  std_logic;
        signal	do_A :  std_logic_vector(15 downto 0);
        signal	drdy_A :  std_logic;
        signal	bbusy_A :  std_logic;

begin


	Inst_drp_arbiter: drp_arbiter PORT MAP(
		reset =>    reset ,
		clk =>      clk ,
		bgrant_A => open ,
		bgrant_B => bgrant_B ,
		bbusy_A =>  bbusy_A ,
		bbusy_B =>  bbusy_B ,
		daddr_A =>  daddr_A ,
		den_A =>    den_A ,
		di_A =>     di_A ,
		dwe_A =>    dwe_A ,
		do_A =>     do_A ,
		drdy_A =>   drdy_A ,
		daddr_B =>  daddr_B ,
		den_B =>    den_B ,
		di_B =>     di_B ,
		dwe_B =>    dwe_B ,
		do_B =>     do_B ,
		drdy_B =>   drdy_B ,
		daddr_C =>  daddr_C ,
		den_C =>    den_C ,
		di_C =>     di_C ,
		dwe_C =>    dwe_C ,
		do_C =>     do_C ,
		drdy_C =>   drdy_C,
		temp_bus_update => temp_bus_update
	);

	Inst_drp_rdwr_fsm: drp_rdwr_fsm PORT MAP(
		reset => reset,
		dclk_arb => clk,
		wait_cycle => wait_cycle,
		daddr_arb => daddr_A,
		den_arb => den_A,
		di_arb => di_A,
		dwe_arb => dwe_A,
		do_arb => do_A,
		drdy_arb => drdy_A,
		busy_arb => bbusy_A,
		temp_out => temp_out,
		temp_bus_update => temp_bus_update
	);






end behv;
