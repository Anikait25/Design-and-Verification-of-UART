`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04.07.2025 11:39:27
// Design Name: 
// Module Name: monitor_out
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


class monitor_out;
  int tx_count = 0;
  virtual intf vif;
  mailbox mon_out2scb;
  
  function new(virtual intf vif, mailbox mon_out2scb);
    this.vif = vif;
    this.mon_out2scb = mon_out2scb;
  endfunction
  
  task main;
    forever begin
      transaction tx = new();
      @(posedge vif.clk);
      @(posedge vif.valid);
      tx.tx_out = vif.tx_out;
      mon_out2scb.put(tx);
      tx_count++;
    end
  endtask
endclass
