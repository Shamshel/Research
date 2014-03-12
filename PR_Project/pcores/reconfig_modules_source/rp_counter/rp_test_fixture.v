`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   15:16:24 03/11/2014
// Design Name:   rp
// Module Name:   C:/Users/cody/Documents/ISE/Research-master/Research-master/PR_Project/pcores/reconfig_modules_source/rp_osc/rp/ring_osc/rp_test_fixture.v
// Project Name:  ring_osc
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: rp
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module rp_test_fixture;

	// Inputs
	reg [31:0] reg_0;
	reg Clk;
	reg Reset_n;

	// Outputs
	wire [31:0] reg_1;

	// Instantiate the Unit Under Test (UUT)
	rp uut (
		.reg_0(reg_0), 
		.reg_1(reg_1), 
		.Clk(Clk), 
		.Reset_n(Reset_n)
	);

	initial begin
		// Initialize Inputs
		reg_0 = 0;
		Clk = 0;
		Reset_n = 0;

		// Wait 100 ns for global reset to finish
		#100;
       
		reg_0 = 32'hFFFFFFFF;
		
		#100;
		
		reg_0 = 32'h00000000;
		Reset_n = 1;
		
		#100;
		
		Reset_n = 0;

	end
	
	always
		begin
			#10 Clk = ~Clk;
		
		end
      
endmodule

