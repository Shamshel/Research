-------------------------------------------------------------------------------
-- microblaze_0_bram_block_elaborate.vhd
-------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

library UNISIM;
use UNISIM.VCOMPONENTS.ALL;

entity microblaze_0_bram_block_elaborate is
  generic (
    C_MEMSIZE : integer;
    C_PORT_DWIDTH : integer;
    C_PORT_AWIDTH : integer;
    C_NUM_WE : integer;
    C_FAMILY : string
    );
  port (
    BRAM_Rst_A : in std_logic;
    BRAM_Clk_A : in std_logic;
    BRAM_EN_A : in std_logic;
    BRAM_WEN_A : in std_logic_vector(0 to C_NUM_WE-1);
    BRAM_Addr_A : in std_logic_vector(0 to C_PORT_AWIDTH-1);
    BRAM_Din_A : out std_logic_vector(0 to C_PORT_DWIDTH-1);
    BRAM_Dout_A : in std_logic_vector(0 to C_PORT_DWIDTH-1);
    BRAM_Rst_B : in std_logic;
    BRAM_Clk_B : in std_logic;
    BRAM_EN_B : in std_logic;
    BRAM_WEN_B : in std_logic_vector(0 to C_NUM_WE-1);
    BRAM_Addr_B : in std_logic_vector(0 to C_PORT_AWIDTH-1);
    BRAM_Din_B : out std_logic_vector(0 to C_PORT_DWIDTH-1);
    BRAM_Dout_B : in std_logic_vector(0 to C_PORT_DWIDTH-1)
  );

  attribute keep_hierarchy : STRING;
  attribute keep_hierarchy of microblaze_0_bram_block_elaborate : entity is "yes";

end microblaze_0_bram_block_elaborate;

architecture STRUCTURE of microblaze_0_bram_block_elaborate is

  component RAMB36E1 is
    generic (
      WRITE_MODE_A : string;
      WRITE_MODE_B : string;
      INIT_FILE : string;
      READ_WIDTH_A : integer;
      READ_WIDTH_B : integer;
      WRITE_WIDTH_A : integer;
      WRITE_WIDTH_B : integer;
      RAM_EXTENSION_A : string;
      RAM_EXTENSION_B : string
    );
    port (
      DBITERR : out std_logic;
      ECCPARITY : out std_logic_vector(7 downto 0);
      INJECTDBITERR : in std_logic;
      INJECTSBITERR : in std_logic;
      RDADDRECC : out std_logic_vector(8 downto 0);
      SBITERR : out std_logic;
      ADDRARDADDR : in std_logic_vector(15 downto 0);
      CASCADEINA : in std_logic;
      CASCADEOUTA : out std_logic;
      CLKARDCLK : in std_logic;
      DIADI : in std_logic_vector(31 downto 0);
      DIPADIP : in std_logic_vector(3 downto 0);
      DOADO : out std_logic_vector(31 downto 0);
      DOPADOP : out std_logic_vector(3 downto 0);
      ENARDEN : in std_logic;
      REGCEAREGCE : in std_logic;
      RSTRAMARSTRAM : in std_logic;
      RSTREGARSTREG : in std_logic;
      WEA : in std_logic_vector(3 downto 0);
      ADDRBWRADDR : in std_logic_vector(15 downto 0);
      CASCADEINB : in std_logic;
      CASCADEOUTB : out std_logic;
      CLKBWRCLK : in std_logic;
      DIBDI : in std_logic_vector(31 downto 0);
      DIPBDIP : in std_logic_vector(3 downto 0);
      DOBDO : out std_logic_vector(31 downto 0);
      DOPBDOP : out std_logic_vector(3 downto 0);
      ENBWREN : in std_logic;
      REGCEB : in std_logic;
      RSTRAMB : in std_logic;
      RSTREGB : in std_logic;
      WEBWE : in std_logic_vector(7 downto 0)
    );
  end component;

  attribute BMM_INFO : STRING;

  attribute BMM_INFO of ramb36e1_0: label is " ";
  attribute BMM_INFO of ramb36e1_1: label is " ";
  attribute BMM_INFO of ramb36e1_2: label is " ";
  attribute BMM_INFO of ramb36e1_3: label is " ";
  attribute BMM_INFO of ramb36e1_4: label is " ";
  attribute BMM_INFO of ramb36e1_5: label is " ";
  attribute BMM_INFO of ramb36e1_6: label is " ";
  attribute BMM_INFO of ramb36e1_7: label is " ";
  attribute BMM_INFO of ramb36e1_8: label is " ";
  attribute BMM_INFO of ramb36e1_9: label is " ";
  attribute BMM_INFO of ramb36e1_10: label is " ";
  attribute BMM_INFO of ramb36e1_11: label is " ";
  attribute BMM_INFO of ramb36e1_12: label is " ";
  attribute BMM_INFO of ramb36e1_13: label is " ";
  attribute BMM_INFO of ramb36e1_14: label is " ";
  attribute BMM_INFO of ramb36e1_15: label is " ";
  attribute BMM_INFO of ramb36e1_16: label is " ";
  attribute BMM_INFO of ramb36e1_17: label is " ";
  attribute BMM_INFO of ramb36e1_18: label is " ";
  attribute BMM_INFO of ramb36e1_19: label is " ";
  attribute BMM_INFO of ramb36e1_20: label is " ";
  attribute BMM_INFO of ramb36e1_21: label is " ";
  attribute BMM_INFO of ramb36e1_22: label is " ";
  attribute BMM_INFO of ramb36e1_23: label is " ";
  attribute BMM_INFO of ramb36e1_24: label is " ";
  attribute BMM_INFO of ramb36e1_25: label is " ";
  attribute BMM_INFO of ramb36e1_26: label is " ";
  attribute BMM_INFO of ramb36e1_27: label is " ";
  attribute BMM_INFO of ramb36e1_28: label is " ";
  attribute BMM_INFO of ramb36e1_29: label is " ";
  attribute BMM_INFO of ramb36e1_30: label is " ";
  attribute BMM_INFO of ramb36e1_31: label is " ";
  -- Internal signals

  signal net_gnd0 : std_logic;
  signal net_gnd4 : std_logic_vector(3 downto 0);
  signal pgassign1 : std_logic_vector(0 to 0);
  signal pgassign2 : std_logic_vector(0 to 30);
  signal pgassign3 : std_logic_vector(0 to 3);
  signal pgassign4 : std_logic_vector(15 downto 0);
  signal pgassign5 : std_logic_vector(31 downto 0);
  signal pgassign6 : std_logic_vector(31 downto 0);
  signal pgassign7 : std_logic_vector(3 downto 0);
  signal pgassign8 : std_logic_vector(15 downto 0);
  signal pgassign9 : std_logic_vector(31 downto 0);
  signal pgassign10 : std_logic_vector(31 downto 0);
  signal pgassign11 : std_logic_vector(7 downto 0);
  signal pgassign12 : std_logic_vector(15 downto 0);
  signal pgassign13 : std_logic_vector(31 downto 0);
  signal pgassign14 : std_logic_vector(31 downto 0);
  signal pgassign15 : std_logic_vector(3 downto 0);
  signal pgassign16 : std_logic_vector(15 downto 0);
  signal pgassign17 : std_logic_vector(31 downto 0);
  signal pgassign18 : std_logic_vector(31 downto 0);
  signal pgassign19 : std_logic_vector(7 downto 0);
  signal pgassign20 : std_logic_vector(15 downto 0);
  signal pgassign21 : std_logic_vector(31 downto 0);
  signal pgassign22 : std_logic_vector(31 downto 0);
  signal pgassign23 : std_logic_vector(3 downto 0);
  signal pgassign24 : std_logic_vector(15 downto 0);
  signal pgassign25 : std_logic_vector(31 downto 0);
  signal pgassign26 : std_logic_vector(31 downto 0);
  signal pgassign27 : std_logic_vector(7 downto 0);
  signal pgassign28 : std_logic_vector(15 downto 0);
  signal pgassign29 : std_logic_vector(31 downto 0);
  signal pgassign30 : std_logic_vector(31 downto 0);
  signal pgassign31 : std_logic_vector(3 downto 0);
  signal pgassign32 : std_logic_vector(15 downto 0);
  signal pgassign33 : std_logic_vector(31 downto 0);
  signal pgassign34 : std_logic_vector(31 downto 0);
  signal pgassign35 : std_logic_vector(7 downto 0);
  signal pgassign36 : std_logic_vector(15 downto 0);
  signal pgassign37 : std_logic_vector(31 downto 0);
  signal pgassign38 : std_logic_vector(31 downto 0);
  signal pgassign39 : std_logic_vector(3 downto 0);
  signal pgassign40 : std_logic_vector(15 downto 0);
  signal pgassign41 : std_logic_vector(31 downto 0);
  signal pgassign42 : std_logic_vector(31 downto 0);
  signal pgassign43 : std_logic_vector(7 downto 0);
  signal pgassign44 : std_logic_vector(15 downto 0);
  signal pgassign45 : std_logic_vector(31 downto 0);
  signal pgassign46 : std_logic_vector(31 downto 0);
  signal pgassign47 : std_logic_vector(3 downto 0);
  signal pgassign48 : std_logic_vector(15 downto 0);
  signal pgassign49 : std_logic_vector(31 downto 0);
  signal pgassign50 : std_logic_vector(31 downto 0);
  signal pgassign51 : std_logic_vector(7 downto 0);
  signal pgassign52 : std_logic_vector(15 downto 0);
  signal pgassign53 : std_logic_vector(31 downto 0);
  signal pgassign54 : std_logic_vector(31 downto 0);
  signal pgassign55 : std_logic_vector(3 downto 0);
  signal pgassign56 : std_logic_vector(15 downto 0);
  signal pgassign57 : std_logic_vector(31 downto 0);
  signal pgassign58 : std_logic_vector(31 downto 0);
  signal pgassign59 : std_logic_vector(7 downto 0);
  signal pgassign60 : std_logic_vector(15 downto 0);
  signal pgassign61 : std_logic_vector(31 downto 0);
  signal pgassign62 : std_logic_vector(31 downto 0);
  signal pgassign63 : std_logic_vector(3 downto 0);
  signal pgassign64 : std_logic_vector(15 downto 0);
  signal pgassign65 : std_logic_vector(31 downto 0);
  signal pgassign66 : std_logic_vector(31 downto 0);
  signal pgassign67 : std_logic_vector(7 downto 0);
  signal pgassign68 : std_logic_vector(15 downto 0);
  signal pgassign69 : std_logic_vector(31 downto 0);
  signal pgassign70 : std_logic_vector(31 downto 0);
  signal pgassign71 : std_logic_vector(3 downto 0);
  signal pgassign72 : std_logic_vector(15 downto 0);
  signal pgassign73 : std_logic_vector(31 downto 0);
  signal pgassign74 : std_logic_vector(31 downto 0);
  signal pgassign75 : std_logic_vector(7 downto 0);
  signal pgassign76 : std_logic_vector(15 downto 0);
  signal pgassign77 : std_logic_vector(31 downto 0);
  signal pgassign78 : std_logic_vector(31 downto 0);
  signal pgassign79 : std_logic_vector(3 downto 0);
  signal pgassign80 : std_logic_vector(15 downto 0);
  signal pgassign81 : std_logic_vector(31 downto 0);
  signal pgassign82 : std_logic_vector(31 downto 0);
  signal pgassign83 : std_logic_vector(7 downto 0);
  signal pgassign84 : std_logic_vector(15 downto 0);
  signal pgassign85 : std_logic_vector(31 downto 0);
  signal pgassign86 : std_logic_vector(31 downto 0);
  signal pgassign87 : std_logic_vector(3 downto 0);
  signal pgassign88 : std_logic_vector(15 downto 0);
  signal pgassign89 : std_logic_vector(31 downto 0);
  signal pgassign90 : std_logic_vector(31 downto 0);
  signal pgassign91 : std_logic_vector(7 downto 0);
  signal pgassign92 : std_logic_vector(15 downto 0);
  signal pgassign93 : std_logic_vector(31 downto 0);
  signal pgassign94 : std_logic_vector(31 downto 0);
  signal pgassign95 : std_logic_vector(3 downto 0);
  signal pgassign96 : std_logic_vector(15 downto 0);
  signal pgassign97 : std_logic_vector(31 downto 0);
  signal pgassign98 : std_logic_vector(31 downto 0);
  signal pgassign99 : std_logic_vector(7 downto 0);
  signal pgassign100 : std_logic_vector(15 downto 0);
  signal pgassign101 : std_logic_vector(31 downto 0);
  signal pgassign102 : std_logic_vector(31 downto 0);
  signal pgassign103 : std_logic_vector(3 downto 0);
  signal pgassign104 : std_logic_vector(15 downto 0);
  signal pgassign105 : std_logic_vector(31 downto 0);
  signal pgassign106 : std_logic_vector(31 downto 0);
  signal pgassign107 : std_logic_vector(7 downto 0);
  signal pgassign108 : std_logic_vector(15 downto 0);
  signal pgassign109 : std_logic_vector(31 downto 0);
  signal pgassign110 : std_logic_vector(31 downto 0);
  signal pgassign111 : std_logic_vector(3 downto 0);
  signal pgassign112 : std_logic_vector(15 downto 0);
  signal pgassign113 : std_logic_vector(31 downto 0);
  signal pgassign114 : std_logic_vector(31 downto 0);
  signal pgassign115 : std_logic_vector(7 downto 0);
  signal pgassign116 : std_logic_vector(15 downto 0);
  signal pgassign117 : std_logic_vector(31 downto 0);
  signal pgassign118 : std_logic_vector(31 downto 0);
  signal pgassign119 : std_logic_vector(3 downto 0);
  signal pgassign120 : std_logic_vector(15 downto 0);
  signal pgassign121 : std_logic_vector(31 downto 0);
  signal pgassign122 : std_logic_vector(31 downto 0);
  signal pgassign123 : std_logic_vector(7 downto 0);
  signal pgassign124 : std_logic_vector(15 downto 0);
  signal pgassign125 : std_logic_vector(31 downto 0);
  signal pgassign126 : std_logic_vector(31 downto 0);
  signal pgassign127 : std_logic_vector(3 downto 0);
  signal pgassign128 : std_logic_vector(15 downto 0);
  signal pgassign129 : std_logic_vector(31 downto 0);
  signal pgassign130 : std_logic_vector(31 downto 0);
  signal pgassign131 : std_logic_vector(7 downto 0);
  signal pgassign132 : std_logic_vector(15 downto 0);
  signal pgassign133 : std_logic_vector(31 downto 0);
  signal pgassign134 : std_logic_vector(31 downto 0);
  signal pgassign135 : std_logic_vector(3 downto 0);
  signal pgassign136 : std_logic_vector(15 downto 0);
  signal pgassign137 : std_logic_vector(31 downto 0);
  signal pgassign138 : std_logic_vector(31 downto 0);
  signal pgassign139 : std_logic_vector(7 downto 0);
  signal pgassign140 : std_logic_vector(15 downto 0);
  signal pgassign141 : std_logic_vector(31 downto 0);
  signal pgassign142 : std_logic_vector(31 downto 0);
  signal pgassign143 : std_logic_vector(3 downto 0);
  signal pgassign144 : std_logic_vector(15 downto 0);
  signal pgassign145 : std_logic_vector(31 downto 0);
  signal pgassign146 : std_logic_vector(31 downto 0);
  signal pgassign147 : std_logic_vector(7 downto 0);
  signal pgassign148 : std_logic_vector(15 downto 0);
  signal pgassign149 : std_logic_vector(31 downto 0);
  signal pgassign150 : std_logic_vector(31 downto 0);
  signal pgassign151 : std_logic_vector(3 downto 0);
  signal pgassign152 : std_logic_vector(15 downto 0);
  signal pgassign153 : std_logic_vector(31 downto 0);
  signal pgassign154 : std_logic_vector(31 downto 0);
  signal pgassign155 : std_logic_vector(7 downto 0);
  signal pgassign156 : std_logic_vector(15 downto 0);
  signal pgassign157 : std_logic_vector(31 downto 0);
  signal pgassign158 : std_logic_vector(31 downto 0);
  signal pgassign159 : std_logic_vector(3 downto 0);
  signal pgassign160 : std_logic_vector(15 downto 0);
  signal pgassign161 : std_logic_vector(31 downto 0);
  signal pgassign162 : std_logic_vector(31 downto 0);
  signal pgassign163 : std_logic_vector(7 downto 0);
  signal pgassign164 : std_logic_vector(15 downto 0);
  signal pgassign165 : std_logic_vector(31 downto 0);
  signal pgassign166 : std_logic_vector(31 downto 0);
  signal pgassign167 : std_logic_vector(3 downto 0);
  signal pgassign168 : std_logic_vector(15 downto 0);
  signal pgassign169 : std_logic_vector(31 downto 0);
  signal pgassign170 : std_logic_vector(31 downto 0);
  signal pgassign171 : std_logic_vector(7 downto 0);
  signal pgassign172 : std_logic_vector(15 downto 0);
  signal pgassign173 : std_logic_vector(31 downto 0);
  signal pgassign174 : std_logic_vector(31 downto 0);
  signal pgassign175 : std_logic_vector(3 downto 0);
  signal pgassign176 : std_logic_vector(15 downto 0);
  signal pgassign177 : std_logic_vector(31 downto 0);
  signal pgassign178 : std_logic_vector(31 downto 0);
  signal pgassign179 : std_logic_vector(7 downto 0);
  signal pgassign180 : std_logic_vector(15 downto 0);
  signal pgassign181 : std_logic_vector(31 downto 0);
  signal pgassign182 : std_logic_vector(31 downto 0);
  signal pgassign183 : std_logic_vector(3 downto 0);
  signal pgassign184 : std_logic_vector(15 downto 0);
  signal pgassign185 : std_logic_vector(31 downto 0);
  signal pgassign186 : std_logic_vector(31 downto 0);
  signal pgassign187 : std_logic_vector(7 downto 0);
  signal pgassign188 : std_logic_vector(15 downto 0);
  signal pgassign189 : std_logic_vector(31 downto 0);
  signal pgassign190 : std_logic_vector(31 downto 0);
  signal pgassign191 : std_logic_vector(3 downto 0);
  signal pgassign192 : std_logic_vector(15 downto 0);
  signal pgassign193 : std_logic_vector(31 downto 0);
  signal pgassign194 : std_logic_vector(31 downto 0);
  signal pgassign195 : std_logic_vector(7 downto 0);
  signal pgassign196 : std_logic_vector(15 downto 0);
  signal pgassign197 : std_logic_vector(31 downto 0);
  signal pgassign198 : std_logic_vector(31 downto 0);
  signal pgassign199 : std_logic_vector(3 downto 0);
  signal pgassign200 : std_logic_vector(15 downto 0);
  signal pgassign201 : std_logic_vector(31 downto 0);
  signal pgassign202 : std_logic_vector(31 downto 0);
  signal pgassign203 : std_logic_vector(7 downto 0);
  signal pgassign204 : std_logic_vector(15 downto 0);
  signal pgassign205 : std_logic_vector(31 downto 0);
  signal pgassign206 : std_logic_vector(31 downto 0);
  signal pgassign207 : std_logic_vector(3 downto 0);
  signal pgassign208 : std_logic_vector(15 downto 0);
  signal pgassign209 : std_logic_vector(31 downto 0);
  signal pgassign210 : std_logic_vector(31 downto 0);
  signal pgassign211 : std_logic_vector(7 downto 0);
  signal pgassign212 : std_logic_vector(15 downto 0);
  signal pgassign213 : std_logic_vector(31 downto 0);
  signal pgassign214 : std_logic_vector(31 downto 0);
  signal pgassign215 : std_logic_vector(3 downto 0);
  signal pgassign216 : std_logic_vector(15 downto 0);
  signal pgassign217 : std_logic_vector(31 downto 0);
  signal pgassign218 : std_logic_vector(31 downto 0);
  signal pgassign219 : std_logic_vector(7 downto 0);
  signal pgassign220 : std_logic_vector(15 downto 0);
  signal pgassign221 : std_logic_vector(31 downto 0);
  signal pgassign222 : std_logic_vector(31 downto 0);
  signal pgassign223 : std_logic_vector(3 downto 0);
  signal pgassign224 : std_logic_vector(15 downto 0);
  signal pgassign225 : std_logic_vector(31 downto 0);
  signal pgassign226 : std_logic_vector(31 downto 0);
  signal pgassign227 : std_logic_vector(7 downto 0);
  signal pgassign228 : std_logic_vector(15 downto 0);
  signal pgassign229 : std_logic_vector(31 downto 0);
  signal pgassign230 : std_logic_vector(31 downto 0);
  signal pgassign231 : std_logic_vector(3 downto 0);
  signal pgassign232 : std_logic_vector(15 downto 0);
  signal pgassign233 : std_logic_vector(31 downto 0);
  signal pgassign234 : std_logic_vector(31 downto 0);
  signal pgassign235 : std_logic_vector(7 downto 0);
  signal pgassign236 : std_logic_vector(15 downto 0);
  signal pgassign237 : std_logic_vector(31 downto 0);
  signal pgassign238 : std_logic_vector(31 downto 0);
  signal pgassign239 : std_logic_vector(3 downto 0);
  signal pgassign240 : std_logic_vector(15 downto 0);
  signal pgassign241 : std_logic_vector(31 downto 0);
  signal pgassign242 : std_logic_vector(31 downto 0);
  signal pgassign243 : std_logic_vector(7 downto 0);
  signal pgassign244 : std_logic_vector(15 downto 0);
  signal pgassign245 : std_logic_vector(31 downto 0);
  signal pgassign246 : std_logic_vector(31 downto 0);
  signal pgassign247 : std_logic_vector(3 downto 0);
  signal pgassign248 : std_logic_vector(15 downto 0);
  signal pgassign249 : std_logic_vector(31 downto 0);
  signal pgassign250 : std_logic_vector(31 downto 0);
  signal pgassign251 : std_logic_vector(7 downto 0);
  signal pgassign252 : std_logic_vector(15 downto 0);
  signal pgassign253 : std_logic_vector(31 downto 0);
  signal pgassign254 : std_logic_vector(31 downto 0);
  signal pgassign255 : std_logic_vector(3 downto 0);
  signal pgassign256 : std_logic_vector(15 downto 0);
  signal pgassign257 : std_logic_vector(31 downto 0);
  signal pgassign258 : std_logic_vector(31 downto 0);
  signal pgassign259 : std_logic_vector(7 downto 0);

