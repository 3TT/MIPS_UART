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
									input clock,
									input rx,
									output tx
    );

//wire clk, clk2;
//wire reset;
//wire enable_clk;

wire read, write, empty, full;
wire enable;
wire [7:0] transmitir, recibido;
wire [9:0] PC_plus_1;

/*clockReductor clockReductor(
												 .CLK_IN1(clock),
												 .CLK_OUT1(clk),
												 .CLK_OUT2(clkX2)
												 );*/
												 
clock_reductor clock_reductor(
														.CLK_IN1(clock), 
														.CLK_OUT1(clk)
														);
													 
UART uart(
					//.clk(clock),
					.clk(clk),
					.rd(read),
					.wr(write),
					.w_data(transmitir),
					.rx(rx),
					.PC_plus_1(PC_plus_1),
					.enable(enable),
					.tx(tx),
					.r_data(recibido),
					.rx_empty(empty),
					.tx_full(full)
					);

MIPS_DLX MIPS (
							 //.clock(clock),
							 .clock(clk),
							 .enable(enable),
							 .zero(zero),
							 .debug_signal(debug_signal),
							 .PC_plus_1(PC_plus_1)
							 );

endmodule
