class transaction; 

  bit newd;
  rand bit [11:0] din;
  bit cs;
  bit mosi;
  
  /*constraint newdcon {
    newd dist {1 :/ 60, 0 :/ 40};  
  }*/
  
  function void display(string tag);
    $display("[%0s] newd = %0b cs = %0b mosi = %0b din = %0d",tag,newd,cs,mosi,din);
    newd = 1;
  endfunction
  
  
  function transaction copy();
    
    copy = new();
    copy.newd = this.newd;
    copy.cs = this.cs;
    copy.mosi = this.mosi;
    copy.din = this.din;
    
  endfunction
  
  
endclass