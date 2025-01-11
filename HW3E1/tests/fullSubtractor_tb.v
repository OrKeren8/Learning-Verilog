`timescale 1ns/1ns

module fullSubtractor_tb;

    reg x, y, bi;
    wire bo, s;

    fullSubtractor uut (
        .bo(bo),
        .s(s),
        .x(x),
        .y(y),
        .bi(bi)
    );

    initial begin
        #20;
        // Display header
        $display("x y bi | s bo");

        x = 0; y = 0; bi = 0; #20; $display("%b %b %b | %b %b", x, y, bi, s, bo);
        x = 0; y = 0; bi = 1; #20; $display("%b %b %b | %b %b", x, y, bi, s, bo);
        x = 0; y = 1; bi = 0; #20; $display("%b %b %b | %b %b", x, y, bi, s, bo);
        x = 0; y = 1; bi = 1; #20; $display("%b %b %b | %b %b", x, y, bi, s, bo);
        x = 1; y = 0; bi = 0; #20; $display("%b %b %b | %b %b", x, y, bi, s, bo);
        x = 1; y = 0; bi = 1; #20; $display("%b %b %b | %b %b", x, y, bi, s, bo);
        x = 1; y = 1; bi = 0; #20; $display("%b %b %b | %b %b", x, y, bi, s, bo);
        x = 1; y = 1; bi = 1; #20; $display("%b %b %b | %b %b", x, y, bi, s, bo);

        $finish;
    end

endmodule
