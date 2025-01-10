`timescale 1ns/1ns

module notGate(xn,x);
    input x;
    output xn;

    not #(2) (xn,x);
endmodule
