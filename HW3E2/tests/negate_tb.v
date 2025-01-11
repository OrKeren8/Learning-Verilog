`timescale 1ns/1ns

module negate_tb;

    parameter N = 4;
    reg [N-1:0] in;
    wire V;
    wire [N-1:0] out;

    negate #(N) uut (
        .V(V),
        .out(out),
        .in(in)
    );

    initial begin
        $display("in | out V");
        in = 4'b0000; #100; $display("%b | %b %b", in, out, V);
        in = 4'b0001; #100; $display("%b | %b %b", in, out, V);
        in = 4'b0010; #100; $display("%b | %b %b", in, out, V);
        in = 4'b1111; #100; $display("%b | %b %b", in, out, V);
        in = 4'b0111; #100; $display("%b | %b %b", in, out, V);
        in = 4'b1000; #100; $display("%b | %b %b", in, out, V);
        in = 4'b1010; #100; $display("%b | %b %b", in, out, V);
        in = 4'b1100; #100; $display("%b | %b %b", in, out, V);
        $finish;
    end

endmodule
