`timescale 1ns / 1ps
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
module ringOscHeater
(
reg_0,
reg_1,
Clk,
Reset_n
);

localparam BUS_WIDTH = 32;

//defines the number of ring oscillators
localparam STAGES = 1024;
//defines the number of not gates (+1) in the feedback loop
localparam NUM_LOOP = 10;

input reg_0;
input Clk;
input Reset_n;

wire [BUS_WIDTH-1:0] reg_0;
wire Clk;
wire Reset_n;

output reg_1;

reg [BUS_WIDTH-1:0] reg_1;

wire loop[STAGES-1:0][NUM_LOOP:0]; //even number req in NUM_LOOP
wire on;

assign on = reg_0[0];

initial
	begin
		reg_1 = 0;

	end

genvar i, j;
generate
	for(i = 0; i<STAGES; i=i+1)
		begin:CONTROLLER
			//generate controllers
			and stageControl(loop[i][0], on, loop[i][NUM_LOOP]);
			
			//generate feeback loop
			for(j=0; j<NUM_LOOP; j=j+1)
				begin:LOOPS
					not stage(loop[i][j+1], loop[i][j]);
					
				end
			
		end
endgenerate

always@(Clk)
	begin
		if(reg_0)
			begin
				reg_1 = reg_1 + 1;
	
			end
			
		else
			begin
				reg_1 = 0;
			
			end

	end

endmodule
