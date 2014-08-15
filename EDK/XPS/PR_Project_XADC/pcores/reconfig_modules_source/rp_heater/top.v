`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:07:45 06/23/2014 
// Design Name: 
// Module Name:    top 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module top
	(
		sys0_clkp,
		sys0_clkn,
		sw_c,
		dip_sw,
		//gpio_led

    );
	 
	 input sys0_clkp;
	 input sys0_clkn;
	 input sw_c;
	 input [3:0] dip_sw;
	 
	 //output wire [7:0] gpio_led;
	 
	 wire [7:0] waste;
	 wire Clk;
	 
	 IBUFDS IBUFDS_inst
	 (
		.O(Clk),
		.I(sys0_clkp),
		.IB(sys0_clkn)
	 );
	 
	 //defparam IBUFDS_inst.IOSTANDARD = "LVDS";

	 rp heater
	 (
		.reg_0({28'h0, dip_sw}),
		.reg_1(waste),
		.Clk(Clk),
		.Reset_n(sw_c)
	 );

endmodule
