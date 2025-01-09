`timescale 1ns/1ns

module negate #(N) (
  output [N-1:0] out,
  output V,
  input [N-1:0] in
);
  
  wire [N-1:0] ones = '1;
  
  binarySubstractor #(N) bs(b, sub, x, y);

endmodule
