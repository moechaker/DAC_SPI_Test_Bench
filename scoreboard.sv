class scoreboard;
  
  mailbox #(bit [11:0]) mbxms;
  mailbox #(bit [11:0]) mbxds;
  bit [11:0] datams;
  bit [11:0] datads;
  event sconext;
  
  function new(mailbox #(bit [11:0]) mbxms, mailbox #(bit [11:0]) mbxds, event sconext);
    this.mbxms = mbxms;
    this.mbxds = mbxds;
    this.sconext = sconext;
  endfunction
  
  task run();
    forever begin
      mbxms.get(datams);
      mbxds.get(datads);
      
      $display("[SCO] DRIVER DATA = %0d  MONITOR DATA = %0d",datads,datams);
    	  
      if(datads == datams)
        $display("DATA MATCH");
      else
        $display("DATA MISMATCH");
      
      -> sconext;
      
    end
    
  endtask
  
endclass