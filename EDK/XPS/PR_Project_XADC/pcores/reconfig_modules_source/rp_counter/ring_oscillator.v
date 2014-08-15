`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    05:25:43 08/08/2014 
// Design Name: 
// Module Name:    ring_oscillator 
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
module ring_oscillator(
				Enable,
				Clk_out
				
			);
	 
localparam STAGES = 512;


// port declares
input Enable;

wire Enable;

output Clk_out;

wire Clk_out;

// internal declares
(*KEEP = "TRUE"*)wire [STAGES-1 : 0] a;

and(a[0], Enable, a[STAGES-1]);

assign Clk_out = a[0];

genvar i;
generate
	for(i = 0; i<STAGES-1; i=i+1)
		begin:LOOPS
			not stage(a[i+1], a[i]);
		
		end
		
endgenerate;

endmodule
