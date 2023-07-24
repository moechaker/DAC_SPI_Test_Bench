class environment;
  generator gen;
  driver drv;
  monitor mon;
  scoreboard sco;
  
  
  mailbox #(transaction) mbxgd;
  mailbox #(bit [11:0]) mbxds;
  mailbox #(bit [11:0]) mbxms;
  event done;
  event sconext;
  
  
  function new(virtual spi_if vif, int count);
    mbxgd = new();
    mbxds = new();
    mbxms = new();
    gen = new(mbxgd,sconext,done,count);
    drv = new(mbxgd,mbxds,sconext,vif);
    mon = new(mbxms,vif);
    sco = new(mbxms,mbxds,sconext);
  endfunction
  
  task pre_test();
    drv.reset();
  endtask
  
  task test();
    fork
     gen.run();
     drv.run();
     mon.run();
     sco.run();
    join_any
  endtask
  
  task post_test();
    wait(gen.done.triggered);
    $finish;
  endtask
  
  
  task run();
    pre_test();
    test();
    post_test();
  endtask
	  
endclass