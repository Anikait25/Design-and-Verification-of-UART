`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04.07.2025 11:34:11
// Design Name: 
// Module Name: generator
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

`include "transaction.sv"
class generator;
  rand transaction tx;
  mailbox gen2driv;
  int tx_count;
  event ended;
  
  function new(mailbox gen2driv);
    this.gen2driv = gen2driv;
  endfunction
  
  task main();
    $display("[GENERATOR]STARTED");
    repeat(tx_count) begin
      tx = new();
      assert(tx.randomize());
      gen2driv.put(tx);
    end
    ->ended;
    $display("[GENERATOR]ENDED");
  endtask
endclass
