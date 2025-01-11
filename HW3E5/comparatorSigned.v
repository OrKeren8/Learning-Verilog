`timescale 1ns/1ns

module comparatorSigned #(N)(
    output lt, eq, gt,
    input [N-1:0] x,
    input [N-1:0] y
);

    wire [N-1:0] z;
    wire b, v, zOr, ZOrNot, signNotEq, xMsbNot, gtPart1;
    wire yMsbNot, signEq, nss, zMsb, ss, gtPart2;
    wire ltPart1, ltPart2;

    assign xMsb = x[N-1];
    assign yMsb = y[N-1];

    binarySubtractor #(N) bs1(.b(b), .v(v), .z(z), .x(x), .y(y), .bIn(1'b0));
    assign zMsb = z[N-1];
    orMulti #(N) om1(.d(zOr), .multi(z));
    notGate n1(.x(zOr), .xn(ZOrNot));
    xorGate x1(.xy(signNotEq), .x(xMsb), .y(yMsb));
    andGate a3(.xy(eq), .x(ZOrNot), .y(signNotEq));

    notGate n2(.x(xMsb), .xn(xMsbNot));
    and3Gate a1(.xyz(gtPart1), .x(signNotEq), .y(xMsbNot), .z(yMsb));
    notGate n3(.x(signNotEq), .xn(signEq));
    xorGate x2(.xy(nss), .x(zMsb), .y(xMsb));
    notGate n4(.x(nss), .xn(ss));
    andGate a2(.xy(gtPart2), .x(signEq), .y(ss));
    orGate o1(.xy(gt), .x(gtPart1), .y(gtPart2));

    notGate n5(.x(yMsb), .xn(yMsbNot));
    and3Gate a4(.xyz(ltPart1), .x(signNotEq), .y(yMsbNot), .z(xMsb));
    andGate a5(.xy(ltPart2), .x(signEq), .y(nss));
    orGate o2(.xy(lt), .x(ltPart1), .y(ltPart2));

endmodule
