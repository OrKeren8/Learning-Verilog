`timescale 1ns/1ns

module comparator #(N)(
    output lt, eq, gt,
    input [N-1:0] x,
    input [N-1:0] y
    );

    wire [N-1:0] z;
    wire b, bNot, zOr;

    binarySubtractor #(N) bs1(.b(b), .v(), .z(z), .x(x), .y(y), .bIn(1'b0));
    orMulti #(N) om1(.d(zOr), .multi(z));
    notGate n1(.x(zOr), .xn(eq));
    andGate a1(.xy(lt), .x(b), .y(zOr));
    notGate n2(.x(b), .xn(bNot));
    andGate a2(.xy(gt), .x(zOr), .y(bNot));

endmodule