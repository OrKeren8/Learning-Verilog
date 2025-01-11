`timescale 1ns/1ns

module orMulti #(parameter WIDTH=1) (
    output  d,
    input [WIDTH-1:0] multi
);
    assign #15 d = |multi; // Cheating!
endmodule
