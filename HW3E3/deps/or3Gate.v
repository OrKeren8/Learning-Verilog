`timescale 1ns/1ns

module or3Gate(
    output xyz,
    input x,
    input y,
    input z
);
    or #(7ns) (xyz,x,y,z);
endmodule
