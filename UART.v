`timescale 1ns/ 1ps
module UART #(
parameter data_width = 8
)(
input clk,
input tx_rx_enable,
input tx_rx_start,
output wire tx_out,
input rx_in,
input [data_width-1:0] tx_data,
output [data_width-1:0] rx_received_data,
output valid,
output busy
);

wire Ux_clk;
BAUD_generator #(.BAUD_rate(9600))baud(.clk(clk),.B_clk(Ux_clk));

UART_transmitter transmit(.clk(clk),.tx_enable(tx_rx_enable),.tx_start(tx_rx_start),.tx_data_in(tx_data),.tx_out(tx_out),.busy(busy),.valid(valid));

UART_receiver receive(.clk(clk),.rx_enable(tx_rx_enable),.rx_start(tx_rx_start),.rx_in(rx_in),.rx_received_data(rx_received_data));

endmodule