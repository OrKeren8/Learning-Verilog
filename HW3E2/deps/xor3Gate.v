`timescale 1ns/1ns

module xor3Gate(
    output xyz,
    input x,
    input y,
    input z
);
    xor #(7ns) (xyz,x,y,z);
endmodule
