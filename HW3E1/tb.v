`timescale 1ns/1ns

module binarySubtractor_tb;

    parameter N = 8;              // Bit-width for the test
    reg [N-1:0] x, y;             // Inputs
    reg bIn;                      // Borrow in
    wire [N-1:0] z;               // Output for subtraction result
    wire b, v;                    // Borrow out and overflow flags

    // Instantiate the binarySubtractor module
    binarySubtractor #(N) uut (
        .b(b),
        .v(v),
        .z(z),
        .x(x),
        .y(y),
        .bIn(bIn)
    );

    // Test Sequence
    initial begin
        // Generate waveform for GTKWave
        $dumpfile("binarySubtractor_tb.vcd");
        $dumpvars(0, binarySubtractor_tb);

        $display("x        | y        | bIn | z        | b | v");
        $display("------------------------------------------------");

        // Test Case 1: Simple subtraction with no borrow
        x = 8'b00110011;  // 51
        y = 8'b00001100;  // 12
        bIn = 0;
        #20;
        $display("%b | %b | %b | %b | %b | %b", x, y, bIn, z, b, v);

        // Test Case 2: Subtraction with borrow input
        x = 8'b00001100;  // 12
        y = 8'b00001010;  // 10
        bIn = 1;
        #20;
        $display("%b | %b | %b | %b | %b | %b", x, y, bIn, z, b, v);

        // Test Case 3: Result with Borrow Out
        x = 8'b00000100;  // 4
        y = 8'b00000110;  // 6
        bIn = 0;
        #20;
        $display("%b | %b | %b | %b | %b | %b", x, y, bIn, z, b, v);

        // Test Case 4: Zero Result
        x = 8'b00000000;  // 0
        y = 8'b00000000;  // 0
        bIn = 0;
        #20;
        $display("%b | %b | %b | %b | %b | %b", x, y, bIn, z, b, v);

        // Test Case 5: Overflow Scenario
        x = 8'b01111111;  // Max positive number +127
        y = 8'b10000000;  // Min negative number -128
        bIn = 0;
        #20;
        $display("%b | %b | %b | %b | %b | %b", x, y, bIn, z, b, v);

        // Test Case 6: Subtraction of Equal Numbers
        x = 8'b01010101;  // 85
        y = 8'b01010101;  // 85
        bIn = 0;
        #20;
        $display("%b | %b | %b | %b | %b | %b", x, y, bIn, z, b, v);

        $finish;
    end

endmodule
