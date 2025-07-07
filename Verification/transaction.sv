`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04.07.2025 11:32:35
// Design Name: 
// Module Name: transaction
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


class transaction;
  rand bit tx_rx_start;
  rand bit [7:0]tx_data;
  bit rx_in;
  bit tx_out;
  bit [7:0] rx_received_data;
  bit valid;
  bit busy;
  constraint c1{tx_rx_start == 1;}
  function void print(); $display("Transaction");
  endfunction:print
endclass
