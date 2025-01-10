`timescale 1ns/1ns

module binaryAdder #(parameter WIDTH=1) (
  output cOut,
  output v,
  output [WIDTH-1:0] sum,
  input  [WIDTH-1:0] x,
  input  [WIDTH-1:0] y,
  input cIn
);
  wire [WIDTH-1:0] c;

  assign cOut = c[WIDTH-1];
  
  generate
    if (WIDTH > 1)
      xorGate xg(v,c[WIDTH-1], c[WIDTH-2]);
    else
      xorGate xg(v,c[WIDTH-1], cIn);
  endgenerate

  fullAdder fa(c[0],sum[0],x[0],y[0],cIn);

  for (genvar i = 1; i < WIDTH; i = i + 1)
  begin
    fullAdder fa(c[i],sum[i],x[i],y[i],
                 c[i-1]);
  end
endmodule
