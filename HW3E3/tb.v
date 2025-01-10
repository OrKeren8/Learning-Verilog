`timescale 1ns/1ns

module binarySubtractor1_tb;

    parameter N = 8;             // Bit-width for the testbench
    reg [N-1:0] x, y;            // Inputs for subtraction
    reg bIn;                     // Borrow input
    wire [N-1:0] z;              // Output for subtraction result
    wire b, v;                   // Borrow out and overflow flag

    // Instantiate the binarySubtractor1 module
    binarySubtractor1 #(N) uut (
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
        $dumpfile("binarySubtractor1_tb.vcd");
        $dumpvars(0, binarySubtractor1_tb);

        $display("x        | y        | bIn | z        | b | v");
        $display("------------------------------------------------");

        // Test Case 1: Simple Subtraction
        x = 8'b00001111;  // 15
        y = 8'b00000101;  // 5
        bIn = 0;
        #20;
        $display("%b | %b | %b | %b | %b | %b", x, y, bIn, z, b, v);

        // Test Case 2: With Borrow Input
        x = 8'b00001111;  // 15
        y = 8'b00000101;  // 5
        bIn = 1;
        #20;
        $display("%b | %b | %b | %b | %b | %b", x, y, bIn, z, b, v);

        // Test Case 3: Borrow Out Case
        x = 8'b00000100;  // 4
        y = 8'b00000110;  // 6
        bIn = 0;
        #20;
        $display("%b | %b | %b | %b | %b | %b", x, y, bIn, z, b, v);

        // Test Case 4: Zero Subtraction
        x = 8'b00000000;  // 0
        y = 8'b00000000;  // 0
        bIn = 0;
        #20;
        $display("%b | %b | %b | %b | %b | %b", x, y, bIn, z, b, v);

        // Test Case 5: Negative Result
        x = 8'b00000100;  // 4
        y = 8'b00001000;  // 8
        bIn = 0;
        #20;
        $display("%b | %b | %b | %b | %b | %b", x, y, bIn, z, b, v);

        // Test Case 6: Overflow Scenario
        x = 8'b01111111;  // +127
        y = 8'b10000000;  // -128
        bIn = 0;
        #20;
        $display("%b | %b | %b | %b | %b | %b", x, y, bIn, z, b, v);

        // Test Case 7: Random Values
        x = 8'b10101010;  // Random value
        y = 8'b01010101;  
        bIn = 1;
        #20;
        $display("%b | %b | %b | %b | %b | %b", x, y, bIn, z, b, v);

        // End of Simulation
        $finish;
    end
endmodule
