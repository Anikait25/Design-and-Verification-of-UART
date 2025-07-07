`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04.07.2025 11:42:56
// Design Name: 
// Module Name: env
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

`include "generator.sv"
`include "driver.sv"
`include "monitor_in.sv"
`include "monitor_out.sv"
`include "scoreboard.sv"
class environment;
  generator gen;
  driver driv;
  monitor_in mon_in;
  monitor_out mon_out;
  scoreboard scb;
  
  mailbox gen2driv;
  mailbox mon_in2scb;
  mailbox mon_out2scb;
  
  virtual intf vif;
  
  function new(virtual intf vif);
    this.vif=vif;
    
    gen2driv=new();
    mon_in2scb=new();
    mon_out2scb=new();
    gen=new(gen2driv);
    driv=new(vif,gen2driv);
    mon_in=new(vif,mon_in2scb);
    mon_out=new(vif,mon_out2scb);
    scb=new(mon_in2scb,mon_out2scb);
  endfunction
  
  task pre_test();
    driv.reset();
  endtask
  
  task test();
    fork
      gen.main();
      driv.main();
      mon_in.main();
      mon_out.main();
      scb.main();
    join_any
  endtask
  
  task post_test;
    wait(gen.ended.triggered);
    wait(gen.tx_count == driv.tx_count1);
    wait(driv.tx_count2 == mon_out.tx_count);
  endtask
  
  task run;
    pre_test();
    test();
    post_test();
    $display("TOTAL OF %0d transactions has been sent, of which %0d are valid (valid_in high)",gen.tx_count,driv.tx_count2);
    $finish;
  endtask
endclass
