----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    02:24:20 08/08/2014 
-- Design Name: 
-- Module Name:    frequency_counter - Behavioral 
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
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity frequency_counter is
	generic
	(
		C_BUS_WIDTH			: integer := 32;
		C_OVERFLOW_COUNT		: integer := 16#10#

	);

	port
	(
		Clk_master			: in std_logic;
		Clk_test				: in std_logic;
		Reset_n				: in std_logic;
		reg_0					: in std_logic_vector(C_BUS_WIDTH-1 downto 0);
		
		reg_1					: out std_logic_vector(C_BUS_WIDTH-1 downto 0)
	
	);
end frequency_counter;

architecture Behavioral of frequency_counter is
	signal master_gate			: std_logic := '0';
	signal master_clk_timeout	: integer := 0;
	signal test_clk_counter		: integer := 0;
	signal output_buffer			: std_logic_vector(C_BUS_WIDTH-2 downto 0);

begin
	-- reference clock input process
	MASTER_CLK_COUNTING_PROCESS: process(Clk_master, Reset_n)
	begin
		-- asynch reset
		if(Reset_n = '0')
		then
			master_gate <= '0';
			master_clk_timeout <= 0;
			
		elsif(Clk_master'event and Clk_master = '1')
		then
			-- counter enabled
			if(reg_0(C_BUS_WIDTH-1) = '1')
			then
				-- timeout has not occured
				if(master_clk_timeout < to_integer(unsigned(reg_0(C_BUS_WIDTH-2 downto 0))))
				then
					-- enable master gate
					master_gate <= '1';
					master_clk_timeout <= master_clk_timeout+1;
				
				-- timeout has occured
				elsif(master_clk_timeout >= to_integer(unsigned(reg_0(C_BUS_WIDTH-2 downto 0))))
				then
					-- disable master gate
					master_gate <= '0';
					master_clk_timeout <= master_clk_timeout;
			
				end if;
				
			-- counter disabled
			else
				-- reset timeout counter
				master_gate <= '0';
				master_clk_timeout <= 0;
			
			end if;

		end if;		
	
	end process MASTER_CLK_COUNTING_PROCESS;
	
	-- test clock input process (test clock must be faster than reference)
	TEST_CLK_COUNTING_PROCESS: process(Clk_test, Reset_n)
		--variable internal_counter		:integer := 0;
	begin
		-- asynch reset
		if(Reset_n = '0')
		then
			--internal_counter := 0;
			test_clk_counter <= 0;
			output_buffer <= (others=>'0');
			reg_1 <= (others=>'0');
	
		-- test clock posedge
		elsif(Clk_test'event and Clk_test = '1')
		then
			-- counter has been disabled
			if(reg_0(C_BUS_WIDTH-1) = '0')
			then
				--internal_counter := 0;
				test_clk_counter <= 0;
				output_buffer <= (others=>'0');
				reg_1 <= (others=>'0');
			
			-- counter is enabled, master gate is active
			elsif(master_gate = '1')
			then
				test_clk_counter <= test_clk_counter+1;
				output_buffer <= std_logic_vector(to_unsigned(test_clk_counter, C_BUS_WIDTH-1));
				
				reg_1 <= '0' & output_buffer;
			
			-- counter is disabled, master gate is inactive
			elsif(master_gate = '0')
			then				
				if(test_clk_counter /= 0)
				then
					output_buffer <= std_logic_vector(to_unsigned(test_clk_counter, C_BUS_WIDTH-1));
				
				else
					output_buffer <= output_buffer;
				
				end if;
				
				reg_1 <= '1' & output_buffer;
				test_clk_counter <= 0;
				
			end if;
		
		end if;
	
	end process TEST_CLK_COUNTING_PROCESS;

end Behavioral;
