`timescale 1ns/1ns

module and3Gate(
    output xyz,
    input x,
    input y,
    input z
);
    and #(7ns) (xyz,x,y,z);
endmodule
