`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04.07.2025 11:36:32
// Design Name: 
// Module Name: driver
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


class driver;
  int tx_count1 = 0;
  int tx_count2 = 0;
  
  virtual intf intf_vi;
  mailbox gen2driv;
  
  function new(virtual intf intf_vi, mailbox gen2driv);
    this.intf_vi = intf_vi;
    this.gen2driv = gen2driv;
  endfunction
  
  task reset;
    wait(intf_vi.tx_rx_enable);
    intf_vi.tx_data<=0;
    intf_vi.rx_in<=0;
    intf_vi.tx_rx_start<=0;
    wait(!intf_vi.tx_rx_enable);
  endtask
  
  task main;
    forever begin
      transaction tx;
      gen2driv.get(tx);
      @(posedge intf_vi.clk);
      //repeat(10) @(posedge intf_vi.clk);
      tx_count1++;
      intf_vi.tx_data <= tx.tx_data;
      intf_vi.tx_rx_start <= tx.tx_rx_start;
      intf_vi.rx_in <= intf_vi.tx_out;
      wait(intf_vi.valid);
      if(tx.tx_rx_start == 1'b1) tx_count2++;
    end
  endtask
endclass
