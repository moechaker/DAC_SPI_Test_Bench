`include "transaction.sv"
`include "generator.sv"
`include "driver.sv"
`include "monitor.sv"
`include "scoreboard.sv"
`include "environment.sv"

module tb;
  
  spi_if vif();
  
  environment env;
  
  spi dut (vif.clk,vif.newd,vif.rst,vif.din,vif.sclk,vif.cs,vif.mosi);
  
  initial begin
    vif.clk <= 0;
  end
  
  always #10 vif.clk <= ~vif.clk;
  
  initial begin
    env = new(vif,20);
    env.run();
  end
  
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars;
  end
  
  
endmodule