`timescale 1ns/1ns

module andGate(
    output xy,
    input x,
    input y
);

    and #(5) (xy,x,y);

endmodule
