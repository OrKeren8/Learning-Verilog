`timescale 1ns/1ns

module orGate(
    output xy,
    input x,
    input y
);
    or #(5) (xy,x,y);
endmodule
