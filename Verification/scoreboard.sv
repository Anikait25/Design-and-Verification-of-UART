`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04.07.2025 11:40:55
// Design Name: 
// Module Name: scoreboard
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


class scoreboard;
  mailbox mon_in2scb;
  mailbox mon_out2scb;
  bit [7:0] in1_fifo[$];
  bit [7:0] in2_fifo[$];
  
  function new(mailbox mon_in2scb, mailbox mon_out2scb);
    this.mon_in2scb = mon_in2scb;
    this.mon_out2scb = mon_out2scb;
  endfunction
  
  task main;
    fork
      get_input();
      get_output();
    join_none;
  endtask
  
  task get_input();
    transaction tx;
    forever begin
      mon_in2scb.get(tx);
      in1_fifo.push_back(tx.tx_data);
      in1_fifo.push_back(tx.tx_rx_start);
      //in2_fifo.push_back(tx.rx_received_data);
    end
  endtask
  
  task get_output();
    transaction tx;
    bit [7:0] a;
    //bit [7:0] b;
    bit b;
    forever begin
      mon_out2scb.get(tx);
      a = in1_fifo.pop_front();
      b = in2_fifo.pop_front();
      //c = in1_fifo.pop_front();
      //if((a+b)!=tx.tx_out)
        //$error("Wrong result --- Inputs %0d and %0d --- Output = %0d",a,b,tx.tx_out);
    end
  endtask
endclass
