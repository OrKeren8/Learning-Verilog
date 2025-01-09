`timescale 1ns/1ns

module fullSub_tb;
  wire bo, s;
  logic x, y, z;

  fullSubtractor fs(bo,s,x,y,z);


  initial begin
    $dumpfile("fullSub.vcd");
    $dumpvars;

    x = 0;
    y = 0;
    z = 0;

    repeat (2) begin
      repeat (2) begin
        repeat (2) begin
          #20ns;
          $display(x,y,z,s,bo);
          z = z + 1;
        end
        y = y + 1;
      end
      x = x + 1;
    end
    $finish();
  end
  
                
endmodule
