`timescale 1ns/1ns

module negate #(N) (
  output V,
  output [N-1:0] out,
  input [N-1:0] in
);
  
  wire [N-1:0] sub;
  wire bSub, cSum, vSum, vSub;
  
  binarySubtractor #(N) bs(bSub, vSub, sub, {N{1'b1}}, in, 1'b0);
  binaryAdder #(N) ba(cSum, vSum, out, sub, {{(N-1){1'b0}}, 1'b1}, 1'b0);
  
  orGate o1(V, bSub, vSub, cSum, vSum);
  
endmodule
