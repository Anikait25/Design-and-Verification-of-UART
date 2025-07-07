`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04.07.2025 11:37:57
// Design Name: 
// Module Name: monitor_in
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


class monitor_in;
  virtual intf vif;
  mailbox mon_in2scb;
  
  function new(virtual intf vif, mailbox mon_in2scb);
    this.vif = vif;
    this.mon_in2scb = mon_in2scb;
  endfunction
  
  task main;
    forever begin
      transaction tx = new();
      @(posedge vif.clk);
      if(vif.tx_rx_start) begin
        tx.tx_data = vif.tx_data;
        vif.rx_in = vif.tx_out;
        mon_in2scb.put(tx);
      end
    end
  endtask
endclass
