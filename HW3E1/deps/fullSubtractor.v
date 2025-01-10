`timescale 1ns/1ns

module fullSubtractor(
    output bo,
    output s,
    input x, y, bi
);

    xorGate x1(xor_xy, x, y);
    xorGate x2(s, xor_xy, bi);
    
    notGate n1(xn, x);
    andGate a1(bo1, xn, y);
    notGate n2(xnor_xy, xor_xy);
    andGate a2(bo2, xnor_xy, bi);
    orGate  o(bo, bo1, bo2);

endmodule