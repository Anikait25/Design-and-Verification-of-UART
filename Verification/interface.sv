`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04.07.2025 11:30:03
// Design Name: 
// Module Name: interface
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


interface intf (input logic clk, tx_rx_enable);
 logic tx_rx_start;
 logic [7:0] tx_data;
 logic rx_in;
 logic [7:0] rx_received_data;
 logic tx_out;
 logic valid;
 logic busy;
endinterface
