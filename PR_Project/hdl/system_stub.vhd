-------------------------------------------------------------------------------
-- system_stub.vhd
-------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

library UNISIM;
use UNISIM.VCOMPONENTS.ALL;

entity system_stub is
  port (
    sm_fan_pwm_net_vcc : out std_logic;
    RS232_Uart_1_sout : out std_logic;
    RS232_Uart_1_sin : in std_logic;
    RESET : in std_logic;
    QSPI_FLASH_SS : inout std_logic;
    QSPI_FLASH_IO1 : inout std_logic;
    QSPI_FLASH_IO0 : inout std_logic;
    IIC_MAIN_SDA : inout std_logic;
    IIC_MAIN_SCL : inout std_logic;
    CLK_P : in std_logic;
    CLK_N : in std_logic;
    axi_xadc_0_VAUXP_pin : in std_logic_vector(15 downto 0);
    axi_xadc_0_VAUXN_pin : in std_logic_vector(15 downto 0);
    axi_xadc_0_CONVST_pin : in std_logic;
    axi_xadc_0_ALARM_pin : out std_logic_vector(7 downto 0);
    axi_xadc_0_TEMP_OUT_pin : out std_logic_vector(11 downto 0);
    axi_xadc_0_MUXADDR_pin : out std_logic_vector(4 downto 0);
    axi_xadc_1_VAUXP_pin : in std_logic_vector(15 downto 0);
    axi_xadc_1_VAUXN_pin : in std_logic_vector(15 downto 0);
    axi_xadc_1_CONVST_pin : in std_logic;
    axi_xadc_1_ALARM_pin : out std_logic_vector(7 downto 0);
    axi_xadc_1_TEMP_OUT_pin : out std_logic_vector(11 downto 0);
    axi_xadc_1_MUXADDR_pin : out std_logic_vector(4 downto 0)
  );
end system_stub;

architecture STRUCTURE of system_stub is

  component system is
    port (
      sm_fan_pwm_net_vcc : out std_logic;
      RS232_Uart_1_sout : out std_logic;
      RS232_Uart_1_sin : in std_logic;
      RESET : in std_logic;
      QSPI_FLASH_SS : inout std_logic;
      QSPI_FLASH_IO1 : inout std_logic;
      QSPI_FLASH_IO0 : inout std_logic;
      IIC_MAIN_SDA : inout std_logic;
      IIC_MAIN_SCL : inout std_logic;
      CLK_P : in std_logic;
      CLK_N : in std_logic;
      axi_xadc_0_VAUXP_pin : in std_logic_vector(15 downto 0);
      axi_xadc_0_VAUXN_pin : in std_logic_vector(15 downto 0);
      axi_xadc_0_CONVST_pin : in std_logic;
      axi_xadc_0_ALARM_pin : out std_logic_vector(7 downto 0);
      axi_xadc_0_TEMP_OUT_pin : out std_logic_vector(11 downto 0);
      axi_xadc_0_MUXADDR_pin : out std_logic_vector(4 downto 0);
      axi_xadc_1_VAUXP_pin : in std_logic_vector(15 downto 0);
      axi_xadc_1_VAUXN_pin : in std_logic_vector(15 downto 0);
      axi_xadc_1_CONVST_pin : in std_logic;
      axi_xadc_1_ALARM_pin : out std_logic_vector(7 downto 0);
      axi_xadc_1_TEMP_OUT_pin : out std_logic_vector(11 downto 0);
      axi_xadc_1_MUXADDR_pin : out std_logic_vector(4 downto 0)
    );
  end component;

  attribute BOX_TYPE : STRING;
  attribute BOX_TYPE of system : component is "user_black_box";

begin

  system_i : system
    port map (
      sm_fan_pwm_net_vcc => sm_fan_pwm_net_vcc,
      RS232_Uart_1_sout => RS232_Uart_1_sout,
      RS232_Uart_1_sin => RS232_Uart_1_sin,
      RESET => RESET,
      QSPI_FLASH_SS => QSPI_FLASH_SS,
      QSPI_FLASH_IO1 => QSPI_FLASH_IO1,
      QSPI_FLASH_IO0 => QSPI_FLASH_IO0,
      IIC_MAIN_SDA => IIC_MAIN_SDA,
      IIC_MAIN_SCL => IIC_MAIN_SCL,
      CLK_P => CLK_P,
      CLK_N => CLK_N,
      axi_xadc_0_VAUXP_pin => axi_xadc_0_VAUXP_pin,
      axi_xadc_0_VAUXN_pin => axi_xadc_0_VAUXN_pin,
      axi_xadc_0_CONVST_pin => axi_xadc_0_CONVST_pin,
      axi_xadc_0_ALARM_pin => axi_xadc_0_ALARM_pin,
      axi_xadc_0_TEMP_OUT_pin => axi_xadc_0_TEMP_OUT_pin,
      axi_xadc_0_MUXADDR_pin => axi_xadc_0_MUXADDR_pin,
      axi_xadc_1_VAUXP_pin => axi_xadc_1_VAUXP_pin,
      axi_xadc_1_VAUXN_pin => axi_xadc_1_VAUXN_pin,
      axi_xadc_1_CONVST_pin => axi_xadc_1_CONVST_pin,
      axi_xadc_1_ALARM_pin => axi_xadc_1_ALARM_pin,
      axi_xadc_1_TEMP_OUT_pin => axi_xadc_1_TEMP_OUT_pin,
      axi_xadc_1_MUXADDR_pin => axi_xadc_1_MUXADDR_pin
    );

end architecture STRUCTURE;

