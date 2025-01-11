`timescale 1ns/1ns

module encoderPri4_tb;

    reg [3:0] x;
    wire v;
    wire [1:0] z;

    encoderPri4 uut (
        .v(v),
        .z(z),
        .x(x)
    );

    initial begin
        $display("x | z v");
        x = 4'b0000; #500; $display("%b | %b %b", x, z, v); #1000;
        x = 4'b0001; #500; $display("%b | %b %b", x, z, v); #1000;
        x = 4'b0010; #500; $display("%b | %b %b", x, z, v); #1000;
        x = 4'b0011; #500; $display("%b | %b %b", x, z, v); #1000;
        x = 4'b0100; #500; $display("%b | %b %b", x, z, v); #1000;
        x = 4'b0101; #500; $display("%b | %b %b", x, z, v); #1000;
        x = 4'b0110; #500; $display("%b | %b %b", x, z, v); #1000;
        x = 4'b0111; #500; $display("%b | %b %b", x, z, v); #1000;
        x = 4'b1000; #500; $display("%b | %b %b", x, z, v); #1000;
        x = 4'b1001; #500; $display("%b | %b %b", x, z, v); #1000;
        x = 4'b1010; #500; $display("%b | %b %b", x, z, v); #1000;
        x = 4'b1011; #500; $display("%b | %b %b", x, z, v); #1000;
        x = 4'b1100; #500; $display("%b | %b %b", x, z, v); #1000;
        x = 4'b1101; #500; $display("%b | %b %b", x, z, v); #1000;
        x = 4'b1110; #500; $display("%b | %b %b", x, z, v); #1000;
        x = 4'b1111; #500; $display("%b | %b %b", x, z, v); #1000;
        $finish;
    end

endmodule