begin

  -- Internal assignments

  pgassign1(0 to 0) <= B"1";
  pgassign2(0 to 30) <= B"0000000000000000000000000000000";
  pgassign3(0 to 3) <= B"0000";
  pgassign4(15 downto 15) <= B"1";
  pgassign4(14 downto 0) <= BRAM_Addr_A(15 to 29);
  pgassign5(31 downto 1) <= B"0000000000000000000000000000000";
  pgassign5(0 downto 0) <= BRAM_Dout_A(0 to 0);
  BRAM_Din_A(0 to 0) <= pgassign6(0 downto 0);
  pgassign7(3 downto 3) <= BRAM_WEN_A(0 to 0);
  pgassign7(2 downto 2) <= BRAM_WEN_A(0 to 0);
  pgassign7(1 downto 1) <= BRAM_WEN_A(0 to 0);
  pgassign7(0 downto 0) <= BRAM_WEN_A(0 to 0);
  pgassign8(15 downto 15) <= B"1";
  pgassign8(14 downto 0) <= BRAM_Addr_B(15 to 29);
  pgassign9(31 downto 1) <= B"0000000000000000000000000000000";
  pgassign9(0 downto 0) <= BRAM_Dout_B(0 to 0);
  BRAM_Din_B(0 to 0) <= pgassign10(0 downto 0);
  pgassign11(7 downto 4) <= B"0000";
  pgassign11(3 downto 3) <= BRAM_WEN_B(0 to 0);
  pgassign11(2 downto 2) <= BRAM_WEN_B(0 to 0);
  pgassign11(1 downto 1) <= BRAM_WEN_B(0 to 0);
  pgassign11(0 downto 0) <= BRAM_WEN_B(0 to 0);
  pgassign12(15 downto 15) <= B"1";
  pgassign12(14 downto 0) <= BRAM_Addr_A(15 to 29);
  pgassign13(31 downto 1) <= B"0000000000000000000000000000000";
  pgassign13(0 downto 0) <= BRAM_Dout_A(1 to 1);
  BRAM_Din_A(1 to 1) <= pgassign14(0 downto 0);
  pgassign15(3 downto 3) <= BRAM_WEN_A(0 to 0);
  pgassign15(2 downto 2) <= BRAM_WEN_A(0 to 0);
  pgassign15(1 downto 1) <= BRAM_WEN_A(0 to 0);
  pgassign15(0 downto 0) <= BRAM_WEN_A(0 to 0);
  pgassign16(15 downto 15) <= B"1";
  pgassign16(14 downto 0) <= BRAM_Addr_B(15 to 29);
  pgassign17(31 downto 1) <= B"0000000000000000000000000000000";
  pgassign17(0 downto 0) <= BRAM_Dout_B(1 to 1);
  BRAM_Din_B(1 to 1) <= pgassign18(0 downto 0);
  pgassign19(7 downto 4) <= B"0000";
  pgassign19(3 downto 3) <= BRAM_WEN_B(0 to 0);
  pgassign19(2 downto 2) <= BRAM_WEN_B(0 to 0);
  pgassign19(1 downto 1) <= BRAM_WEN_B(0 to 0);
  pgassign19(0 downto 0) <= BRAM_WEN_B(0 to 0);
  pgassign20(15 downto 15) <= B"1";
  pgassign20(14 downto 0) <= BRAM_Addr_A(15 to 29);
  pgassign21(31 downto 1) <= B"0000000000000000000000000000000";
  pgassign21(0 downto 0) <= BRAM_Dout_A(2 to 2);
  BRAM_Din_A(2 to 2) <= pgassign22(0 downto 0);
  pgassign23(3 downto 3) <= BRAM_WEN_A(0 to 0);
  pgassign23(2 downto 2) <= BRAM_WEN_A(0 to 0);
  pgassign23(1 downto 1) <= BRAM_WEN_A(0 to 0);
  pgassign23(0 downto 0) <= BRAM_WEN_A(0 to 0);
  pgassign24(15 downto 15) <= B"1";
  pgassign24(14 downto 0) <= BRAM_Addr_B(15 to 29);
  pgassign25(31 downto 1) <= B"0000000000000000000000000000000";
  pgassign25(0 downto 0) <= BRAM_Dout_B(2 to 2);
  BRAM_Din_B(2 to 2) <= pgassign26(0 downto 0);
  pgassign27(7 downto 4) <= B"0000";
  pgassign27(3 downto 3) <= BRAM_WEN_B(0 to 0);
  pgassign27(2 downto 2) <= BRAM_WEN_B(0 to 0);
  pgassign27(1 downto 1) <= BRAM_WEN_B(0 to 0);
  pgassign27(0 downto 0) <= BRAM_WEN_B(0 to 0);
  pgassign28(15 downto 15) <= B"1";
  pgassign28(14 downto 0) <= BRAM_Addr_A(15 to 29);
  pgassign29(31 downto 1) <= B"0000000000000000000000000000000";
  pgassign29(0 downto 0) <= BRAM_Dout_A(3 to 3);
  BRAM_Din_A(3 to 3) <= pgassign30(0 downto 0);
  pgassign31(3 downto 3) <= BRAM_WEN_A(0 to 0);
  pgassign31(2 downto 2) <= BRAM_WEN_A(0 to 0);
  pgassign31(1 downto 1) <= BRAM_WEN_A(0 to 0);
  pgassign31(0 downto 0) <= BRAM_WEN_A(0 to 0);
  pgassign32(15 downto 15) <= B"1";
  pgassign32(14 downto 0) <= BRAM_Addr_B(15 to 29);
  pgassign33(31 downto 1) <= B"0000000000000000000000000000000";
  pgassign33(0 downto 0) <= BRAM_Dout_B(3 to 3);
  BRAM_Din_B(3 to 3) <= pgassign34(0 downto 0);
  pgassign35(7 downto 4) <= B"0000";
  pgassign35(3 downto 3) <= BRAM_WEN_B(0 to 0);
  pgassign35(2 downto 2) <= BRAM_WEN_B(0 to 0);
  pgassign35(1 downto 1) <= BRAM_WEN_B(0 to 0);
  pgassign35(0 downto 0) <= BRAM_WEN_B(0 to 0);
  pgassign36(15 downto 15) <= B"1";
  pgassign36(14 downto 0) <= BRAM_Addr_A(15 to 29);
  pgassign37(31 downto 1) <= B"0000000000000000000000000000000";
  pgassign37(0 downto 0) <= BRAM_Dout_A(4 to 4);
  BRAM_Din_A(4 to 4) <= pgassign38(0 downto 0);
  pgassign39(3 downto 3) <= BRAM_WEN_A(0 to 0);
  pgassign39(2 downto 2) <= BRAM_WEN_A(0 to 0);
  pgassign39(1 downto 1) <= BRAM_WEN_A(0 to 0);
  pgassign39(0 downto 0) <= BRAM_WEN_A(0 to 0);
  pgassign40(15 downto 15) <= B"1";
  pgassign40(14 downto 0) <= BRAM_Addr_B(15 to 29);
  pgassign41(31 downto 1) <= B"0000000000000000000000000000000";
  pgassign41(0 downto 0) <= BRAM_Dout_B(4 to 4);
  BRAM_Din_B(4 to 4) <= pgassign42(0 downto 0);
  pgassign43(7 downto 4) <= B"0000";
  pgassign43(3 downto 3) <= BRAM_WEN_B(0 to 0);
  pgassign43(2 downto 2) <= BRAM_WEN_B(0 to 0);
  pgassign43(1 downto 1) <= BRAM_WEN_B(0 to 0);
  pgassign43(0 downto 0) <= BRAM_WEN_B(0 to 0);
  pgassign44(15 downto 15) <= B"1";
  pgassign44(14 downto 0) <= BRAM_Addr_A(15 to 29);
  pgassign45(31 downto 1) <= B"0000000000000000000000000000000";
  pgassign45(0 downto 0) <= BRAM_Dout_A(5 to 5);
  BRAM_Din_A(5 to 5) <= pgassign46(0 downto 0);
  pgassign47(3 downto 3) <= BRAM_WEN_A(0 to 0);
  pgassign47(2 downto 2) <= BRAM_WEN_A(0 to 0);
  pgassign47(1 downto 1) <= BRAM_WEN_A(0 to 0);
  pgassign47(0 downto 0) <= BRAM_WEN_A(0 to 0);
  pgassign48(15 downto 15) <= B"1";
  pgassign48(14 downto 0) <= BRAM_Addr_B(15 to 29);
  pgassign49(31 downto 1) <= B"0000000000000000000000000000000";
  pgassign49(0 downto 0) <= BRAM_Dout_B(5 to 5);
  BRAM_Din_B(5 to 5) <= pgassign50(0 downto 0);
  pgassign51(7 downto 4) <= B"0000";
  pgassign51(3 downto 3) <= BRAM_WEN_B(0 to 0);
  pgassign51(2 downto 2) <= BRAM_WEN_B(0 to 0);
  pgassign51(1 downto 1) <= BRAM_WEN_B(0 to 0);
  pgassign51(0 downto 0) <= BRAM_WEN_B(0 to 0);
  pgassign52(15 downto 15) <= B"1";
  pgassign52(14 downto 0) <= BRAM_Addr_A(15 to 29);
  pgassign53(31 downto 1) <= B"0000000000000000000000000000000";
  pgassign53(0 downto 0) <= BRAM_Dout_A(6 to 6);
  BRAM_Din_A(6 to 6) <= pgassign54(0 downto 0);
  pgassign55(3 downto 3) <= BRAM_WEN_A(0 to 0);
  pgassign55(2 downto 2) <= BRAM_WEN_A(0 to 0);
  pgassign55(1 downto 1) <= BRAM_WEN_A(0 to 0);
  pgassign55(0 downto 0) <= BRAM_WEN_A(0 to 0);
  pgassign56(15 downto 15) <= B"1";
  pgassign56(14 downto 0) <= BRAM_Addr_B(15 to 29);
  pgassign57(31 downto 1) <= B"0000000000000000000000000000000";
  pgassign57(0 downto 0) <= BRAM_Dout_B(6 to 6);
  BRAM_Din_B(6 to 6) <= pgassign58(0 downto 0);
  pgassign59(7 downto 4) <= B"0000";
  pgassign59(3 downto 3) <= BRAM_WEN_B(0 to 0);
  pgassign59(2 downto 2) <= BRAM_WEN_B(0 to 0);
  pgassign59(1 downto 1) <= BRAM_WEN_B(0 to 0);
  pgassign59(0 downto 0) <= BRAM_WEN_B(0 to 0);
  pgassign60(15 downto 15) <= B"1";
  pgassign60(14 downto 0) <= BRAM_Addr_A(15 to 29);
  pgassign61(31 downto 1) <= B"0000000000000000000000000000000";
  pgassign61(0 downto 0) <= BRAM_Dout_A(7 to 7);
  BRAM_Din_A(7 to 7) <= pgassign62(0 downto 0);
  pgassign63(3 downto 3) <= BRAM_WEN_A(0 to 0);
  pgassign63(2 downto 2) <= BRAM_WEN_A(0 to 0);
  pgassign63(1 downto 1) <= BRAM_WEN_A(0 to 0);
  pgassign63(0 downto 0) <= BRAM_WEN_A(0 to 0);
  pgassign64(15 downto 15) <= B"1";
  pgassign64(14 downto 0) <= BRAM_Addr_B(15 to 29);
  pgassign65(31 downto 1) <= B"0000000000000000000000000000000";
  pgassign65(0 downto 0) <= BRAM_Dout_B(7 to 7);
  BRAM_Din_B(7 to 7) <= pgassign66(0 downto 0);
  pgassign67(7 downto 4) <= B"0000";
  pgassign67(3 downto 3) <= BRAM_WEN_B(0 to 0);
  pgassign67(2 downto 2) <= BRAM_WEN_B(0 to 0);
  pgassign67(1 downto 1) <= BRAM_WEN_B(0 to 0);
  pgassign67(0 downto 0) <= BRAM_WEN_B(0 to 0);
  pgassign68(15 downto 15) <= B"1";
  pgassign68(14 downto 0) <= BRAM_Addr_A(15 to 29);
  pgassign69(31 downto 1) <= B"0000000000000000000000000000000";
  pgassign69(0 downto 0) <= BRAM_Dout_A(8 to 8);
  BRAM_Din_A(8 to 8) <= pgassign70(0 downto 0);
  pgassign71(3 downto 3) <= BRAM_WEN_A(1 to 1);
  pgassign71(2 downto 2) <= BRAM_WEN_A(1 to 1);
  pgassign71(1 downto 1) <= BRAM_WEN_A(1 to 1);
  pgassign71(0 downto 0) <= BRAM_WEN_A(1 to 1);
  pgassign72(15 downto 15) <= B"1";
  pgassign72(14 downto 0) <= BRAM_Addr_B(15 to 29);
  pgassign73(31 downto 1) <= B"0000000000000000000000000000000";
  pgassign73(0 downto 0) <= BRAM_Dout_B(8 to 8);
  BRAM_Din_B(8 to 8) <= pgassign74(0 downto 0);
  pgassign75(7 downto 4) <= B"0000";
  pgassign75(3 downto 3) <= BRAM_WEN_B(1 to 1);
  pgassign75(2 downto 2) <= BRAM_WEN_B(1 to 1);
  pgassign75(1 downto 1) <= BRAM_WEN_B(1 to 1);
  pgassign75(0 downto 0) <= BRAM_WEN_B(1 to 1);
  pgassign76(15 downto 15) <= B"1";
  pgassign76(14 downto 0) <= BRAM_Addr_A(15 to 29);
  pgassign77(31 downto 1) <= B"0000000000000000000000000000000";
  pgassign77(0 downto 0) <= BRAM_Dout_A(9 to 9);
  BRAM_Din_A(9 to 9) <= pgassign78(0 downto 0);
  pgassign79(3 downto 3) <= BRAM_WEN_A(1 to 1);
  pgassign79(2 downto 2) <= BRAM_WEN_A(1 to 1);
  pgassign79(1 downto 1) <= BRAM_WEN_A(1 to 1);
  pgassign79(0 downto 0) <= BRAM_WEN_A(1 to 1);
  pgassign80(15 downto 15) <= B"1";
  pgassign80(14 downto 0) <= BRAM_Addr_B(15 to 29);
  pgassign81(31 downto 1) <= B"0000000000000000000000000000000";
  pgassign81(0 downto 0) <= BRAM_Dout_B(9 to 9);
  BRAM_Din_B(9 to 9) <= pgassign82(0 downto 0);
  pgassign83(7 downto 4) <= B"0000";
  pgassign83(3 downto 3) <= BRAM_WEN_B(1 to 1);
  pgassign83(2 downto 2) <= BRAM_WEN_B(1 to 1);
  pgassign83(1 downto 1) <= BRAM_WEN_B(1 to 1);
  pgassign83(0 downto 0) <= BRAM_WEN_B(1 to 1);
  pgassign84(15 downto 15) <= B"1";
  pgassign84(14 downto 0) <= BRAM_Addr_A(15 to 29);
  pgassign85(31 downto 1) <= B"0000000000000000000000000000000";
  pgassign85(0 downto 0) <= BRAM_Dout_A(10 to 10);
  BRAM_Din_A(10 to 10) <= pgassign86(0 downto 0);
  pgassign87(3 downto 3) <= BRAM_WEN_A(1 to 1);
  pgassign87(2 downto 2) <= BRAM_WEN_A(1 to 1);
  pgassign87(1 downto 1) <= BRAM_WEN_A(1 to 1);
  pgassign87(0 downto 0) <= BRAM_WEN_A(1 to 1);
  pgassign88(15 downto 15) <= B"1";
  pgassign88(14 downto 0) <= BRAM_Addr_B(15 to 29);
  pgassign89(31 downto 1) <= B"0000000000000000000000000000000";
  pgassign89(0 downto 0) <= BRAM_Dout_B(10 to 10);
  BRAM_Din_B(10 to 10) <= pgassign90(0 downto 0);
  pgassign91(7 downto 4) <= B"0000";
  pgassign91(3 downto 3) <= BRAM_WEN_B(1 to 1);
  pgassign91(2 downto 2) <= BRAM_WEN_B(1 to 1);
  pgassign91(1 downto 1) <= BRAM_WEN_B(1 to 1);
  pgassign91(0 downto 0) <= BRAM_WEN_B(1 to 1);
  pgassign92(15 downto 15) <= B"1";
  pgassign92(14 downto 0) <= BRAM_Addr_A(15 to 29);
  pgassign93(31 downto 1) <= B"0000000000000000000000000000000";
  pgassign93(0 downto 0) <= BRAM_Dout_A(11 to 11);
  BRAM_Din_A(11 to 11) <= pgassign94(0 downto 0);
  pgassign95(3 downto 3) <= BRAM_WEN_A(1 to 1);
  pgassign95(2 downto 2) <= BRAM_WEN_A(1 to 1);
  pgassign95(1 downto 1) <= BRAM_WEN_A(1 to 1);
  pgassign95(0 downto 0) <= BRAM_WEN_A(1 to 1);
  pgassign96(15 downto 15) <= B"1";
  pgassign96(14 downto 0) <= BRAM_Addr_B(15 to 29);
  pgassign97(31 downto 1) <= B"0000000000000000000000000000000";
  pgassign97(0 downto 0) <= BRAM_Dout_B(11 to 11);
  BRAM_Din_B(11 to 11) <= pgassign98(0 downto 0);
  pgassign99(7 downto 4) <= B"0000";
  pgassign99(3 downto 3) <= BRAM_WEN_B(1 to 1);
  pgassign99(2 downto 2) <= BRAM_WEN_B(1 to 1);
  pgassign99(1 downto 1) <= BRAM_WEN_B(1 to 1);
  pgassign99(0 downto 0) <= BRAM_WEN_B(1 to 1);
  pgassign100(15 downto 15) <= B"1";
  pgassign100(14 downto 0) <= BRAM_Addr_A(15 to 29);
  pgassign101(31 downto 1) <= B"0000000000000000000000000000000";
  pgassign101(0 downto 0) <= BRAM_Dout_A(12 to 12);
  BRAM_Din_A(12 to 12) <= pgassign102(0 downto 0);
  pgassign103(3 downto 3) <= BRAM_WEN_A(1 to 1);
  pgassign103(2 downto 2) <= BRAM_WEN_A(1 to 1);
  pgassign103(1 downto 1) <= BRAM_WEN_A(1 to 1);
  pgassign103(0 downto 0) <= BRAM_WEN_A(1 to 1);
  pgassign104(15 downto 15) <= B"1";
  pgassign104(14 downto 0) <= BRAM_Addr_B(15 to 29);
  pgassign105(31 downto 1) <= B"0000000000000000000000000000000";
  pgassign105(0 downto 0) <= BRAM_Dout_B(12 to 12);
  BRAM_Din_B(12 to 12) <= pgassign106(0 downto 0);
  pgassign107(7 downto 4) <= B"0000";
  pgassign107(3 downto 3) <= BRAM_WEN_B(1 to 1);
  pgassign107(2 downto 2) <= BRAM_WEN_B(1 to 1);
  pgassign107(1 downto 1) <= BRAM_WEN_B(1 to 1);
  pgassign107(0 downto 0) <= BRAM_WEN_B(1 to 1);
  pgassign108(15 downto 15) <= B"1";
  pgassign108(14 downto 0) <= BRAM_Addr_A(15 to 29);
  pgassign109(31 downto 1) <= B"0000000000000000000000000000000";
  pgassign109(0 downto 0) <= BRAM_Dout_A(13 to 13);
  BRAM_Din_A(13 to 13) <= pgassign110(0 downto 0);
  pgassign111(3 downto 3) <= BRAM_WEN_A(1 to 1);
  pgassign111(2 downto 2) <= BRAM_WEN_A(1 to 1);
  pgassign111(1 downto 1) <= BRAM_WEN_A(1 to 1);
  pgassign111(0 downto 0) <= BRAM_WEN_A(1 to 1);
  pgassign112(15 downto 15) <= B"1";
  pgassign112(14 downto 0) <= BRAM_Addr_B(15 to 29);
  pgassign113(31 downto 1) <= B"0000000000000000000000000000000";
  pgassign113(0 downto 0) <= BRAM_Dout_B(13 to 13);
  BRAM_Din_B(13 to 13) <= pgassign114(0 downto 0);
  pgassign115(7 downto 4) <= B"0000";
  pgassign115(3 downto 3) <= BRAM_WEN_B(1 to 1);
  pgassign115(2 downto 2) <= BRAM_WEN_B(1 to 1);
  pgassign115(1 downto 1) <= BRAM_WEN_B(1 to 1);
  pgassign115(0 downto 0) <= BRAM_WEN_B(1 to 1);
  pgassign116(15 downto 15) <= B"1";
  pgassign116(14 downto 0) <= BRAM_Addr_A(15 to 29);
  pgassign117(31 downto 1) <= B"0000000000000000000000000000000";
  pgassign117(0 downto 0) <= BRAM_Dout_A(14 to 14);
  BRAM_Din_A(14 to 14) <= pgassign118(0 downto 0);
  pgassign119(3 downto 3) <= BRAM_WEN_A(1 to 1);
  pgassign119(2 downto 2) <= BRAM_WEN_A(1 to 1);
  pgassign119(1 downto 1) <= BRAM_WEN_A(1 to 1);
  pgassign119(0 downto 0) <= BRAM_WEN_A(1 to 1);
  pgassign120(15 downto 15) <= B"1";
  pgassign120(14 downto 0) <= BRAM_Addr_B(15 to 29);
  pgassign121(31 downto 1) <= B"0000000000000000000000000000000";
  pgassign121(0 downto 0) <= BRAM_Dout_B(14 to 14);
  BRAM_Din_B(14 to 14) <= pgassign122(0 downto 0);
  pgassign123(7 downto 4) <= B"0000";
  pgassign123(3 downto 3) <= BRAM_WEN_B(1 to 1);
  pgassign123(2 downto 2) <= BRAM_WEN_B(1 to 1);
  pgassign123(1 downto 1) <= BRAM_WEN_B(1 to 1);
  pgassign123(0 downto 0) <= BRAM_WEN_B(1 to 1);
  pgassign124(15 downto 15) <= B"1";
  pgassign124(14 downto 0) <= BRAM_Addr_A(15 to 29);
  pgassign125(31 downto 1) <= B"0000000000000000000000000000000";
  pgassign125(0 downto 0) <= BRAM_Dout_A(15 to 15);
  BRAM_Din_A(15 to 15) <= pgassign126(0 downto 0);
  pgassign127(3 downto 3) <= BRAM_WEN_A(1 to 1);
  pgassign127(2 downto 2) <= BRAM_WEN_A(1 to 1);
  pgassign127(1 downto 1) <= BRAM_WEN_A(1 to 1);
  pgassign127(0 downto 0) <= BRAM_WEN_A(1 to 1);
  pgassign128(15 downto 15) <= B"1";
  pgassign128(14 downto 0) <= BRAM_Addr_B(15 to 29);
  pgassign129(31 downto 1) <= B"0000000000000000000000000000000";
  pgassign129(0 downto 0) <= BRAM_Dout_B(15 to 15);
  BRAM_Din_B(15 to 15) <= pgassign130(0 downto 0);
  pgassign131(7 downto 4) <= B"0000";
  pgassign131(3 downto 3) <= BRAM_WEN_B(1 to 1);
  pgassign131(2 downto 2) <= BRAM_WEN_B(1 to 1);
  pgassign131(1 downto 1) <= BRAM_WEN_B(1 to 1);
  pgassign131(0 downto 0) <= BRAM_WEN_B(1 to 1);
  pgassign132(15 downto 15) <= B"1";
  pgassign132(14 downto 0) <= BRAM_Addr_A(15 to 29);
  pgassign133(31 downto 1) <= B"0000000000000000000000000000000";
  pgassign133(0 downto 0) <= BRAM_Dout_A(16 to 16);
  BRAM_Din_A(16 to 16) <= pgassign134(0 downto 0);
  pgassign135(3 downto 3) <= BRAM_WEN_A(2 to 2);
  pgassign135(2 downto 2) <= BRAM_WEN_A(2 to 2);
  pgassign135(1 downto 1) <= BRAM_WEN_A(2 to 2);
  pgassign135(0 downto 0) <= BRAM_WEN_A(2 to 2);
  pgassign136(15 downto 15) <= B"1";
  pgassign136(14 downto 0) <= BRAM_Addr_B(15 to 29);
  pgassign137(31 downto 1) <= B"0000000000000000000000000000000";
  pgassign137(0 downto 0) <= BRAM_Dout_B(16 to 16);
  BRAM_Din_B(16 to 16) <= pgassign138(0 downto 0);
  pgassign139(7 downto 4) <= B"0000";
  pgassign139(3 downto 3) <= BRAM_WEN_B(2 to 2);
  pgassign139(2 downto 2) <= BRAM_WEN_B(2 to 2);
  pgassign139(1 downto 1) <= BRAM_WEN_B(2 to 2);
  pgassign139(0 downto 0) <= BRAM_WEN_B(2 to 2);
  pgassign140(15 downto 15) <= B"1";
  pgassign140(14 downto 0) <= BRAM_Addr_A(15 to 29);
  pgassign141(31 downto 1) <= B"0000000000000000000000000000000";
  pgassign141(0 downto 0) <= BRAM_Dout_A(17 to 17);
  BRAM_Din_A(17 to 17) <= pgassign142(0 downto 0);
  pgassign143(3 downto 3) <= BRAM_WEN_A(2 to 2);
  pgassign143(2 downto 2) <= BRAM_WEN_A(2 to 2);
  pgassign143(1 downto 1) <= BRAM_WEN_A(2 to 2);
  pgassign143(0 downto 0) <= BRAM_WEN_A(2 to 2);
  pgassign144(15 downto 15) <= B"1";
  pgassign144(14 downto 0) <= BRAM_Addr_B(15 to 29);
  pgassign145(31 downto 1) <= B"0000000000000000000000000000000";
  pgassign145(0 downto 0) <= BRAM_Dout_B(17 to 17);
  BRAM_Din_B(17 to 17) <= pgassign146(0 downto 0);
  pgassign147(7 downto 4) <= B"0000";
  pgassign147(3 downto 3) <= BRAM_WEN_B(2 to 2);
  pgassign147(2 downto 2) <= BRAM_WEN_B(2 to 2);
  pgassign147(1 downto 1) <= BRAM_WEN_B(2 to 2);
  pgassign147(0 downto 0) <= BRAM_WEN_B(2 to 2);
  pgassign148(15 downto 15) <= B"1";
  pgassign148(14 downto 0) <= BRAM_Addr_A(15 to 29);
  pgassign149(31 downto 1) <= B"0000000000000000000000000000000";
  pgassign149(0 downto 0) <= BRAM_Dout_A(18 to 18);
  BRAM_Din_A(18 to 18) <= pgassign150(0 downto 0);
  pgassign151(3 downto 3) <= BRAM_WEN_A(2 to 2);
  pgassign151(2 downto 2) <= BRAM_WEN_A(2 to 2);
  pgassign151(1 downto 1) <= BRAM_WEN_A(2 to 2);
  pgassign151(0 downto 0) <= BRAM_WEN_A(2 to 2);
  pgassign152(15 downto 15) <= B"1";
  pgassign152(14 downto 0) <= BRAM_Addr_B(15 to 29);
  pgassign153(31 downto 1) <= B"0000000000000000000000000000000";
  pgassign153(0 downto 0) <= BRAM_Dout_B(18 to 18);
  BRAM_Din_B(18 to 18) <= pgassign154(0 downto 0);
  pgassign155(7 downto 4) <= B"0000";
  pgassign155(3 downto 3) <= BRAM_WEN_B(2 to 2);
  pgassign155(2 downto 2) <= BRAM_WEN_B(2 to 2);
  pgassign155(1 downto 1) <= BRAM_WEN_B(2 to 2);
  pgassign155(0 downto 0) <= BRAM_WEN_B(2 to 2);
  pgassign156(15 downto 15) <= B"1";
  pgassign156(14 downto 0) <= BRAM_Addr_A(15 to 29);
  pgassign157(31 downto 1) <= B"0000000000000000000000000000000";
  pgassign157(0 downto 0) <= BRAM_Dout_A(19 to 19);
  BRAM_Din_A(19 to 19) <= pgassign158(0 downto 0);
  pgassign159(3 downto 3) <= BRAM_WEN_A(2 to 2);
  pgassign159(2 downto 2) <= BRAM_WEN_A(2 to 2);
  pgassign159(1 downto 1) <= BRAM_WEN_A(2 to 2);
  pgassign159(0 downto 0) <= BRAM_WEN_A(2 to 2);
  pgassign160(15 downto 15) <= B"1";
  pgassign160(14 downto 0) <= BRAM_Addr_B(15 to 29);
  pgassign161(31 downto 1) <= B"0000000000000000000000000000000";
  pgassign161(0 downto 0) <= BRAM_Dout_B(19 to 19);
  BRAM_Din_B(19 to 19) <= pgassign162(0 downto 0);
  pgassign163(7 downto 4) <= B"0000";
  pgassign163(3 downto 3) <= BRAM_WEN_B(2 to 2);
  pgassign163(2 downto 2) <= BRAM_WEN_B(2 to 2);
  pgassign163(1 downto 1) <= BRAM_WEN_B(2 to 2);
  pgassign163(0 downto 0) <= BRAM_WEN_B(2 to 2);
  pgassign164(15 downto 15) <= B"1";
  pgassign164(14 downto 0) <= BRAM_Addr_A(15 to 29);
  pgassign165(31 downto 1) <= B"0000000000000000000000000000000";
  pgassign165(0 downto 0) <= BRAM_Dout_A(20 to 20);
  BRAM_Din_A(20 to 20) <= pgassign166(0 downto 0);
  pgassign167(3 downto 3) <= BRAM_WEN_A(2 to 2);
  pgassign167(2 downto 2) <= BRAM_WEN_A(2 to 2);
  pgassign167(1 downto 1) <= BRAM_WEN_A(2 to 2);
  pgassign167(0 downto 0) <= BRAM_WEN_A(2 to 2);
  pgassign168(15 downto 15) <= B"1";
  pgassign168(14 downto 0) <= BRAM_Addr_B(15 to 29);
  pgassign169(31 downto 1) <= B"0000000000000000000000000000000";
  pgassign169(0 downto 0) <= BRAM_Dout_B(20 to 20);
  BRAM_Din_B(20 to 20) <= pgassign170(0 downto 0);
  pgassign171(7 downto 4) <= B"0000";
  pgassign171(3 downto 3) <= BRAM_WEN_B(2 to 2);
  pgassign171(2 downto 2) <= BRAM_WEN_B(2 to 2);
  pgassign171(1 downto 1) <= BRAM_WEN_B(2 to 2);
  pgassign171(0 downto 0) <= BRAM_WEN_B(2 to 2);
  pgassign172(15 downto 15) <= B"1";
  pgassign172(14 downto 0) <= BRAM_Addr_A(15 to 29);
  pgassign173(31 downto 1) <= B"0000000000000000000000000000000";
  pgassign173(0 downto 0) <= BRAM_Dout_A(21 to 21);
  BRAM_Din_A(21 to 21) <= pgassign174(0 downto 0);
  pgassign175(3 downto 3) <= BRAM_WEN_A(2 to 2);
  pgassign175(2 downto 2) <= BRAM_WEN_A(2 to 2);
  pgassign175(1 downto 1) <= BRAM_WEN_A(2 to 2);
  pgassign175(0 downto 0) <= BRAM_WEN_A(2 to 2);
  pgassign176(15 downto 15) <= B"1";
  pgassign176(14 downto 0) <= BRAM_Addr_B(15 to 29);
  pgassign177(31 downto 1) <= B"0000000000000000000000000000000";
  pgassign177(0 downto 0) <= BRAM_Dout_B(21 to 21);
  BRAM_Din_B(21 to 21) <= pgassign178(0 downto 0);
  pgassign179(7 downto 4) <= B"0000";
  pgassign179(3 downto 3) <= BRAM_WEN_B(2 to 2);
  pgassign179(2 downto 2) <= BRAM_WEN_B(2 to 2);
  pgassign179(1 downto 1) <= BRAM_WEN_B(2 to 2);
  pgassign179(0 downto 0) <= BRAM_WEN_B(2 to 2);
  pgassign180(15 downto 15) <= B"1";
  pgassign180(14 downto 0) <= BRAM_Addr_A(15 to 29);
  pgassign181(31 downto 1) <= B"0000000000000000000000000000000";
  pgassign181(0 downto 0) <= BRAM_Dout_A(22 to 22);
  BRAM_Din_A(22 to 22) <= pgassign182(0 downto 0);
  pgassign183(3 downto 3) <= BRAM_WEN_A(2 to 2);
  pgassign183(2 downto 2) <= BRAM_WEN_A(2 to 2);
  pgassign183(1 downto 1) <= BRAM_WEN_A(2 to 2);
  pgassign183(0 downto 0) <= BRAM_WEN_A(2 to 2);
  pgassign184(15 downto 15) <= B"1";
  pgassign184(14 downto 0) <= BRAM_Addr_B(15 to 29);
  pgassign185(31 downto 1) <= B"0000000000000000000000000000000";
  pgassign185(0 downto 0) <= BRAM_Dout_B(22 to 22);
  BRAM_Din_B(22 to 22) <= pgassign186(0 downto 0);
  pgassign187(7 downto 4) <= B"0000";
  pgassign187(3 downto 3) <= BRAM_WEN_B(2 to 2);
  pgassign187(2 downto 2) <= BRAM_WEN_B(2 to 2);
  pgassign187(1 downto 1) <= BRAM_WEN_B(2 to 2);
  pgassign187(0 downto 0) <= BRAM_WEN_B(2 to 2);
  pgassign188(15 downto 15) <= B"1";
  pgassign188(14 downto 0) <= BRAM_Addr_A(15 to 29);
  pgassign189(31 downto 1) <= B"0000000000000000000000000000000";
  pgassign189(0 downto 0) <= BRAM_Dout_A(23 to 23);
  BRAM_Din_A(23 to 23) <= pgassign190(0 downto 0);
  pgassign191(3 downto 3) <= BRAM_WEN_A(2 to 2);
  pgassign191(2 downto 2) <= BRAM_WEN_A(2 to 2);
  pgassign191(1 downto 1) <= BRAM_WEN_A(2 to 2);
  pgassign191(0 downto 0) <= BRAM_WEN_A(2 to 2);
  pgassign192(15 downto 15) <= B"1";
  pgassign192(14 downto 0) <= BRAM_Addr_B(15 to 29);
  pgassign193(31 downto 1) <= B"0000000000000000000000000000000";
  pgassign193(0 downto 0) <= BRAM_Dout_B(23 to 23);
  BRAM_Din_B(23 to 23) <= pgassign194(0 downto 0);
  pgassign195(7 downto 4) <= B"0000";
  pgassign195(3 downto 3) <= BRAM_WEN_B(2 to 2);
  pgassign195(2 downto 2) <= BRAM_WEN_B(2 to 2);
  pgassign195(1 downto 1) <= BRAM_WEN_B(2 to 2);
  pgassign195(0 downto 0) <= BRAM_WEN_B(2 to 2);
  pgassign196(15 downto 15) <= B"1";
  pgassign196(14 downto 0) <= BRAM_Addr_A(15 to 29);
  pgassign197(31 downto 1) <= B"0000000000000000000000000000000";
  pgassign197(0 downto 0) <= BRAM_Dout_A(24 to 24);
  BRAM_Din_A(24 to 24) <= pgassign198(0 downto 0);
  pgassign199(3 downto 3) <= BRAM_WEN_A(3 to 3);
  pgassign199(2 downto 2) <= BRAM_WEN_A(3 to 3);
  pgassign199(1 downto 1) <= BRAM_WEN_A(3 to 3);
  pgassign199(0 downto 0) <= BRAM_WEN_A(3 to 3);
  pgassign200(15 downto 15) <= B"1";
  pgassign200(14 downto 0) <= BRAM_Addr_B(15 to 29);
  pgassign201(31 downto 1) <= B"0000000000000000000000000000000";
  pgassign201(0 downto 0) <= BRAM_Dout_B(24 to 24);
  BRAM_Din_B(24 to 24) <= pgassign202(0 downto 0);
  pgassign203(7 downto 4) <= B"0000";
  pgassign203(3 downto 3) <= BRAM_WEN_B(3 to 3);
  pgassign203(2 downto 2) <= BRAM_WEN_B(3 to 3);
  pgassign203(1 downto 1) <= BRAM_WEN_B(3 to 3);
  pgassign203(0 downto 0) <= BRAM_WEN_B(3 to 3);
  pgassign204(15 downto 15) <= B"1";
  pgassign204(14 downto 0) <= BRAM_Addr_A(15 to 29);
  pgassign205(31 downto 1) <= B"0000000000000000000000000000000";
  pgassign205(0 downto 0) <= BRAM_Dout_A(25 to 25);
  BRAM_Din_A(25 to 25) <= pgassign206(0 downto 0);
  pgassign207(3 downto 3) <= BRAM_WEN_A(3 to 3);
  pgassign207(2 downto 2) <= BRAM_WEN_A(3 to 3);
  pgassign207(1 downto 1) <= BRAM_WEN_A(3 to 3);
  pgassign207(0 downto 0) <= BRAM_WEN_A(3 to 3);
  pgassign208(15 downto 15) <= B"1";
  pgassign208(14 downto 0) <= BRAM_Addr_B(15 to 29);
  pgassign209(31 downto 1) <= B"0000000000000000000000000000000";
  pgassign209(0 downto 0) <= BRAM_Dout_B(25 to 25);
  BRAM_Din_B(25 to 25) <= pgassign210(0 downto 0);
  pgassign211(7 downto 4) <= B"0000";
  pgassign211(3 downto 3) <= BRAM_WEN_B(3 to 3);
  pgassign211(2 downto 2) <= BRAM_WEN_B(3 to 3);
  pgassign211(1 downto 1) <= BRAM_WEN_B(3 to 3);
  pgassign211(0 downto 0) <= BRAM_WEN_B(3 to 3);
  pgassign212(15 downto 15) <= B"1";
  pgassign212(14 downto 0) <= BRAM_Addr_A(15 to 29);
  pgassign213(31 downto 1) <= B"0000000000000000000000000000000";
  pgassign213(0 downto 0) <= BRAM_Dout_A(26 to 26);
  BRAM_Din_A(26 to 26) <= pgassign214(0 downto 0);
  pgassign215(3 downto 3) <= BRAM_WEN_A(3 to 3);
  pgassign215(2 downto 2) <= BRAM_WEN_A(3 to 3);
  pgassign215(1 downto 1) <= BRAM_WEN_A(3 to 3);
  pgassign215(0 downto 0) <= BRAM_WEN_A(3 to 3);
  pgassign216(15 downto 15) <= B"1";
  pgassign216(14 downto 0) <= BRAM_Addr_B(15 to 29);
  pgassign217(31 downto 1) <= B"0000000000000000000000000000000";
  pgassign217(0 downto 0) <= BRAM_Dout_B(26 to 26);
  BRAM_Din_B(26 to 26) <= pgassign218(0 downto 0);
  pgassign219(7 downto 4) <= B"0000";
  pgassign219(3 downto 3) <= BRAM_WEN_B(3 to 3);
  pgassign219(2 downto 2) <= BRAM_WEN_B(3 to 3);
  pgassign219(1 downto 1) <= BRAM_WEN_B(3 to 3);
  pgassign219(0 downto 0) <= BRAM_WEN_B(3 to 3);
  pgassign220(15 downto 15) <= B"1";
  pgassign220(14 downto 0) <= BRAM_Addr_A(15 to 29);
  pgassign221(31 downto 1) <= B"0000000000000000000000000000000";
  pgassign221(0 downto 0) <= BRAM_Dout_A(27 to 27);
  BRAM_Din_A(27 to 27) <= pgassign222(0 downto 0);
  pgassign223(3 downto 3) <= BRAM_WEN_A(3 to 3);
  pgassign223(2 downto 2) <= BRAM_WEN_A(3 to 3);
  pgassign223(1 downto 1) <= BRAM_WEN_A(3 to 3);
  pgassign223(0 downto 0) <= BRAM_WEN_A(3 to 3);
  pgassign224(15 downto 15) <= B"1";
  pgassign224(14 downto 0) <= BRAM_Addr_B(15 to 29);
  pgassign225(31 downto 1) <= B"0000000000000000000000000000000";
  pgassign225(0 downto 0) <= BRAM_Dout_B(27 to 27);
  BRAM_Din_B(27 to 27) <= pgassign226(0 downto 0);
  pgassign227(7 downto 4) <= B"0000";
  pgassign227(3 downto 3) <= BRAM_WEN_B(3 to 3);
  pgassign227(2 downto 2) <= BRAM_WEN_B(3 to 3);
  pgassign227(1 downto 1) <= BRAM_WEN_B(3 to 3);
  pgassign227(0 downto 0) <= BRAM_WEN_B(3 to 3);
  pgassign228(15 downto 15) <= B"1";
  pgassign228(14 downto 0) <= BRAM_Addr_A(15 to 29);
  pgassign229(31 downto 1) <= B"0000000000000000000000000000000";
  pgassign229(0 downto 0) <= BRAM_Dout_A(28 to 28);
  BRAM_Din_A(28 to 28) <= pgassign230(0 downto 0);
  pgassign231(3 downto 3) <= BRAM_WEN_A(3 to 3);
  pgassign231(2 downto 2) <= BRAM_WEN_A(3 to 3);
  pgassign231(1 downto 1) <= BRAM_WEN_A(3 to 3);
  pgassign231(0 downto 0) <= BRAM_WEN_A(3 to 3);
  pgassign232(15 downto 15) <= B"1";
  pgassign232(14 downto 0) <= BRAM_Addr_B(15 to 29);
  pgassign233(31 downto 1) <= B"0000000000000000000000000000000";
  pgassign233(0 downto 0) <= BRAM_Dout_B(28 to 28);
  BRAM_Din_B(28 to 28) <= pgassign234(0 downto 0);
  pgassign235(7 downto 4) <= B"0000";
  pgassign235(3 downto 3) <= BRAM_WEN_B(3 to 3);
  pgassign235(2 downto 2) <= BRAM_WEN_B(3 to 3);
  pgassign235(1 downto 1) <= BRAM_WEN_B(3 to 3);
  pgassign235(0 downto 0) <= BRAM_WEN_B(3 to 3);
  pgassign236(15 downto 15) <= B"1";
  pgassign236(14 downto 0) <= BRAM_Addr_A(15 to 29);
  pgassign237(31 downto 1) <= B"0000000000000000000000000000000";
  pgassign237(0 downto 0) <= BRAM_Dout_A(29 to 29);
  BRAM_Din_A(29 to 29) <= pgassign238(0 downto 0);
  pgassign239(3 downto 3) <= BRAM_WEN_A(3 to 3);
  pgassign239(2 downto 2) <= BRAM_WEN_A(3 to 3);
  pgassign239(1 downto 1) <= BRAM_WEN_A(3 to 3);
  pgassign239(0 downto 0) <= BRAM_WEN_A(3 to 3);
  pgassign240(15 downto 15) <= B"1";
  pgassign240(14 downto 0) <= BRAM_Addr_B(15 to 29);
  pgassign241(31 downto 1) <= B"0000000000000000000000000000000";
  pgassign241(0 downto 0) <= BRAM_Dout_B(29 to 29);
  BRAM_Din_B(29 to 29) <= pgassign242(0 downto 0);
  pgassign243(7 downto 4) <= B"0000";
  pgassign243(3 downto 3) <= BRAM_WEN_B(3 to 3);
  pgassign243(2 downto 2) <= BRAM_WEN_B(3 to 3);
  pgassign243(1 downto 1) <= BRAM_WEN_B(3 to 3);
  pgassign243(0 downto 0) <= BRAM_WEN_B(3 to 3);
  pgassign244(15 downto 15) <= B"1";
  pgassign244(14 downto 0) <= BRAM_Addr_A(15 to 29);
  pgassign245(31 downto 1) <= B"0000000000000000000000000000000";
  pgassign245(0 downto 0) <= BRAM_Dout_A(30 to 30);
  BRAM_Din_A(30 to 30) <= pgassign246(0 downto 0);
  pgassign247(3 downto 3) <= BRAM_WEN_A(3 to 3);
  pgassign247(2 downto 2) <= BRAM_WEN_A(3 to 3);
  pgassign247(1 downto 1) <= BRAM_WEN_A(3 to 3);
  pgassign247(0 downto 0) <= BRAM_WEN_A(3 to 3);
  pgassign248(15 downto 15) <= B"1";
  pgassign248(14 downto 0) <= BRAM_Addr_B(15 to 29);
  pgassign249(31 downto 1) <= B"0000000000000000000000000000000";
  pgassign249(0 downto 0) <= BRAM_Dout_B(30 to 30);
  BRAM_Din_B(30 to 30) <= pgassign250(0 downto 0);
  pgassign251(7 downto 4) <= B"0000";
  pgassign251(3 downto 3) <= BRAM_WEN_B(3 to 3);
  pgassign251(2 downto 2) <= BRAM_WEN_B(3 to 3);
  pgassign251(1 downto 1) <= BRAM_WEN_B(3 to 3);
  pgassign251(0 downto 0) <= BRAM_WEN_B(3 to 3);
  pgassign252(15 downto 15) <= B"1";
  pgassign252(14 downto 0) <= BRAM_Addr_A(15 to 29);
  pgassign253(31 downto 1) <= B"0000000000000000000000000000000";
  pgassign253(0 downto 0) <= BRAM_Dout_A(31 to 31);
  BRAM_Din_A(31 to 31) <= pgassign254(0 downto 0);
  pgassign255(3 downto 3) <= BRAM_WEN_A(3 to 3);
  pgassign255(2 downto 2) <= BRAM_WEN_A(3 to 3);
  pgassign255(1 downto 1) <= BRAM_WEN_A(3 to 3);
  pgassign255(0 downto 0) <= BRAM_WEN_A(3 to 3);
  pgassign256(15 downto 15) <= B"1";
  pgassign256(14 downto 0) <= BRAM_Addr_B(15 to 29);
  pgassign257(31 downto 1) <= B"0000000000000000000000000000000";
  pgassign257(0 downto 0) <= BRAM_Dout_B(31 to 31);
  BRAM_Din_B(31 to 31) <= pgassign258(0 downto 0);
  pgassign259(7 downto 4) <= B"0000";
  pgassign259(3 downto 3) <= BRAM_WEN_B(3 to 3);
  pgassign259(2 downto 2) <= BRAM_WEN_B(3 to 3);
  pgassign259(1 downto 1) <= BRAM_WEN_B(3 to 3);
  pgassign259(0 downto 0) <= BRAM_WEN_B(3 to 3);
  net_gnd0 <= '0';
  net_gnd4(3 downto 0) <= B"0000";

  ramb36e1_0 : RAMB36E1
    generic map (
      WRITE_MODE_A => "WRITE_FIRST",
      WRITE_MODE_B => "WRITE_FIRST",
      INIT_FILE => "microblaze_0_bram_block_combined_0.mem",
      READ_WIDTH_A => 1,
      READ_WIDTH_B => 1,
      WRITE_WIDTH_A => 1,
      WRITE_WIDTH_B => 1,
      RAM_EXTENSION_A => "NONE",
      RAM_EXTENSION_B => "NONE"
    )
    port map (
      DBITERR => open,
      ECCPARITY => open,
      INJECTDBITERR => net_gnd0,
      INJECTSBITERR => net_gnd0,
      RDADDRECC => open,
      SBITERR => open,
      ADDRARDADDR => pgassign4,
      CASCADEINA => net_gnd0,
      CASCADEOUTA => open,
      CLKARDCLK => BRAM_Clk_A,
      DIADI => pgassign5,
      DIPADIP => net_gnd4,
      DOADO => pgassign6,
      DOPADOP => open,
      ENARDEN => BRAM_EN_A,
      REGCEAREGCE => net_gnd0,
      RSTRAMARSTRAM => BRAM_Rst_A,
      RSTREGARSTREG => net_gnd0,
      WEA => pgassign7,
      ADDRBWRADDR => pgassign8,
      CASCADEINB => net_gnd0,
      CASCADEOUTB => open,
      CLKBWRCLK => BRAM_Clk_B,
      DIBDI => pgassign9,
      DIPBDIP => net_gnd4,
      DOBDO => pgassign10,
      DOPBDOP => open,
      ENBWREN => BRAM_EN_B,
      REGCEB => net_gnd0,
      RSTRAMB => BRAM_Rst_B,
      RSTREGB => net_gnd0,
      WEBWE => pgassign11
    );

  ramb36e1_1 : RAMB36E1
    generic map (
      WRITE_MODE_A => "WRITE_FIRST",
      WRITE_MODE_B => "WRITE_FIRST",
      INIT_FILE => "microblaze_0_bram_block_combined_1.mem",
      READ_WIDTH_A => 1,
      READ_WIDTH_B => 1,
      WRITE_WIDTH_A => 1,
      WRITE_WIDTH_B => 1,
      RAM_EXTENSION_A => "NONE",
      RAM_EXTENSION_B => "NONE"
    )
    port map (
      DBITERR => open,
      ECCPARITY => open,
      INJECTDBITERR => net_gnd0,
      INJECTSBITERR => net_gnd0,
      RDADDRECC => open,
      SBITERR => open,
      ADDRARDADDR => pgassign12,
      CASCADEINA => net_gnd0,
      CASCADEOUTA => open,
      CLKARDCLK => BRAM_Clk_A,
      DIADI => pgassign13,
      DIPADIP => net_gnd4,
      DOADO => pgassign14,
      DOPADOP => open,
      ENARDEN => BRAM_EN_A,
      REGCEAREGCE => net_gnd0,
      RSTRAMARSTRAM => BRAM_Rst_A,
      RSTREGARSTREG => net_gnd0,
      WEA => pgassign15,
      ADDRBWRADDR => pgassign16,
      CASCADEINB => net_gnd0,
      CASCADEOUTB => open,
      CLKBWRCLK => BRAM_Clk_B,
      DIBDI => pgassign17,
      DIPBDIP => net_gnd4,
      DOBDO => pgassign18,
      DOPBDOP => open,
      ENBWREN => BRAM_EN_B,
      REGCEB => net_gnd0,
      RSTRAMB => BRAM_Rst_B,
      RSTREGB => net_gnd0,
      WEBWE => pgassign19
    );

  ramb36e1_2 : RAMB36E1
    generic map (
      WRITE_MODE_A => "WRITE_FIRST",
      WRITE_MODE_B => "WRITE_FIRST",
      INIT_FILE => "microblaze_0_bram_block_combined_2.mem",
      READ_WIDTH_A => 1,
      READ_WIDTH_B => 1,
      WRITE_WIDTH_A => 1,
      WRITE_WIDTH_B => 1,
      RAM_EXTENSION_A => "NONE",
      RAM_EXTENSION_B => "NONE"
    )
    port map (
      DBITERR => open,
      ECCPARITY => open,
      INJECTDBITERR => net_gnd0,
      INJECTSBITERR => net_gnd0,
      RDADDRECC => open,
      SBITERR => open,
      ADDRARDADDR => pgassign20,
      CASCADEINA => net_gnd0,
      CASCADEOUTA => open,
      CLKARDCLK => BRAM_Clk_A,
      DIADI => pgassign21,
      DIPADIP => net_gnd4,
      DOADO => pgassign22,
      DOPADOP => open,
      ENARDEN => BRAM_EN_A,
      REGCEAREGCE => net_gnd0,
      RSTRAMARSTRAM => BRAM_Rst_A,
      RSTREGARSTREG => net_gnd0,
      WEA => pgassign23,
      ADDRBWRADDR => pgassign24,
      CASCADEINB => net_gnd0,
      CASCADEOUTB => open,
      CLKBWRCLK => BRAM_Clk_B,
      DIBDI => pgassign25,
      DIPBDIP => net_gnd4,
      DOBDO => pgassign26,
      DOPBDOP => open,
      ENBWREN => BRAM_EN_B,
      REGCEB => net_gnd0,
      RSTRAMB => BRAM_Rst_B,
      RSTREGB => net_gnd0,
      WEBWE => pgassign27
    );

  ramb36e1_3 : RAMB36E1
    generic map (
      WRITE_MODE_A => "WRITE_FIRST",
      WRITE_MODE_B => "WRITE_FIRST",
      INIT_FILE => "microblaze_0_bram_block_combined_3.mem",
      READ_WIDTH_A => 1,
      READ_WIDTH_B => 1,
      WRITE_WIDTH_A => 1,
      WRITE_WIDTH_B => 1,
      RAM_EXTENSION_A => "NONE",
      RAM_EXTENSION_B => "NONE"
    )
    port map (
      DBITERR => open,
      ECCPARITY => open,
      INJECTDBITERR => net_gnd0,
      INJECTSBITERR => net_gnd0,
      RDADDRECC => open,
      SBITERR => open,
      ADDRARDADDR => pgassign28,
      CASCADEINA => net_gnd0,
      CASCADEOUTA => open,
      CLKARDCLK => BRAM_Clk_A,
      DIADI => pgassign29,
      DIPADIP => net_gnd4,
      DOADO => pgassign30,
      DOPADOP => open,
      ENARDEN => BRAM_EN_A,
      REGCEAREGCE => net_gnd0,
      RSTRAMARSTRAM => BRAM_Rst_A,
      RSTREGARSTREG => net_gnd0,
      WEA => pgassign31,
      ADDRBWRADDR => pgassign32,
      CASCADEINB => net_gnd0,
      CASCADEOUTB => open,
      CLKBWRCLK => BRAM_Clk_B,
      DIBDI => pgassign33,
      DIPBDIP => net_gnd4,
      DOBDO => pgassign34,
      DOPBDOP => open,
      ENBWREN => BRAM_EN_B,
      REGCEB => net_gnd0,
      RSTRAMB => BRAM_Rst_B,
      RSTREGB => net_gnd0,
      WEBWE => pgassign35
    );

  ramb36e1_4 : RAMB36E1
    generic map (
      WRITE_MODE_A => "WRITE_FIRST",
      WRITE_MODE_B => "WRITE_FIRST",
      INIT_FILE => "microblaze_0_bram_block_combined_4.mem",
      READ_WIDTH_A => 1,
      READ_WIDTH_B => 1,
      WRITE_WIDTH_A => 1,
      WRITE_WIDTH_B => 1,
      RAM_EXTENSION_A => "NONE",
      RAM_EXTENSION_B => "NONE"
    )
    port map (
      DBITERR => open,
      ECCPARITY => open,
      INJECTDBITERR => net_gnd0,
      INJECTSBITERR => net_gnd0,
      RDADDRECC => open,
      SBITERR => open,
      ADDRARDADDR => pgassign36,
      CASCADEINA => net_gnd0,
      CASCADEOUTA => open,
      CLKARDCLK => BRAM_Clk_A,
      DIADI => pgassign37,
      DIPADIP => net_gnd4,
      DOADO => pgassign38,
      DOPADOP => open,
      ENARDEN => BRAM_EN_A,
      REGCEAREGCE => net_gnd0,
      RSTRAMARSTRAM => BRAM_Rst_A,
      RSTREGARSTREG => net_gnd0,
      WEA => pgassign39,
      ADDRBWRADDR => pgassign40,
      CASCADEINB => net_gnd0,
      CASCADEOUTB => open,
      CLKBWRCLK => BRAM_Clk_B,
      DIBDI => pgassign41,
      DIPBDIP => net_gnd4,
      DOBDO => pgassign42,
      DOPBDOP => open,
      ENBWREN => BRAM_EN_B,
      REGCEB => net_gnd0,
      RSTRAMB => BRAM_Rst_B,
      RSTREGB => net_gnd0,
      WEBWE => pgassign43
    );

  ramb36e1_5 : RAMB36E1
    generic map (
      WRITE_MODE_A => "WRITE_FIRST",
      WRITE_MODE_B => "WRITE_FIRST",
      INIT_FILE => "microblaze_0_bram_block_combined_5.mem",
      READ_WIDTH_A => 1,
      READ_WIDTH_B => 1,
      WRITE_WIDTH_A => 1,
      WRITE_WIDTH_B => 1,
      RAM_EXTENSION_A => "NONE",
      RAM_EXTENSION_B => "NONE"
    )
    port map (
      DBITERR => open,
      ECCPARITY => open,
      INJECTDBITERR => net_gnd0,
      INJECTSBITERR => net_gnd0,
      RDADDRECC => open,
      SBITERR => open,
      ADDRARDADDR => pgassign44,
      CASCADEINA => net_gnd0,
      CASCADEOUTA => open,
      CLKARDCLK => BRAM_Clk_A,
      DIADI => pgassign45,
      DIPADIP => net_gnd4,
      DOADO => pgassign46,
      DOPADOP => open,
      ENARDEN => BRAM_EN_A,
      REGCEAREGCE => net_gnd0,
      RSTRAMARSTRAM => BRAM_Rst_A,
      RSTREGARSTREG => net_gnd0,
      WEA => pgassign47,
      ADDRBWRADDR => pgassign48,
      CASCADEINB => net_gnd0,
      CASCADEOUTB => open,
      CLKBWRCLK => BRAM_Clk_B,
      DIBDI => pgassign49,
      DIPBDIP => net_gnd4,
      DOBDO => pgassign50,
      DOPBDOP => open,
      ENBWREN => BRAM_EN_B,
      REGCEB => net_gnd0,
      RSTRAMB => BRAM_Rst_B,
      RSTREGB => net_gnd0,
      WEBWE => pgassign51
    );

  ramb36e1_6 : RAMB36E1
    generic map (
      WRITE_MODE_A => "WRITE_FIRST",
      WRITE_MODE_B => "WRITE_FIRST",
      INIT_FILE => "microblaze_0_bram_block_combined_6.mem",
      READ_WIDTH_A => 1,
      READ_WIDTH_B => 1,
      WRITE_WIDTH_A => 1,
      WRITE_WIDTH_B => 1,
      RAM_EXTENSION_A => "NONE",
      RAM_EXTENSION_B => "NONE"
    )
    port map (
      DBITERR => open,
      ECCPARITY => open,
      INJECTDBITERR => net_gnd0,
      INJECTSBITERR => net_gnd0,
      RDADDRECC => open,
      SBITERR => open,
      ADDRARDADDR => pgassign52,
      CASCADEINA => net_gnd0,
      CASCADEOUTA => open,
      CLKARDCLK => BRAM_Clk_A,
      DIADI => pgassign53,
      DIPADIP => net_gnd4,
      DOADO => pgassign54,
      DOPADOP => open,
      ENARDEN => BRAM_EN_A,
      REGCEAREGCE => net_gnd0,
      RSTRAMARSTRAM => BRAM_Rst_A,
      RSTREGARSTREG => net_gnd0,
      WEA => pgassign55,
      ADDRBWRADDR => pgassign56,
      CASCADEINB => net_gnd0,
      CASCADEOUTB => open,
      CLKBWRCLK => BRAM_Clk_B,
      DIBDI => pgassign57,
      DIPBDIP => net_gnd4,
      DOBDO => pgassign58,
      DOPBDOP => open,
      ENBWREN => BRAM_EN_B,
      REGCEB => net_gnd0,
      RSTRAMB => BRAM_Rst_B,
      RSTREGB => net_gnd0,
      WEBWE => pgassign59
    );

  ramb36e1_7 : RAMB36E1
    generic map (
      WRITE_MODE_A => "WRITE_FIRST",
      WRITE_MODE_B => "WRITE_FIRST",
      INIT_FILE => "microblaze_0_bram_block_combined_7.mem",
      READ_WIDTH_A => 1,
      READ_WIDTH_B => 1,
      WRITE_WIDTH_A => 1,
      WRITE_WIDTH_B => 1,
      RAM_EXTENSION_A => "NONE",
      RAM_EXTENSION_B => "NONE"
    )
    port map (
      DBITERR => open,
      ECCPARITY => open,
      INJECTDBITERR => net_gnd0,
      INJECTSBITERR => net_gnd0,
      RDADDRECC => open,
      SBITERR => open,
      ADDRARDADDR => pgassign60,
      CASCADEINA => net_gnd0,
      CASCADEOUTA => open,
      CLKARDCLK => BRAM_Clk_A,
      DIADI => pgassign61,
      DIPADIP => net_gnd4,
      DOADO => pgassign62,
      DOPADOP => open,
      ENARDEN => BRAM_EN_A,
      REGCEAREGCE => net_gnd0,
      RSTRAMARSTRAM => BRAM_Rst_A,
      RSTREGARSTREG => net_gnd0,
      WEA => pgassign63,
      ADDRBWRADDR => pgassign64,
      CASCADEINB => net_gnd0,
      CASCADEOUTB => open,
      CLKBWRCLK => BRAM_Clk_B,
      DIBDI => pgassign65,
      DIPBDIP => net_gnd4,
      DOBDO => pgassign66,
      DOPBDOP => open,
      ENBWREN => BRAM_EN_B,
      REGCEB => net_gnd0,
      RSTRAMB => BRAM_Rst_B,
      RSTREGB => net_gnd0,
      WEBWE => pgassign67
    );

  ramb36e1_8 : RAMB36E1
    generic map (
      WRITE_MODE_A => "WRITE_FIRST",
      WRITE_MODE_B => "WRITE_FIRST",
      INIT_FILE => "microblaze_0_bram_block_combined_8.mem",
      READ_WIDTH_A => 1,
      READ_WIDTH_B => 1,
      WRITE_WIDTH_A => 1,
      WRITE_WIDTH_B => 1,
      RAM_EXTENSION_A => "NONE",
      RAM_EXTENSION_B => "NONE"
    )
    port map (
      DBITERR => open,
      ECCPARITY => open,
      INJECTDBITERR => net_gnd0,
      INJECTSBITERR => net_gnd0,
      RDADDRECC => open,
      SBITERR => open,
      ADDRARDADDR => pgassign68,
      CASCADEINA => net_gnd0,
      CASCADEOUTA => open,
      CLKARDCLK => BRAM_Clk_A,
      DIADI => pgassign69,
      DIPADIP => net_gnd4,
      DOADO => pgassign70,
      DOPADOP => open,
      ENARDEN => BRAM_EN_A,
      REGCEAREGCE => net_gnd0,
      RSTRAMARSTRAM => BRAM_Rst_A,
      RSTREGARSTREG => net_gnd0,
      WEA => pgassign71,
      ADDRBWRADDR => pgassign72,
      CASCADEINB => net_gnd0,
      CASCADEOUTB => open,
      CLKBWRCLK => BRAM_Clk_B,
      DIBDI => pgassign73,
      DIPBDIP => net_gnd4,
      DOBDO => pgassign74,
      DOPBDOP => open,
      ENBWREN => BRAM_EN_B,
      REGCEB => net_gnd0,
      RSTRAMB => BRAM_Rst_B,
      RSTREGB => net_gnd0,
      WEBWE => pgassign75
    );

  ramb36e1_9 : RAMB36E1
    generic map (
      WRITE_MODE_A => "WRITE_FIRST",
      WRITE_MODE_B => "WRITE_FIRST",
      INIT_FILE => "microblaze_0_bram_block_combined_9.mem",
      READ_WIDTH_A => 1,
      READ_WIDTH_B => 1,
      WRITE_WIDTH_A => 1,
      WRITE_WIDTH_B => 1,
      RAM_EXTENSION_A => "NONE",
      RAM_EXTENSION_B => "NONE"
    )
    port map (
      DBITERR => open,
      ECCPARITY => open,
      INJECTDBITERR => net_gnd0,
      INJECTSBITERR => net_gnd0,
      RDADDRECC => open,
      SBITERR => open,
      ADDRARDADDR => pgassign76,
      CASCADEINA => net_gnd0,
      CASCADEOUTA => open,
      CLKARDCLK => BRAM_Clk_A,
      DIADI => pgassign77,
      DIPADIP => net_gnd4,
      DOADO => pgassign78,
      DOPADOP => open,
      ENARDEN => BRAM_EN_A,
      REGCEAREGCE => net_gnd0,
      RSTRAMARSTRAM => BRAM_Rst_A,
      RSTREGARSTREG => net_gnd0,
      WEA => pgassign79,
      ADDRBWRADDR => pgassign80,
      CASCADEINB => net_gnd0,
      CASCADEOUTB => open,
      CLKBWRCLK => BRAM_Clk_B,
      DIBDI => pgassign81,
      DIPBDIP => net_gnd4,
      DOBDO => pgassign82,
      DOPBDOP => open,
      ENBWREN => BRAM_EN_B,
      REGCEB => net_gnd0,
      RSTRAMB => BRAM_Rst_B,
      RSTREGB => net_gnd0,
      WEBWE => pgassign83
    );

  ramb36e1_10 : RAMB36E1
    generic map (
      WRITE_MODE_A => "WRITE_FIRST",
      WRITE_MODE_B => "WRITE_FIRST",
      INIT_FILE => "microblaze_0_bram_block_combined_10.mem",
      READ_WIDTH_A => 1,
      READ_WIDTH_B => 1,
      WRITE_WIDTH_A => 1,
      WRITE_WIDTH_B => 1,
      RAM_EXTENSION_A => "NONE",
      RAM_EXTENSION_B => "NONE"
    )
    port map (
      DBITERR => open,
      ECCPARITY => open,
      INJECTDBITERR => net_gnd0,
      INJECTSBITERR => net_gnd0,
      RDADDRECC => open,
      SBITERR => open,
      ADDRARDADDR => pgassign84,
      CASCADEINA => net_gnd0,
      CASCADEOUTA => open,
      CLKARDCLK => BRAM_Clk_A,
      DIADI => pgassign85,
      DIPADIP => net_gnd4,
      DOADO => pgassign86,
      DOPADOP => open,
      ENARDEN => BRAM_EN_A,
      REGCEAREGCE => net_gnd0,
      RSTRAMARSTRAM => BRAM_Rst_A,
      RSTREGARSTREG => net_gnd0,
      WEA => pgassign87,
      ADDRBWRADDR => pgassign88,
      CASCADEINB => net_gnd0,
      CASCADEOUTB => open,
      CLKBWRCLK => BRAM_Clk_B,
      DIBDI => pgassign89,
      DIPBDIP => net_gnd4,
      DOBDO => pgassign90,
      DOPBDOP => open,
      ENBWREN => BRAM_EN_B,
      REGCEB => net_gnd0,
      RSTRAMB => BRAM_Rst_B,
      RSTREGB => net_gnd0,
      WEBWE => pgassign91
    );

  ramb36e1_11 : RAMB36E1
    generic map (
      WRITE_MODE_A => "WRITE_FIRST",
      WRITE_MODE_B => "WRITE_FIRST",
      INIT_FILE => "microblaze_0_bram_block_combined_11.mem",
      READ_WIDTH_A => 1,
      READ_WIDTH_B => 1,
      WRITE_WIDTH_A => 1,
      WRITE_WIDTH_B => 1,
      RAM_EXTENSION_A => "NONE",
      RAM_EXTENSION_B => "NONE"
    )
    port map (
      DBITERR => open,
      ECCPARITY => open,
      INJECTDBITERR => net_gnd0,
      INJECTSBITERR => net_gnd0,
      RDADDRECC => open,
      SBITERR => open,
      ADDRARDADDR => pgassign92,
      CASCADEINA => net_gnd0,
      CASCADEOUTA => open,
      CLKARDCLK => BRAM_Clk_A,
      DIADI => pgassign93,
      DIPADIP => net_gnd4,
      DOADO => pgassign94,
      DOPADOP => open,
      ENARDEN => BRAM_EN_A,
      REGCEAREGCE => net_gnd0,
      RSTRAMARSTRAM => BRAM_Rst_A,
      RSTREGARSTREG => net_gnd0,
      WEA => pgassign95,
      ADDRBWRADDR => pgassign96,
      CASCADEINB => net_gnd0,
      CASCADEOUTB => open,
      CLKBWRCLK => BRAM_Clk_B,
      DIBDI => pgassign97,
      DIPBDIP => net_gnd4,
      DOBDO => pgassign98,
      DOPBDOP => open,
      ENBWREN => BRAM_EN_B,
      REGCEB => net_gnd0,
      RSTRAMB => BRAM_Rst_B,
      RSTREGB => net_gnd0,
      WEBWE => pgassign99
    );

  ramb36e1_12 : RAMB36E1
    generic map (
      WRITE_MODE_A => "WRITE_FIRST",
      WRITE_MODE_B => "WRITE_FIRST",
      INIT_FILE => "microblaze_0_bram_block_combined_12.mem",
      READ_WIDTH_A => 1,
      READ_WIDTH_B => 1,
      WRITE_WIDTH_A => 1,
      WRITE_WIDTH_B => 1,
      RAM_EXTENSION_A => "NONE",
      RAM_EXTENSION_B => "NONE"
    )
    port map (
      DBITERR => open,
      ECCPARITY => open,
      INJECTDBITERR => net_gnd0,
      INJECTSBITERR => net_gnd0,
      RDADDRECC => open,
      SBITERR => open,
      ADDRARDADDR => pgassign100,
      CASCADEINA => net_gnd0,
      CASCADEOUTA => open,
      CLKARDCLK => BRAM_Clk_A,
      DIADI => pgassign101,
      DIPADIP => net_gnd4,
      DOADO => pgassign102,
      DOPADOP => open,
      ENARDEN => BRAM_EN_A,
      REGCEAREGCE => net_gnd0,
      RSTRAMARSTRAM => BRAM_Rst_A,
      RSTREGARSTREG => net_gnd0,
      WEA => pgassign103,
      ADDRBWRADDR => pgassign104,
      CASCADEINB => net_gnd0,
      CASCADEOUTB => open,
      CLKBWRCLK => BRAM_Clk_B,
      DIBDI => pgassign105,
      DIPBDIP => net_gnd4,
      DOBDO => pgassign106,
      DOPBDOP => open,
      ENBWREN => BRAM_EN_B,
      REGCEB => net_gnd0,
      RSTRAMB => BRAM_Rst_B,
      RSTREGB => net_gnd0,
      WEBWE => pgassign107
    );

  ramb36e1_13 : RAMB36E1
    generic map (
      WRITE_MODE_A => "WRITE_FIRST",
      WRITE_MODE_B => "WRITE_FIRST",
      INIT_FILE => "microblaze_0_bram_block_combined_13.mem",
      READ_WIDTH_A => 1,
      READ_WIDTH_B => 1,
      WRITE_WIDTH_A => 1,
      WRITE_WIDTH_B => 1,
      RAM_EXTENSION_A => "NONE",
      RAM_EXTENSION_B => "NONE"
    )
    port map (
      DBITERR => open,
      ECCPARITY => open,
      INJECTDBITERR => net_gnd0,
      INJECTSBITERR => net_gnd0,
      RDADDRECC => open,
      SBITERR => open,
      ADDRARDADDR => pgassign108,
      CASCADEINA => net_gnd0,
      CASCADEOUTA => open,
      CLKARDCLK => BRAM_Clk_A,
      DIADI => pgassign109,
      DIPADIP => net_gnd4,
      DOADO => pgassign110,
      DOPADOP => open,
      ENARDEN => BRAM_EN_A,
      REGCEAREGCE => net_gnd0,
      RSTRAMARSTRAM => BRAM_Rst_A,
      RSTREGARSTREG => net_gnd0,
      WEA => pgassign111,
      ADDRBWRADDR => pgassign112,
      CASCADEINB => net_gnd0,
      CASCADEOUTB => open,
      CLKBWRCLK => BRAM_Clk_B,
      DIBDI => pgassign113,
      DIPBDIP => net_gnd4,
      DOBDO => pgassign114,
      DOPBDOP => open,
      ENBWREN => BRAM_EN_B,
      REGCEB => net_gnd0,
      RSTRAMB => BRAM_Rst_B,
      RSTREGB => net_gnd0,
      WEBWE => pgassign115
    );

  ramb36e1_14 : RAMB36E1
    generic map (
      WRITE_MODE_A => "WRITE_FIRST",
      WRITE_MODE_B => "WRITE_FIRST",
      INIT_FILE => "microblaze_0_bram_block_combined_14.mem",
      READ_WIDTH_A => 1,
      READ_WIDTH_B => 1,
      WRITE_WIDTH_A => 1,
      WRITE_WIDTH_B => 1,
      RAM_EXTENSION_A => "NONE",
      RAM_EXTENSION_B => "NONE"
    )
    port map (
      DBITERR => open,
      ECCPARITY => open,
      INJECTDBITERR => net_gnd0,
      INJECTSBITERR => net_gnd0,
      RDADDRECC => open,
      SBITERR => open,
      ADDRARDADDR => pgassign116,
      CASCADEINA => net_gnd0,
      CASCADEOUTA => open,
      CLKARDCLK => BRAM_Clk_A,
      DIADI => pgassign117,
      DIPADIP => net_gnd4,
      DOADO => pgassign118,
      DOPADOP => open,
      ENARDEN => BRAM_EN_A,
      REGCEAREGCE => net_gnd0,
      RSTRAMARSTRAM => BRAM_Rst_A,
      RSTREGARSTREG => net_gnd0,
      WEA => pgassign119,
      ADDRBWRADDR => pgassign120,
      CASCADEINB => net_gnd0,
      CASCADEOUTB => open,
      CLKBWRCLK => BRAM_Clk_B,
      DIBDI => pgassign121,
      DIPBDIP => net_gnd4,
      DOBDO => pgassign122,
      DOPBDOP => open,
      ENBWREN => BRAM_EN_B,
      REGCEB => net_gnd0,
      RSTRAMB => BRAM_Rst_B,
      RSTREGB => net_gnd0,
      WEBWE => pgassign123
    );

  ramb36e1_15 : RAMB36E1
    generic map (
      WRITE_MODE_A => "WRITE_FIRST",
      WRITE_MODE_B => "WRITE_FIRST",
      INIT_FILE => "microblaze_0_bram_block_combined_15.mem",
      READ_WIDTH_A => 1,
      READ_WIDTH_B => 1,
      WRITE_WIDTH_A => 1,
      WRITE_WIDTH_B => 1,
      RAM_EXTENSION_A => "NONE",
      RAM_EXTENSION_B => "NONE"
    )
    port map (
      DBITERR => open,
      ECCPARITY => open,
      INJECTDBITERR => net_gnd0,
      INJECTSBITERR => net_gnd0,
      RDADDRECC => open,
      SBITERR => open,
      ADDRARDADDR => pgassign124,
      CASCADEINA => net_gnd0,
      CASCADEOUTA => open,
      CLKARDCLK => BRAM_Clk_A,
      DIADI => pgassign125,
      DIPADIP => net_gnd4,
      DOADO => pgassign126,
      DOPADOP => open,
      ENARDEN => BRAM_EN_A,
      REGCEAREGCE => net_gnd0,
      RSTRAMARSTRAM => BRAM_Rst_A,
      RSTREGARSTREG => net_gnd0,
      WEA => pgassign127,
      ADDRBWRADDR => pgassign128,
      CASCADEINB => net_gnd0,
      CASCADEOUTB => open,
      CLKBWRCLK => BRAM_Clk_B,
      DIBDI => pgassign129,
      DIPBDIP => net_gnd4,
      DOBDO => pgassign130,
      DOPBDOP => open,
      ENBWREN => BRAM_EN_B,
      REGCEB => net_gnd0,
      RSTRAMB => BRAM_Rst_B,
      RSTREGB => net_gnd0,
      WEBWE => pgassign131
    );

  ramb36e1_16 : RAMB36E1
    generic map (
      WRITE_MODE_A => "WRITE_FIRST",
      WRITE_MODE_B => "WRITE_FIRST",
      INIT_FILE => "microblaze_0_bram_block_combined_16.mem",
      READ_WIDTH_A => 1,
      READ_WIDTH_B => 1,
      WRITE_WIDTH_A => 1,
      WRITE_WIDTH_B => 1,
      RAM_EXTENSION_A => "NONE",
      RAM_EXTENSION_B => "NONE"
    )
    port map (
      DBITERR => open,
      ECCPARITY => open,
      INJECTDBITERR => net_gnd0,
      INJECTSBITERR => net_gnd0,
      RDADDRECC => open,
      SBITERR => open,
      ADDRARDADDR => pgassign132,
      CASCADEINA => net_gnd0,
      CASCADEOUTA => open,
      CLKARDCLK => BRAM_Clk_A,
      DIADI => pgassign133,
      DIPADIP => net_gnd4,
      DOADO => pgassign134,
      DOPADOP => open,
      ENARDEN => BRAM_EN_A,
      REGCEAREGCE => net_gnd0,
      RSTRAMARSTRAM => BRAM_Rst_A,
      RSTREGARSTREG => net_gnd0,
      WEA => pgassign135,
      ADDRBWRADDR => pgassign136,
      CASCADEINB => net_gnd0,
      CASCADEOUTB => open,
      CLKBWRCLK => BRAM_Clk_B,
      DIBDI => pgassign137,
      DIPBDIP => net_gnd4,
      DOBDO => pgassign138,
      DOPBDOP => open,
      ENBWREN => BRAM_EN_B,
      REGCEB => net_gnd0,
      RSTRAMB => BRAM_Rst_B,
      RSTREGB => net_gnd0,
      WEBWE => pgassign139
    );

  ramb36e1_17 : RAMB36E1
    generic map (
      WRITE_MODE_A => "WRITE_FIRST",
      WRITE_MODE_B => "WRITE_FIRST",
      INIT_FILE => "microblaze_0_bram_block_combined_17.mem",
      READ_WIDTH_A => 1,
      READ_WIDTH_B => 1,
      WRITE_WIDTH_A => 1,
      WRITE_WIDTH_B => 1,
      RAM_EXTENSION_A => "NONE",
      RAM_EXTENSION_B => "NONE"
    )
    port map (
      DBITERR => open,
      ECCPARITY => open,
      INJECTDBITERR => net_gnd0,
      INJECTSBITERR => net_gnd0,
      RDADDRECC => open,
      SBITERR => open,
      ADDRARDADDR => pgassign140,
      CASCADEINA => net_gnd0,
      CASCADEOUTA => open,
      CLKARDCLK => BRAM_Clk_A,
      DIADI => pgassign141,
      DIPADIP => net_gnd4,
      DOADO => pgassign142,
      DOPADOP => open,
      ENARDEN => BRAM_EN_A,
      REGCEAREGCE => net_gnd0,
      RSTRAMARSTRAM => BRAM_Rst_A,
      RSTREGARSTREG => net_gnd0,
      WEA => pgassign143,
      ADDRBWRADDR => pgassign144,
      CASCADEINB => net_gnd0,
      CASCADEOUTB => open,
      CLKBWRCLK => BRAM_Clk_B,
      DIBDI => pgassign145,
      DIPBDIP => net_gnd4,
      DOBDO => pgassign146,
      DOPBDOP => open,
      ENBWREN => BRAM_EN_B,
      REGCEB => net_gnd0,
      RSTRAMB => BRAM_Rst_B,
      RSTREGB => net_gnd0,
      WEBWE => pgassign147
    );

  ramb36e1_18 : RAMB36E1
    generic map (
      WRITE_MODE_A => "WRITE_FIRST",
      WRITE_MODE_B => "WRITE_FIRST",
      INIT_FILE => "microblaze_0_bram_block_combined_18.mem",
      READ_WIDTH_A => 1,
      READ_WIDTH_B => 1,
      WRITE_WIDTH_A => 1,
      WRITE_WIDTH_B => 1,
      RAM_EXTENSION_A => "NONE",
      RAM_EXTENSION_B => "NONE"
    )
    port map (
      DBITERR => open,
      ECCPARITY => open,
      INJECTDBITERR => net_gnd0,
      INJECTSBITERR => net_gnd0,
      RDADDRECC => open,
      SBITERR => open,
      ADDRARDADDR => pgassign148,
      CASCADEINA => net_gnd0,
      CASCADEOUTA => open,
      CLKARDCLK => BRAM_Clk_A,
      DIADI => pgassign149,
      DIPADIP => net_gnd4,
      DOADO => pgassign150,
      DOPADOP => open,
      ENARDEN => BRAM_EN_A,
      REGCEAREGCE => net_gnd0,
      RSTRAMARSTRAM => BRAM_Rst_A,
      RSTREGARSTREG => net_gnd0,
      WEA => pgassign151,
      ADDRBWRADDR => pgassign152,
      CASCADEINB => net_gnd0,
      CASCADEOUTB => open,
      CLKBWRCLK => BRAM_Clk_B,
      DIBDI => pgassign153,
      DIPBDIP => net_gnd4,
      DOBDO => pgassign154,
      DOPBDOP => open,
      ENBWREN => BRAM_EN_B,
      REGCEB => net_gnd0,
      RSTRAMB => BRAM_Rst_B,
      RSTREGB => net_gnd0,
      WEBWE => pgassign155
    );

  ramb36e1_19 : RAMB36E1
    generic map (
      WRITE_MODE_A => "WRITE_FIRST",
      WRITE_MODE_B => "WRITE_FIRST",
      INIT_FILE => "microblaze_0_bram_block_combined_19.mem",
      READ_WIDTH_A => 1,
      READ_WIDTH_B => 1,
      WRITE_WIDTH_A => 1,
      WRITE_WIDTH_B => 1,
      RAM_EXTENSION_A => "NONE",
      RAM_EXTENSION_B => "NONE"
    )
    port map (
      DBITERR => open,
      ECCPARITY => open,
      INJECTDBITERR => net_gnd0,
      INJECTSBITERR => net_gnd0,
      RDADDRECC => open,
      SBITERR => open,
      ADDRARDADDR => pgassign156,
      CASCADEINA => net_gnd0,
      CASCADEOUTA => open,
      CLKARDCLK => BRAM_Clk_A,
      DIADI => pgassign157,
      DIPADIP => net_gnd4,
      DOADO => pgassign158,
      DOPADOP => open,
      ENARDEN => BRAM_EN_A,
      REGCEAREGCE => net_gnd0,
      RSTRAMARSTRAM => BRAM_Rst_A,
      RSTREGARSTREG => net_gnd0,
      WEA => pgassign159,
      ADDRBWRADDR => pgassign160,
      CASCADEINB => net_gnd0,
      CASCADEOUTB => open,
      CLKBWRCLK => BRAM_Clk_B,
      DIBDI => pgassign161,
      DIPBDIP => net_gnd4,
      DOBDO => pgassign162,
      DOPBDOP => open,
      ENBWREN => BRAM_EN_B,
      REGCEB => net_gnd0,
      RSTRAMB => BRAM_Rst_B,
      RSTREGB => net_gnd0,
      WEBWE => pgassign163
    );

  ramb36e1_20 : RAMB36E1
    generic map (
      WRITE_MODE_A => "WRITE_FIRST",
      WRITE_MODE_B => "WRITE_FIRST",
      INIT_FILE => "microblaze_0_bram_block_combined_20.mem",
      READ_WIDTH_A => 1,
      READ_WIDTH_B => 1,
      WRITE_WIDTH_A => 1,
      WRITE_WIDTH_B => 1,
      RAM_EXTENSION_A => "NONE",
      RAM_EXTENSION_B => "NONE"
    )
    port map (
      DBITERR => open,
      ECCPARITY => open,
      INJECTDBITERR => net_gnd0,
      INJECTSBITERR => net_gnd0,
      RDADDRECC => open,
      SBITERR => open,
      ADDRARDADDR => pgassign164,
      CASCADEINA => net_gnd0,
      CASCADEOUTA => open,
      CLKARDCLK => BRAM_Clk_A,
      DIADI => pgassign165,
      DIPADIP => net_gnd4,
      DOADO => pgassign166,
      DOPADOP => open,
      ENARDEN => BRAM_EN_A,
      REGCEAREGCE => net_gnd0,
      RSTRAMARSTRAM => BRAM_Rst_A,
      RSTREGARSTREG => net_gnd0,
      WEA => pgassign167,
      ADDRBWRADDR => pgassign168,
      CASCADEINB => net_gnd0,
      CASCADEOUTB => open,
      CLKBWRCLK => BRAM_Clk_B,
      DIBDI => pgassign169,
      DIPBDIP => net_gnd4,
      DOBDO => pgassign170,
      DOPBDOP => open,
      ENBWREN => BRAM_EN_B,
      REGCEB => net_gnd0,
      RSTRAMB => BRAM_Rst_B,
      RSTREGB => net_gnd0,
      WEBWE => pgassign171
    );

  ramb36e1_21 : RAMB36E1
    generic map (
      WRITE_MODE_A => "WRITE_FIRST",
      WRITE_MODE_B => "WRITE_FIRST",
      INIT_FILE => "microblaze_0_bram_block_combined_21.mem",
      READ_WIDTH_A => 1,
      READ_WIDTH_B => 1,
      WRITE_WIDTH_A => 1,
      WRITE_WIDTH_B => 1,
      RAM_EXTENSION_A => "NONE",
      RAM_EXTENSION_B => "NONE"
    )
    port map (
      DBITERR => open,
      ECCPARITY => open,
      INJECTDBITERR => net_gnd0,
      INJECTSBITERR => net_gnd0,
      RDADDRECC => open,
      SBITERR => open,
      ADDRARDADDR => pgassign172,
      CASCADEINA => net_gnd0,
      CASCADEOUTA => open,
      CLKARDCLK => BRAM_Clk_A,
      DIADI => pgassign173,
      DIPADIP => net_gnd4,
      DOADO => pgassign174,
      DOPADOP => open,
      ENARDEN => BRAM_EN_A,
      REGCEAREGCE => net_gnd0,
      RSTRAMARSTRAM => BRAM_Rst_A,
      RSTREGARSTREG => net_gnd0,
      WEA => pgassign175,
      ADDRBWRADDR => pgassign176,
      CASCADEINB => net_gnd0,
      CASCADEOUTB => open,
      CLKBWRCLK => BRAM_Clk_B,
      DIBDI => pgassign177,
      DIPBDIP => net_gnd4,
      DOBDO => pgassign178,
      DOPBDOP => open,
      ENBWREN => BRAM_EN_B,
      REGCEB => net_gnd0,
      RSTRAMB => BRAM_Rst_B,
      RSTREGB => net_gnd0,
      WEBWE => pgassign179
    );

  ramb36e1_22 : RAMB36E1
    generic map (
      WRITE_MODE_A => "WRITE_FIRST",
      WRITE_MODE_B => "WRITE_FIRST",
      INIT_FILE => "microblaze_0_bram_block_combined_22.mem",
      READ_WIDTH_A => 1,
      READ_WIDTH_B => 1,
      WRITE_WIDTH_A => 1,
      WRITE_WIDTH_B => 1,
      RAM_EXTENSION_A => "NONE",
      RAM_EXTENSION_B => "NONE"
    )
    port map (
      DBITERR => open,
      ECCPARITY => open,
      INJECTDBITERR => net_gnd0,
      INJECTSBITERR => net_gnd0,
      RDADDRECC => open,
      SBITERR => open,
      ADDRARDADDR => pgassign180,
      CASCADEINA => net_gnd0,
      CASCADEOUTA => open,
      CLKARDCLK => BRAM_Clk_A,
      DIADI => pgassign181,
      DIPADIP => net_gnd4,
      DOADO => pgassign182,
      DOPADOP => open,
      ENARDEN => BRAM_EN_A,
      REGCEAREGCE => net_gnd0,
      RSTRAMARSTRAM => BRAM_Rst_A,
      RSTREGARSTREG => net_gnd0,
      WEA => pgassign183,
      ADDRBWRADDR => pgassign184,
      CASCADEINB => net_gnd0,
      CASCADEOUTB => open,
      CLKBWRCLK => BRAM_Clk_B,
      DIBDI => pgassign185,
      DIPBDIP => net_gnd4,
      DOBDO => pgassign186,
      DOPBDOP => open,
      ENBWREN => BRAM_EN_B,
      REGCEB => net_gnd0,
      RSTRAMB => BRAM_Rst_B,
      RSTREGB => net_gnd0,
      WEBWE => pgassign187
    );

  ramb36e1_23 : RAMB36E1
    generic map (
      WRITE_MODE_A => "WRITE_FIRST",
      WRITE_MODE_B => "WRITE_FIRST",
      INIT_FILE => "microblaze_0_bram_block_combined_23.mem",
      READ_WIDTH_A => 1,
      READ_WIDTH_B => 1,
      WRITE_WIDTH_A => 1,
      WRITE_WIDTH_B => 1,
      RAM_EXTENSION_A => "NONE",
      RAM_EXTENSION_B => "NONE"
    )
    port map (
      DBITERR => open,
      ECCPARITY => open,
      INJECTDBITERR => net_gnd0,
      INJECTSBITERR => net_gnd0,
      RDADDRECC => open,
      SBITERR => open,
      ADDRARDADDR => pgassign188,
      CASCADEINA => net_gnd0,
      CASCADEOUTA => open,
      CLKARDCLK => BRAM_Clk_A,
      DIADI => pgassign189,
      DIPADIP => net_gnd4,
      DOADO => pgassign190,
      DOPADOP => open,
      ENARDEN => BRAM_EN_A,
      REGCEAREGCE => net_gnd0,
      RSTRAMARSTRAM => BRAM_Rst_A,
      RSTREGARSTREG => net_gnd0,
      WEA => pgassign191,
      ADDRBWRADDR => pgassign192,
      CASCADEINB => net_gnd0,
      CASCADEOUTB => open,
      CLKBWRCLK => BRAM_Clk_B,
      DIBDI => pgassign193,
      DIPBDIP => net_gnd4,
      DOBDO => pgassign194,
      DOPBDOP => open,
      ENBWREN => BRAM_EN_B,
      REGCEB => net_gnd0,
      RSTRAMB => BRAM_Rst_B,
      RSTREGB => net_gnd0,
      WEBWE => pgassign195
    );

  ramb36e1_24 : RAMB36E1
    generic map (
      WRITE_MODE_A => "WRITE_FIRST",
      WRITE_MODE_B => "WRITE_FIRST",
      INIT_FILE => "microblaze_0_bram_block_combined_24.mem",
      READ_WIDTH_A => 1,
      READ_WIDTH_B => 1,
      WRITE_WIDTH_A => 1,
      WRITE_WIDTH_B => 1,
      RAM_EXTENSION_A => "NONE",
      RAM_EXTENSION_B => "NONE"
    )
    port map (
      DBITERR => open,
      ECCPARITY => open,
      INJECTDBITERR => net_gnd0,
      INJECTSBITERR => net_gnd0,
      RDADDRECC => open,
      SBITERR => open,
      ADDRARDADDR => pgassign196,
      CASCADEINA => net_gnd0,
      CASCADEOUTA => open,
      CLKARDCLK => BRAM_Clk_A,
      DIADI => pgassign197,
      DIPADIP => net_gnd4,
      DOADO => pgassign198,
      DOPADOP => open,
      ENARDEN => BRAM_EN_A,
      REGCEAREGCE => net_gnd0,
      RSTRAMARSTRAM => BRAM_Rst_A,
      RSTREGARSTREG => net_gnd0,
      WEA => pgassign199,
      ADDRBWRADDR => pgassign200,
      CASCADEINB => net_gnd0,
      CASCADEOUTB => open,
      CLKBWRCLK => BRAM_Clk_B,
      DIBDI => pgassign201,
      DIPBDIP => net_gnd4,
      DOBDO => pgassign202,
      DOPBDOP => open,
      ENBWREN => BRAM_EN_B,
      REGCEB => net_gnd0,
      RSTRAMB => BRAM_Rst_B,
      RSTREGB => net_gnd0,
      WEBWE => pgassign203
    );

  ramb36e1_25 : RAMB36E1
    generic map (
      WRITE_MODE_A => "WRITE_FIRST",
      WRITE_MODE_B => "WRITE_FIRST",
      INIT_FILE => "microblaze_0_bram_block_combined_25.mem",
      READ_WIDTH_A => 1,
      READ_WIDTH_B => 1,
      WRITE_WIDTH_A => 1,
      WRITE_WIDTH_B => 1,
      RAM_EXTENSION_A => "NONE",
      RAM_EXTENSION_B => "NONE"
    )
    port map (
      DBITERR => open,
      ECCPARITY => open,
      INJECTDBITERR => net_gnd0,
      INJECTSBITERR => net_gnd0,
      RDADDRECC => open,
      SBITERR => open,
      ADDRARDADDR => pgassign204,
      CASCADEINA => net_gnd0,
      CASCADEOUTA => open,
      CLKARDCLK => BRAM_Clk_A,
      DIADI => pgassign205,
      DIPADIP => net_gnd4,
      DOADO => pgassign206,
      DOPADOP => open,
      ENARDEN => BRAM_EN_A,
      REGCEAREGCE => net_gnd0,
      RSTRAMARSTRAM => BRAM_Rst_A,
      RSTREGARSTREG => net_gnd0,
      WEA => pgassign207,
      ADDRBWRADDR => pgassign208,
      CASCADEINB => net_gnd0,
      CASCADEOUTB => open,
      CLKBWRCLK => BRAM_Clk_B,
      DIBDI => pgassign209,
      DIPBDIP => net_gnd4,
      DOBDO => pgassign210,
      DOPBDOP => open,
      ENBWREN => BRAM_EN_B,
      REGCEB => net_gnd0,
      RSTRAMB => BRAM_Rst_B,
      RSTREGB => net_gnd0,
      WEBWE => pgassign211
    );

  ramb36e1_26 : RAMB36E1
    generic map (
      WRITE_MODE_A => "WRITE_FIRST",
      WRITE_MODE_B => "WRITE_FIRST",
      INIT_FILE => "microblaze_0_bram_block_combined_26.mem",
      READ_WIDTH_A => 1,
      READ_WIDTH_B => 1,
      WRITE_WIDTH_A => 1,
      WRITE_WIDTH_B => 1,
      RAM_EXTENSION_A => "NONE",
      RAM_EXTENSION_B => "NONE"
    )
    port map (
      DBITERR => open,
      ECCPARITY => open,
      INJECTDBITERR => net_gnd0,
      INJECTSBITERR => net_gnd0,
      RDADDRECC => open,
      SBITERR => open,
      ADDRARDADDR => pgassign212,
      CASCADEINA => net_gnd0,
      CASCADEOUTA => open,
      CLKARDCLK => BRAM_Clk_A,
      DIADI => pgassign213,
      DIPADIP => net_gnd4,
      DOADO => pgassign214,
      DOPADOP => open,
      ENARDEN => BRAM_EN_A,
      REGCEAREGCE => net_gnd0,
      RSTRAMARSTRAM => BRAM_Rst_A,
      RSTREGARSTREG => net_gnd0,
      WEA => pgassign215,
      ADDRBWRADDR => pgassign216,
      CASCADEINB => net_gnd0,
      CASCADEOUTB => open,
      CLKBWRCLK => BRAM_Clk_B,
      DIBDI => pgassign217,
      DIPBDIP => net_gnd4,
      DOBDO => pgassign218,
      DOPBDOP => open,
      ENBWREN => BRAM_EN_B,
      REGCEB => net_gnd0,
      RSTRAMB => BRAM_Rst_B,
      RSTREGB => net_gnd0,
      WEBWE => pgassign219
    );

  ramb36e1_27 : RAMB36E1
    generic map (
      WRITE_MODE_A => "WRITE_FIRST",
      WRITE_MODE_B => "WRITE_FIRST",
      INIT_FILE => "microblaze_0_bram_block_combined_27.mem",
      READ_WIDTH_A => 1,
      READ_WIDTH_B => 1,
      WRITE_WIDTH_A => 1,
      WRITE_WIDTH_B => 1,
      RAM_EXTENSION_A => "NONE",
      RAM_EXTENSION_B => "NONE"
    )
    port map (
      DBITERR => open,
      ECCPARITY => open,
      INJECTDBITERR => net_gnd0,
      INJECTSBITERR => net_gnd0,
      RDADDRECC => open,
      SBITERR => open,
      ADDRARDADDR => pgassign220,
      CASCADEINA => net_gnd0,
      CASCADEOUTA => open,
      CLKARDCLK => BRAM_Clk_A,
      DIADI => pgassign221,
      DIPADIP => net_gnd4,
      DOADO => pgassign222,
      DOPADOP => open,
      ENARDEN => BRAM_EN_A,
      REGCEAREGCE => net_gnd0,
      RSTRAMARSTRAM => BRAM_Rst_A,
      RSTREGARSTREG => net_gnd0,
      WEA => pgassign223,
      ADDRBWRADDR => pgassign224,
      CASCADEINB => net_gnd0,
      CASCADEOUTB => open,
      CLKBWRCLK => BRAM_Clk_B,
      DIBDI => pgassign225,
      DIPBDIP => net_gnd4,
      DOBDO => pgassign226,
      DOPBDOP => open,
      ENBWREN => BRAM_EN_B,
      REGCEB => net_gnd0,
      RSTRAMB => BRAM_Rst_B,
      RSTREGB => net_gnd0,
      WEBWE => pgassign227
    );

  ramb36e1_28 : RAMB36E1
    generic map (
      WRITE_MODE_A => "WRITE_FIRST",
      WRITE_MODE_B => "WRITE_FIRST",
      INIT_FILE => "microblaze_0_bram_block_combined_28.mem",
      READ_WIDTH_A => 1,
      READ_WIDTH_B => 1,
      WRITE_WIDTH_A => 1,
      WRITE_WIDTH_B => 1,
      RAM_EXTENSION_A => "NONE",
      RAM_EXTENSION_B => "NONE"
    )
    port map (
      DBITERR => open,
      ECCPARITY => open,
      INJECTDBITERR => net_gnd0,
      INJECTSBITERR => net_gnd0,
      RDADDRECC => open,
      SBITERR => open,
      ADDRARDADDR => pgassign228,
      CASCADEINA => net_gnd0,
      CASCADEOUTA => open,
      CLKARDCLK => BRAM_Clk_A,
      DIADI => pgassign229,
      DIPADIP => net_gnd4,
      DOADO => pgassign230,
      DOPADOP => open,
      ENARDEN => BRAM_EN_A,
      REGCEAREGCE => net_gnd0,
      RSTRAMARSTRAM => BRAM_Rst_A,
      RSTREGARSTREG => net_gnd0,
      WEA => pgassign231,
      ADDRBWRADDR => pgassign232,
      CASCADEINB => net_gnd0,
      CASCADEOUTB => open,
      CLKBWRCLK => BRAM_Clk_B,
      DIBDI => pgassign233,
      DIPBDIP => net_gnd4,
      DOBDO => pgassign234,
      DOPBDOP => open,
      ENBWREN => BRAM_EN_B,
      REGCEB => net_gnd0,
      RSTRAMB => BRAM_Rst_B,
      RSTREGB => net_gnd0,
      WEBWE => pgassign235
    );

  ramb36e1_29 : RAMB36E1
    generic map (
      WRITE_MODE_A => "WRITE_FIRST",
      WRITE_MODE_B => "WRITE_FIRST",
      INIT_FILE => "microblaze_0_bram_block_combined_29.mem",
      READ_WIDTH_A => 1,
      READ_WIDTH_B => 1,
      WRITE_WIDTH_A => 1,
      WRITE_WIDTH_B => 1,
      RAM_EXTENSION_A => "NONE",
      RAM_EXTENSION_B => "NONE"
    )
    port map (
      DBITERR => open,
      ECCPARITY => open,
      INJECTDBITERR => net_gnd0,
      INJECTSBITERR => net_gnd0,
      RDADDRECC => open,
      SBITERR => open,
      ADDRARDADDR => pgassign236,
      CASCADEINA => net_gnd0,
      CASCADEOUTA => open,
      CLKARDCLK => BRAM_Clk_A,
      DIADI => pgassign237,
      DIPADIP => net_gnd4,
      DOADO => pgassign238,
      DOPADOP => open,
      ENARDEN => BRAM_EN_A,
      REGCEAREGCE => net_gnd0,
      RSTRAMARSTRAM => BRAM_Rst_A,
      RSTREGARSTREG => net_gnd0,
      WEA => pgassign239,
      ADDRBWRADDR => pgassign240,
      CASCADEINB => net_gnd0,
      CASCADEOUTB => open,
      CLKBWRCLK => BRAM_Clk_B,
      DIBDI => pgassign241,
      DIPBDIP => net_gnd4,
      DOBDO => pgassign242,
      DOPBDOP => open,
      ENBWREN => BRAM_EN_B,
      REGCEB => net_gnd0,
      RSTRAMB => BRAM_Rst_B,
      RSTREGB => net_gnd0,
      WEBWE => pgassign243
    );

  ramb36e1_30 : RAMB36E1
    generic map (
      WRITE_MODE_A => "WRITE_FIRST",
      WRITE_MODE_B => "WRITE_FIRST",
      INIT_FILE => "microblaze_0_bram_block_combined_30.mem",
      READ_WIDTH_A => 1,
      READ_WIDTH_B => 1,
      WRITE_WIDTH_A => 1,
      WRITE_WIDTH_B => 1,
      RAM_EXTENSION_A => "NONE",
      RAM_EXTENSION_B => "NONE"
    )
    port map (
      DBITERR => open,
      ECCPARITY => open,
      INJECTDBITERR => net_gnd0,
      INJECTSBITERR => net_gnd0,
      RDADDRECC => open,
      SBITERR => open,
      ADDRARDADDR => pgassign244,
      CASCADEINA => net_gnd0,
      CASCADEOUTA => open,
      CLKARDCLK => BRAM_Clk_A,
      DIADI => pgassign245,
      DIPADIP => net_gnd4,
      DOADO => pgassign246,
      DOPADOP => open,
      ENARDEN => BRAM_EN_A,
      REGCEAREGCE => net_gnd0,
      RSTRAMARSTRAM => BRAM_Rst_A,
      RSTREGARSTREG => net_gnd0,
      WEA => pgassign247,
      ADDRBWRADDR => pgassign248,
      CASCADEINB => net_gnd0,
      CASCADEOUTB => open,
      CLKBWRCLK => BRAM_Clk_B,
      DIBDI => pgassign249,
      DIPBDIP => net_gnd4,
      DOBDO => pgassign250,
      DOPBDOP => open,
      ENBWREN => BRAM_EN_B,
      REGCEB => net_gnd0,
      RSTRAMB => BRAM_Rst_B,
      RSTREGB => net_gnd0,
      WEBWE => pgassign251
    );

  ramb36e1_31 : RAMB36E1
    generic map (
      WRITE_MODE_A => "WRITE_FIRST",
      WRITE_MODE_B => "WRITE_FIRST",
      INIT_FILE => "microblaze_0_bram_block_combined_31.mem",
      READ_WIDTH_A => 1,
      READ_WIDTH_B => 1,
      WRITE_WIDTH_A => 1,
      WRITE_WIDTH_B => 1,
      RAM_EXTENSION_A => "NONE",
      RAM_EXTENSION_B => "NONE"
    )
    port map (
      DBITERR => open,
      ECCPARITY => open,
      INJECTDBITERR => net_gnd0,
      INJECTSBITERR => net_gnd0,
      RDADDRECC => open,
      SBITERR => open,
      ADDRARDADDR => pgassign252,
      CASCADEINA => net_gnd0,
      CASCADEOUTA => open,
      CLKARDCLK => BRAM_Clk_A,
      DIADI => pgassign253,
      DIPADIP => net_gnd4,
      DOADO => pgassign254,
      DOPADOP => open,
      ENARDEN => BRAM_EN_A,
      REGCEAREGCE => net_gnd0,
      RSTRAMARSTRAM => BRAM_Rst_A,
      RSTREGARSTREG => net_gnd0,
      WEA => pgassign255,
      ADDRBWRADDR => pgassign256,
      CASCADEINB => net_gnd0,
      CASCADEOUTB => open,
      CLKBWRCLK => BRAM_Clk_B,
      DIBDI => pgassign257,
      DIPBDIP => net_gnd4,
      DOBDO => pgassign258,
      DOPBDOP => open,
      ENBWREN => BRAM_EN_B,
      REGCEB => net_gnd0,
      RSTRAMB => BRAM_Rst_B,
      RSTREGB => net_gnd0,
      WEBWE => pgassign259
    );

end architecture STRUCTURE;

