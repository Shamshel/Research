-------------------------------------------------------------------------------
-- system_axi_xadc_1_wrapper.vhd
-------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

library UNISIM;
use UNISIM.VCOMPONENTS.ALL;

library axi_xadc_v1_00_a;
use axi_xadc_v1_00_a.all;

entity system_axi_xadc_1_wrapper is
  port (
    S_AXI_ACLK : in std_logic;
    S_AXI_ARESETN : in std_logic;
    S_AXI_AWADDR : in std_logic_vector(10 downto 0);
    S_AXI_AWVALID : in std_logic;
    S_AXI_AWREADY : out std_logic;
    S_AXI_WDATA : in std_logic_vector(31 downto 0);
    S_AXI_WSTRB : in std_logic_vector(3 downto 0);
    S_AXI_WVALID : in std_logic;
    S_AXI_WREADY : out std_logic;
    S_AXI_BRESP : out std_logic_vector(1 downto 0);
    S_AXI_BVALID : out std_logic;
    S_AXI_BREADY : in std_logic;
    S_AXI_ARADDR : in std_logic_vector(10 downto 0);
    S_AXI_ARVALID : in std_logic;
    S_AXI_ARREADY : out std_logic;
    S_AXI_RDATA : out std_logic_vector(31 downto 0);
    S_AXI_RRESP : out std_logic_vector(1 downto 0);
    S_AXI_RVALID : out std_logic;
    S_AXI_RREADY : in std_logic;
    VAUXP : in std_logic_vector(15 downto 0);
    VAUXN : in std_logic_vector(15 downto 0);
    CONVST : in std_logic;
    IP2INTC_Irpt : out std_logic;
    ALARM : out std_logic_vector(7 downto 0);
    TEMP_OUT : out std_logic_vector(11 downto 0);
    MUXADDR : out std_logic_vector(4 downto 0)
  );

  attribute x_core_info : STRING;
  attribute x_core_info of system_axi_xadc_1_wrapper : entity is "axi_xadc_v1_00_a";

end system_axi_xadc_1_wrapper;

architecture STRUCTURE of system_axi_xadc_1_wrapper is

  component axi_xadc is
    generic (
      C_FAMILY : STRING;
      C_INSTANCE : STRING;
      C_S_AXI_ADDR_WIDTH : INTEGER;
      C_S_AXI_DATA_WIDTH : INTEGER;
      C_INCLUDE_INTR : INTEGER;
      C_HAS_TEMP_BUS : INTEGER;
      C_SIM_MONITOR_FILE : STRING
    );
    port (
      S_AXI_ACLK : in std_logic;
      S_AXI_ARESETN : in std_logic;
      S_AXI_AWADDR : in std_logic_vector((C_S_AXI_ADDR_WIDTH-1) downto 0);
      S_AXI_AWVALID : in std_logic;
      S_AXI_AWREADY : out std_logic;
      S_AXI_WDATA : in std_logic_vector((C_S_AXI_DATA_WIDTH-1) downto 0);
      S_AXI_WSTRB : in std_logic_vector(((C_S_AXI_DATA_WIDTH/8)-1) downto 0);
      S_AXI_WVALID : in std_logic;
      S_AXI_WREADY : out std_logic;
      S_AXI_BRESP : out std_logic_vector(1 downto 0);
      S_AXI_BVALID : out std_logic;
      S_AXI_BREADY : in std_logic;
      S_AXI_ARADDR : in std_logic_vector((C_S_AXI_ADDR_WIDTH-1) downto 0);
      S_AXI_ARVALID : in std_logic;
      S_AXI_ARREADY : out std_logic;
      S_AXI_RDATA : out std_logic_vector((C_S_AXI_DATA_WIDTH-1) downto 0);
      S_AXI_RRESP : out std_logic_vector(1 downto 0);
      S_AXI_RVALID : out std_logic;
      S_AXI_RREADY : in std_logic;
      VAUXP : in std_logic_vector(15 downto 0);
      VAUXN : in std_logic_vector(15 downto 0);
      CONVST : in std_logic;
      IP2INTC_Irpt : out std_logic;
      ALARM : out std_logic_vector(7 downto 0);
      TEMP_OUT : out std_logic_vector(11 downto 0);
      MUXADDR : out std_logic_vector(4 downto 0)
    );
  end component;

begin

  axi_xadc_1 : axi_xadc
    generic map (
      C_FAMILY => "kintex7",
      C_INSTANCE => "axi_xadc_1",
      C_S_AXI_ADDR_WIDTH => 11,
      C_S_AXI_DATA_WIDTH => 32,
      C_INCLUDE_INTR => 1,
      C_HAS_TEMP_BUS => 1,
      C_SIM_MONITOR_FILE => "Sysmon_Design.txt"
    )
    port map (
      S_AXI_ACLK => S_AXI_ACLK,
      S_AXI_ARESETN => S_AXI_ARESETN,
      S_AXI_AWADDR => S_AXI_AWADDR,
      S_AXI_AWVALID => S_AXI_AWVALID,
      S_AXI_AWREADY => S_AXI_AWREADY,
      S_AXI_WDATA => S_AXI_WDATA,
      S_AXI_WSTRB => S_AXI_WSTRB,
      S_AXI_WVALID => S_AXI_WVALID,
      S_AXI_WREADY => S_AXI_WREADY,
      S_AXI_BRESP => S_AXI_BRESP,
      S_AXI_BVALID => S_AXI_BVALID,
      S_AXI_BREADY => S_AXI_BREADY,
      S_AXI_ARADDR => S_AXI_ARADDR,
      S_AXI_ARVALID => S_AXI_ARVALID,
      S_AXI_ARREADY => S_AXI_ARREADY,
      S_AXI_RDATA => S_AXI_RDATA,
      S_AXI_RRESP => S_AXI_RRESP,
      S_AXI_RVALID => S_AXI_RVALID,
      S_AXI_RREADY => S_AXI_RREADY,
      VAUXP => VAUXP,
      VAUXN => VAUXN,
      CONVST => CONVST,
      IP2INTC_Irpt => IP2INTC_Irpt,
      ALARM => ALARM,
      TEMP_OUT => TEMP_OUT,
      MUXADDR => MUXADDR
    );

end architecture STRUCTURE;

