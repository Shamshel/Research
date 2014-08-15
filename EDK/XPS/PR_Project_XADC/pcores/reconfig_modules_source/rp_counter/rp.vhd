----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    05:42:55 08/08/2014 
-- Design Name: 
-- Module Name:    rp - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity rp is
	generic
	(
		C_BUS_WIDTH	: integer := 32
	
	);
	
	port
	(
		reg_0			: in std_logic_vector(C_BUS_WIDTH-1 downto 0);
		reg_1			: out std_logic_vector(C_BUS_WIDTH-1 downto 0);
		Clk			: in std_logic;
		Reset_n		: in std_logic		
	
	);
end rp;

architecture Behavioral of rp is
	component frequency_counter
		generic
		(
			C_BUS_WIDTH			: integer;
			C_OVERFLOW_COUNT	: integer
		
		);	
		port
		(
			Clk_master			: in std_logic;
			Clk_test				: in std_logic;
			Reset_n				: in std_logic;
			reg_0					: in std_logic_vector(C_BUS_WIDTH-1 downto 0);
		
			reg_1					: out std_logic_vector(C_BUS_WIDTH-1 downto 0)
		
		);
		
	end component;

	component ring_oscillator
		port
		(
			Enable			: in std_logic;
			Clk_out			: out std_logic
		
		);
		
	end component;

	signal ring_clk			: std_logic;
	signal enable				: std_logic;
	signal reg_0_input		: std_logic_vector(C_BUS_WIDTH-1 downto 0);
	signal reg_1_output		: std_logic_vector(C_BUS_WIDTH-1 downto 0);

begin
	enable <= Reset_n;
	
	-- fix endianness of inputs/outputs
	--reg_0_input(31 downto 24) <= reg_0(7 downto 0);
	--reg_0_input(23 downto 16) <= reg_0(15 downto 8);
	--reg_0_input(15 downto 8) <= reg_0(23 downto 16);
	--reg_0_input(7 downto 0) <= reg_0(31 downto 24);
	
	reg_0_input(31 downto 24) <= reg_0(0) & reg_0(1) & reg_0(2)
								& reg_0(3) & reg_0(4) & reg_0(5)
								& reg_0(6) & reg_0(7);
								
	reg_0_input(23 downto 16) <= reg_0(8) & reg_0(9) & reg_0(10)
								& reg_0(11) & reg_0(12) & reg_0(13)
								& reg_0(14) & reg_0(15);

	reg_0_input(15 downto 8) <= reg_0(16) & reg_0(17) & reg_0(18)
								& reg_0(19) & reg_0(20) & reg_0(21)
								& reg_0(22) & reg_0(23);

	reg_0_input(7 downto 0) <= reg_0(24) & reg_0(25) & reg_0(26)
								& reg_0(27) & reg_0(28) & reg_0(29)
								& reg_0(30) & reg_0(31);
	
	reg_1(31 downto 24) <= reg_1_output(0) & reg_1_output(1) & reg_1_output(2)
								& reg_1_output(3) & reg_1_output(4) & reg_1_output(5)
								& reg_1_output(6) & reg_1_output(7);
								
	reg_1(23 downto 16) <= reg_1_output(8) & reg_1_output(9) & reg_1_output(10)
								& reg_1_output(11) & reg_1_output(12) & reg_1_output(13)
								& reg_1_output(14) & reg_1_output(15);

	reg_1(15 downto 8) <= reg_1_output(16) & reg_1_output(17) & reg_1_output(18)
								& reg_1_output(19) & reg_1_output(20) & reg_1_output(21)
								& reg_1_output(22) & reg_1_output(23);

	reg_1(7 downto 0) <= reg_1_output(24) & reg_1_output(25) & reg_1_output(26)
								& reg_1_output(27) & reg_1_output(28) & reg_1_output(29)
								& reg_1_output(30) & reg_1_output(31);

	--reg_1(31 downto 24) <= reg_1_output(7 downto 0);
	--reg_1(23 downto 16) <= reg_1_output(15 downto 8);
	--reg_1(15 downto 8) <= reg_1_output(23 downto 16);
	--reg_1(7 downto 0) <= reg_1_output(31 downto 24);

	freq_counter: frequency_counter
		generic map
		(
			C_BUS_WIDTH => 32,
			C_OVERFLOW_COUNT => 16#100#
		
		)
		port map
		(
			Clk_master => Clk,
			Clk_test => ring_clk,
			Reset_n => Reset_n,
			reg_0 => reg_0_input,
			reg_1 => reg_1_output
		
		);
		
	ring_osc: ring_oscillator
		port map
		(
			Enable => enable,
			Clk_out => ring_clk
	
		);

end Behavioral;

