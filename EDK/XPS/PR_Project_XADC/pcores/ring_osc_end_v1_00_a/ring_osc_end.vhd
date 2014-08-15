----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    12:54:53 06/14/2014 
-- Design Name: 
-- Module Name:    ring_osc_end - Behavioral 
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

entity ring_osc_end is
	port
	(
		Data_in				: in std_logic;
		Clk_in				: in std_logic;
		Rst_in				: in std_logic
		
		--Data_out				: out std_logic;
		--Clk_out				: out std_logic;
		--Rst_out				: out std_logic
	);
end ring_osc_end;

architecture Behavioral of ring_osc_end is
	signal chain		: std_logic_vector(1 to 1025);
	signal state		: std_logic;
begin
	GEN_CHAIN: for i in 1 to 1025 generate
	begin
		chain(i) <= not chain(i-1);
	end generate GEN_CHAIN;
	
	chain(0) <= (state and (not Rst_in)) and (not chain(32));

	STATE_CHAGE : process(Clk_in) is
	begin
		if (rising_edge(Clk_in))then
			state <= Data_in after 2 ns;
		
		end if;
	
	end process STATE_CHANGE;

end Behavioral;

