class driver;
  
  virtual spi_if vif;
  transaction trans;
  mailbox #(transaction) mbxgd;
  mailbox #(bit [11:0]) mbxds;
  event next;

  
  function new(mailbox #(transaction) mbxgd, mailbox #(bit [11:0]) mbxds, event next, virtual spi_if vif);
    this.mbxgd = mbxgd;
    this.mbxds = mbxds;
    this.next = next;
    this.vif = vif;
    trans = new();
  endfunction
  
  task reset();
    vif.rst <= 1'b1;
    vif.cs <= 1'b1;
    //vif.newd <= 1'b0;
    vif.din <= 1'b0;
    vif.mosi <= 1'b0;
    repeat(10) @(posedge vif.clk);
    vif.rst <= 1'b0;
    repeat(5) @(posedge vif.clk);
    $display("[DRV] RESET DONE");
  endtask
  
  
  task run();
    forever begin
      mbxgd.get(trans);
      @(posedge vif.sclk);
      vif.newd <= trans.newd;
      vif.din <= trans.din;
      mbxds.put(trans.din);
      @(posedge vif.sclk);
      vif.newd = 1'b0;
      wait(vif.cs == 1'b1);
      $display("[DRV] DATA SENT = %0d", trans.din);
    end
    
  endtask

endclass