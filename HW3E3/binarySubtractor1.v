`timescale 1ns/1ns

module binarySubtractor1 #(N) (
    output b,
    output v,
    output [N-1:0] z,
    input  [N-1:0] x, y,
    input  bIn
  );

  wire [N-1:0] negativeY, sum1, negativeBIn;
  wire [N-1:0] wireBIn = {{(N-1){1'b0}}, bIn};
  logic cOut1, cOut2, xor1, xor2;

  negate #(N) ng1(
                .V(),
                .out(negativeY), 
                .in(y)
                );

  binaryAdder #(N) ba1(
        .cOut(cOut1),
        .v(),
        .sum(sum1),
        .x(x),
        .y(negativeY),
        .cIn(1'b0)
        );

  negate #(N) ng2(
                .V(),
                .out(negativeBIn), 
                .in(wireBIn)
                );

  binaryAdder #(N) ba2(
        .cOut(cOut2),
        .v(),
        .sum(z),
        .x(sum1),
        .y(negativeBIn),
        .cIn(1'b0)
    );
  
  orGate o1(
    .xy(b),
    .x(cOut1),
    .y(cOut2)
  );

  xorGate x1(
    .xy(xor1),
    .x(z[N-1]),
    .y(x[N-1])
  );

  xorGate x2(
    .xy(xor2),
    .x(x[N-1]),
    .y(y[N-1])
  );

  andGate a1(
    .xy(v),
    .x(xor1),
    .y(xor2)
  );

endmodule
