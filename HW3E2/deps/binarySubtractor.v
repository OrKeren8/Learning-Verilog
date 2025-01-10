`timescale 1ns/1ns

module binarySubtractor #(N) (
  output b,
  output v,
  output [N-1:0] z,
  input  [N-1:0] x, y,
  input  bIn
);
  wire [N-1:0] bWire;
  wire xor1,xor2;

  assign bWire = bWire[N-1];

  fullSubtractor fs(bWire[0],z[0],x[0],y[0],bIn);

  for (genvar i = 1; i < N; i = i + 1)
  begin
    fullSubtractor fs(bWire[i],z[i],x[i],y[i],bWire[i-1]);
  end

  assign b = bWire[N-1];

  xorGate x1(xor1, z[N-1],x[N-1]);
  xorGate x2(xor2, y[N-1],x[N-1]);
  andGate a1(v,xor1,xor2);

endmodule
