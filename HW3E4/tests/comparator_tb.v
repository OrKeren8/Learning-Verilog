`timescale 1ns/1ns

module comparator_tb;

    parameter N = 4;
    reg [N-1:0] x, y;
    wire lt, eq, gt;

    comparator #(N) uut (
        .lt(lt),
        .eq(eq),
        .gt(gt),
        .x(x),
        .y(y)
    );

    initial begin
        $display("x y | lt eq gt");
        x = 4'b0000; y = 4'b0000; #500; $display("%b %b | %b %b %b", x, y, lt, eq, gt);
        x = 4'b0001; y = 4'b0001; #500; $display("%b %b | %b %b %b", x, y, lt, eq, gt);
        x = 4'b0010; y = 4'b0001; #500; $display("%b %b | %b %b %b", x, y, lt, eq, gt);
        x = 4'b1111; y = 4'b0001; #500; $display("%b %b | %b %b %b", x, y, lt, eq, gt);
        x = 4'b1010; y = 4'b1010; #500; $display("%b %b | %b %b %b", x, y, lt, eq, gt);
        x = 4'b1001; y = 4'b1010; #500; $display("%b %b | %b %b %b", x, y, lt, eq, gt);
        x = 4'b1110; y = 4'b1111; #500; $display("%b %b | %b %b %b", x, y, lt, eq, gt);
        x = 4'b0111; y = 4'b0011; #500; $display("%b %b | %b %b %b", x, y, lt, eq, gt);
        x = 4'b0101; y = 4'b0110; #500; $display("%b %b | %b %b %b", x, y, lt, eq, gt);
        x = 4'b1100; y = 4'b0010; #500; $display("%b %b | %b %b %b", x, y, lt, eq, gt);
        $finish;
    end

endmodule
