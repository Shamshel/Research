`timescale 1ns / 1ns
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    20:10:22 02/19/2014 
// Design Name: 
// Module Name:    ringOscHeater 
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
module rp
(
reg_0,
reg_1,
Clk,
Reset_n
);

localparam BUS_WIDTH = 32;

//defines the number of ring oscillators
localparam STAGES = 128;
//defines the number of not gates (-1) in the feedback loop
localparam LOOP_LEN = 128;

input reg_0;
input Clk;
input Reset_n;

wire [BUS_WIDTH-1:0] reg_0;
wire Clk;
wire Reset_n;

output reg_1;

reg [BUS_WIDTH-1:0] reg_1;

(* KEEP = "TRUE" *) wire loop[STAGES-1:0][LOOP_LEN-1:0]; //even number req in NUM_LOOP
reg on;

initial
	begin
		reg_1 = 0;
		on <= 0;

	end

genvar i, j;
generate
	for(i = 0; i<STAGES; i=i+1)
		begin:CONTROLLER
			//generate controllers
			and stageControl(loop[i][0], on, loop[i][LOOP_LEN-1]);
			
			//generate feeback loop
			for(j=0; j<LOOP_LEN-1; j=j+1)
				begin:LOOPS
					not stage(loop[i][j+1], loop[i][j]);
	
				end
			
		end
		
endgenerate
/*
and stageControl(loop[0][0], on, loop[0][10]);
not n1(loop[0][1], loop[0][0]);
not n2(loop[0][2], loop[0][1]);
not n3(loop[0][3], loop[0][2]);
not n4(loop[0][4], loop[0][3]);
not n5(loop[0][5], loop[0][4]);
not n6(loop[0][6], loop[0][5]);
not n7(loop[0][7], loop[0][6]);
not n8(loop[0][8], loop[0][7]);
not n9(loop[0][9], loop[0][8]);
not n10(loop[0][10], loop[0][9]);
not n11(loop[0][11], loop[0][10]);
*/

always@(posedge Clk)
	begin
		if(Reset_n != 1)
			begin
				on <= 0;
				reg_1 <= 0;
			
			end
	
		else if(reg_0 != 0)
			begin
				reg_1 <= reg_1 + 1;
				on <= 1;
	
			end
			
		else
			begin
				reg_1 <= 0;
				on <= 0;
			
			end

	end

endmodule
