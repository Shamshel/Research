`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   21:12:02 03/07/2014
// Design Name:   ringOscHeater
// Module Name:   C:/Users/cody/Documents/ISE/oscHeatingCore/ring_oscillator_test_fixture.v
// Project Name:  oscHeatingCore
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: ringOscHeater
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module ring_oscillator_test_fixture;

	// Inputs
	reg [31:0] reg_0;
	reg Clk;
	reg Reset_n;

	// Outputs
	wire [31:0] reg_1;

	// Instantiate the Unit Under Test (UUT)
	ringOscHeater uut (
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
        
		#100 reg_0[0] = 1;
		
		#100 reg_0[0] = 0;

	end
	
	always
		begin
			#10 Clk = ~Clk;
		
		end
      
endmodule

