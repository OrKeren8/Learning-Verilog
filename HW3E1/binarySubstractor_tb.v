`timescale 1ns/1ns

module binarySubstractor_tb;
  parameter N = 8;

  wire b;
  wire [N-1:0] sub;
  logic [N-1:0] x, y;

  binarySubstractor #(N) bs(b, sub, x, y);

  initial begin
    logic unsigned [N-1:0] subs, xs, ys;

    $dumpfile("binarySubstractor.vcd");
    $dumpvars;

    repeat (100) begin
      x = $urandom_range(0,2**N-1);
      y = $urandom_range(0,2**N-1);
      #60ns;
      xs = x;
      ys = y;
      subs = sub;
      $display("%d %d %d %d ** %d %d %d", x, y, sub, b, xs, ys, subs);
    end
    $finish();
  end
                
endmodule