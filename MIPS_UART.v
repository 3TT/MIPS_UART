`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    21:56:43 07/28/2015 
// Design Name: 
// Module Name:    MIPS_UART 
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
module MIPS_UART(
									//input reset,
									input clock,
									input rx,
									output tx
    );

//wire clk, clk2;
//wire reset;
//wire enable_clk;

wire read, write, empty, full;
wire [7:0] transmitir, recibido;

/*clockReductor clockReductor(
												 .CLK_IN1(clock),
												 .CLK_OUT1(clk),
												 .CLK_OUT2(clkX2)
												 ); */
													 
UART uart(.clk(clock),
			.rd(read),
			.wr(write),
			.w_data(transmitir),
			.rx(rx),
			.tx(tx),
			.r_data(recibido),
			.rx_empty(empty),
			.tx_full(full)
 );

/*MIPS_DLX MIPS (
							 .clock(clk),
							 //.enable_clk(enable_clk),
							 .reset(reset), 
							 .zero(zero),
							 .debug_signal(debug_signal),
							 .PC_plus_1(PC_plus_1)
							 );*/

endmodule
