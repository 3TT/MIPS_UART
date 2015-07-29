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
									input reset,
									input clock,
									input rx,
									output tx
    );

wire clk;
wire reset;

wire tick, rx_done_tick, tx_start, tx_done_tick;
wire [7:0] rx_dato_out;
wire [7:0] tx_dato_in;
wire [321:0] debug_signal;

clock_reductor clock_reductor(
														 .CLK_IN1(clock),
														 .CLK_OUT1(clk)
														 );

MIPS_DLX MIPS (
							 .clock(clk), 
							 .reset(reset), 
							 .zero(zero),
							 .debug_signal(debug_signal),
							 .PC_plus_1(PC_plus_1)
							 );

Baud_Rate_Generator baud_gen (
																 .clock(clk), 
																 .tick(tick)
																 );
	 
Rx RX (
			 .dato_in(rx), 
			 .tick_in(tick), 
			 .dato_out(rx_dato_out), 
			 .rx_done_tick(rx_done_tick)
			 );

Tx TX(
		 .dato_in(tx_dato_in), 
		 .tick_in(tick), 
		 .tx_start(tx_start), 
		 .dato_out(tx), 
		 .tx_done_tick(tx_done_tick)
		 );
	 
debug_unit debug (
								 .clk(clk), 
								 .rx_dato_out(rx_dato_out), 
								 .debug_signal(debug_signal),
								 .rx_done(rx_done_tick), 
								 .tx_done(tx_done_tick), 
								 .tx_dato_in(tx_dato_in), 
								 .tx_start(tx_start)
								 );

endmodule
