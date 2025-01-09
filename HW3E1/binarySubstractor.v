`timescale 1ns/1ns

module binarySubstractor #(parameter WIDTH=1) (
  output bOut,
  output [WIDTH-1:0] sub,
  input  [WIDTH-1:0] x,
  input  [WIDTH-1:0] y
);
  wire [WIDTH-1:0] b;

  assign bOut = b[WIDTH-1];

  fullSubtractor fs(b[0],sub[0],x[0],y[0],1'b0);

  for (genvar i = 1; i < WIDTH; i = i + 1)
  begin
    fullSubtractor fs(b[i],sub[i],x[i],y[i],b[i-1]);
  end
endmodule
