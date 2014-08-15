--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   03:56:40 08/08/2014
-- Design Name:   
-- Module Name:   C:/Users/ECE/Documents/freq_counter/freq_counter/frequency_counter_testbench.vhd
-- Project Name:  freq_counter
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: frequency_counter
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY frequency_counter_testbench IS
END frequency_counter_testbench;
 
ARCHITECTURE behavior OF frequency_counter_testbench IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT frequency_counter
    PORT(
         Clk_master : IN  std_logic;
         Clk_test : IN  std_logic;
         Reset_n : IN  std_logic;
         reg_0 : IN  std_logic_vector(31 downto 0);
         reg_1 : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal Clk_master : std_logic := '0';
   signal Clk_test : std_logic := '0';
   signal Reset_n : std_logic := '1';
   signal reg_0 : std_logic_vector(31 downto 0) := (others => '0');

 	--Outputs
   signal reg_1 : std_logic_vector(31 downto 0);

   -- Clock period definitions
   constant Clk_master_period : time := 10 ns;
   constant Clk_test_period : time := 1 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: frequency_counter PORT MAP (
          Clk_master => Clk_master,
          Clk_test => Clk_test,
          Reset_n => Reset_n,
          reg_0 => reg_0,
          reg_1 => reg_1
        );

   -- Clock process definitions
   Clk_master_process :process
   begin
		Clk_master <= '0';
		wait for Clk_master_period/2;
		Clk_master <= '1';
		wait for Clk_master_period/2;
   end process;
 
   Clk_test_process :process
   begin
		Clk_test <= '0';
		wait for Clk_test_period/2;
		Clk_test <= '1';
		wait for Clk_test_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin
      reg_0 <= x"80000001";
		
		wait for Clk_master_period*2;
		
		--reg_0 <= x"00000001";
		
		--wait for Clk_master_period;

		Reset_n <= '0';

      wait;
   end process;

END;
