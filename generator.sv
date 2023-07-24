class generator;
  
  transaction trans;
  mailbox #(transaction) mbxgd;
  int count = 0;
  event done;
  event sconext;
  
  
  function new(mailbox #(transaction) mbxgd, event sconext, event done, int count);
    this.mbxgd = mbxgd;
    this.sconext = sconext;
    this.done = done;
    this.count = count;
    trans = new();
  endfunction
  
  task run();
    repeat(count) begin
      assert(trans.randomize) else $error("[GEN] Randomization Failed");
      mbxgd.put(trans);
      trans.display("GEN");
      @(sconext);
    end
    
    -> done;
    
  endtask
  
  
  
  
endclass