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
    orMulti #(N) om1(zOr, z);
    notGate n1(zOr, ZOrNot);
    xorGate x1(signNotEq, xMsb, yMsb);
    andGate a3(eq, ZOrNot, signNotEq);

    notGate n2(xMsbNot, xMsb);
    and3Gate a1(gtPart1, signNotEq, xMsbNot, yMsb);
    notGate n3(signEq, signNotEq);
    xorGate x2(nss, zMsb, xMsb);
    notGate n4(nss, ss);
    andGate a2(gtPart2, signEq, ss);
    orGate o1(gt, gtPart1, gtPart2);

    notGate n5(yMsbNot, yMsb);
    and3Gate a4(ltPart1, signNotEq, yMsbNot, xMsb);
    andGate a5(ltPart2, signEq, nss);
    orGate o2(lt, ltPart1, ltPart2);

endmodule
