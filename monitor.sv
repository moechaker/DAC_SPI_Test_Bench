class monitor;
  
  transaction trans;
  mailbox #(bit [11:0]) mbxms;
  virtual spi_if vif;
  bit [11:0] data;
  
  function new(mailbox #(bit [11:0]) mbxms, virtual spi_if vif);
    this.vif = vif;
    this.mbxms = mbxms;
  endfunction
  
  task run();
    forever begin
      @(posedge vif.sclk);
      wait(vif.cs == 1'b0);
      @(posedge vif.sclk);
      
      for(int i=0; i<=11; i++) begin
        @(posedge vif.sclk);
        data[i] = vif.mosi;
      end
      
      wait(vif.cs == 1'b1);
      
      $display("[MON] DATA SENT : %0d", data);
      mbxms.put(data);
    end
  endtask
 
endclass