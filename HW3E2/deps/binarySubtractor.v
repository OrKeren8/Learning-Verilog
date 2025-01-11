`timescale 1ns/1ns

module binarySubtractor #(N) (
    output b,
    output v,
    output [N-1:0] z,
    input  [N-1:0] x, y,
    input  bIn
  );

  wire [N-1:0] bWire;
  wire xor1, xor2;

  fullSubtractor fs0 (
        .bo(bWire[0]),
        .s(z[0]),
        .x(x[0]),
        .y(y[0]),
        .bi(bIn)
    );

  genvar i;
  generate
    for (i = 1; i < N; i = i + 1)
      begin
        fullSubtractor fs (
                .bo(bWire[i]),
                .s(z[i]),
                .x(x[i]),
                .y(y[i]),
                .bi(bWire[i-1])
            );
    end
  endgenerate

  assign b = bWire[N-1];

  xorGate x1 (
        .xy(xor1),
        .x(z[N-1]),
        .y(x[N-1])
    );

    xorGate x2 (
        .xy(xor2),
        .x(y[N-1]),
        .y(x[N-1])
    );

    andGate a1 (
        .xy(v),
        .x(xor1),
        .y(xor2)
    );
    
endmodule
