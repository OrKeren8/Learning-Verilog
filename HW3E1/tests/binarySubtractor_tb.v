`timescale 1ns/1ns

module binarySubtractor_tb;

    parameter N = 4;
    reg [N-1:0] x, y;
    reg bIn;
    wire b, v;
    wire [N-1:0] z;

    binarySubtractor #(N) uut (
        .b(b),
        .v(v),
        .z(z),
        .x(x),
        .y(y),
        .bIn(bIn)
    );

    initial begin
        $display("x y bIn | z b v");
        x = 4'b0000; y = 4'b0000; bIn = 0; #100; $display("%b %b %b | %b %b %b", x, y, bIn, z, b, v);
        x = 4'b0001; y = 4'b0001; bIn = 0; #100; $display("%b %b %b | %b %b %b", x, y, bIn, z, b, v);
        x = 4'b0010; y = 4'b0001; bIn = 0; #100; $display("%b %b %b | %b %b %b", x, y, bIn, z, b, v);
        x = 4'b1111; y = 4'b1111; bIn = 1; #100; $display("%b %b %b | %b %b %b", x, y, bIn, z, b, v);
        $finish;
    end

endmodule
