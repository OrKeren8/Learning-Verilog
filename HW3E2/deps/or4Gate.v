`timescale 1ns/1ns

module or4Gate(
    output xyzt,
    input x,
    input y,
    input z,
    input t
);
    or #(9) (xyzt,x,y,z,t);
endmodule
