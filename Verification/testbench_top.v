`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04.07.2025 11:27:45
// Design Name: 
// Module Name: testbench_top
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
//`include "interface.sv"
//`include "test.sv"
module testbench_top;
    bit clk;
    bit tx_rx_enable;
    initial begin
        clk = 0;
        tx_rx_enable = 1;
        #20 tx_rx_enable = 0;
      end
      always #5 clk = ~clk;
      
      intf intf_top(clk,tx_rx_enable);
      
      test test(intf_top);
      
      UART DUT (intf_top.clk,intf_top.tx_rx_enable,intf_top.tx_rx_start,intf_top.tx_out,intf_top.rx_in,intf_top.tx_data,intf_top.rx_received_data,intf_top.valid,intf_top.busy);
      
      
      initial begin
        $dumpfile("dump.vcd");
        $dumpvars(0);
      end
endmodule
