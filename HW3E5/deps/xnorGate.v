`timescale 1ns/1ns

module xnorGate(
    output xy,
    input x,
    input y
);
    xnor #(5) (xy,x,y);
endmodule
