`timescale 1ns/1ns

module xorGate(
    output xy,
    input x,
    input y
);

    xor #(5) (xy,x,y);

endmodule
