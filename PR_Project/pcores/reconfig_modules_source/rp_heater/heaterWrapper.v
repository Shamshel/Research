`timescale 1ns / 1ns
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    20:10:39 02/19/2014 
// Design Name: 
// Module Name:    heaterWrapper 
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
module heaterWrapper
(
sw,
ld

);

input [7:0] sw;
wire [7:0] sw;

output [7:0] ld;
wire [7:0] ld;

localparam WIDTH = 32;
wire [WIDTH-1:0] enable;

assign enable[7:0] = sw[7:0];

ringOscHeater heater(.enable(enable), .dummy(ld));

endmodule
