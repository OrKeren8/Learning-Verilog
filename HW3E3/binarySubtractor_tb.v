`timescale 1ns/1ns

module binarySubtractor1_tb;

    parameter N = 8;  // Set the bit width for the testbench
    reg [N-1:0] x, y;  // Inputs
    reg bIn;           // Borrow input
    wire [N-1:0] z;    // Result of subtraction
    wire b, v;         // Borrow out and overflow flags

    // Instantiate the binarySubtractor1 module
    binarySubtractor1 #(N) uut (
        .b(b),
        .v(v),
        .z(z),
        .x(x),
        .y(y),
        .bIn(bIn)
    );

    // Initialize the simulation
    initial begin
        // Setup VCD file for waveform analysis
        $dumpfile("binarySubtractor1_tb.vcd");
        $dumpvars(0, binarySubtractor1_tb);

        // Test Case 1: Basic subtraction with no borrow
        x = 8'd15;   // 15 in decimal
        y = 8'd5;    // 5 in decimal
        bIn = 0;
        #20;
        $display("Test 1: x=%d, y=%d, z=%d, b=%b, v=%b", x, y, z, b, v);

        // Test Case 2: Basic subtraction with a borrow-in
        x = 8'd20;
        y = 8'd5;
        bIn = 1;
        #20;
        $display("Test 2: x=%d, y=%d, z=%d, b=%b, v=%b", x, y, z, b, v);

        // Test Case 3: Negative result
        x = 8'd5;
        y = 8'd10;
        bIn = 0;
        #20;
        $display("Test 3: x=%d, y=%d, z=%d, b=%b, v=%b", x, y, z, b, v);

        // Test Case 4: Overflow case
        x = 8'b01111111; // +127 (Max positive for signed 8-bit)
        y = 8'b10000000; // -128 (Min negative for signed 8-bit)
        bIn = 0;
        #20;
        $display("Test 4: x=%d, y=%d, z=%d, b=%b, v=%b", x, y, z, b, v);

        // Test Case 5: Edge case with all zeros
        x = 8'd0;
        y = 8'd0;
        bIn = 0;
        #20;
        $display("Test 5: x=%d, y=%d, z=%d, b=%b, v=%b", x, y, z, b, v);

        // Test Case 6: Large subtraction
        x = 8'b11110000;  // 240
        y = 8'b00001111;  // 15
        bIn = 1;
        #20;
        $display("Test 6: x=%d, y=%d, z=%d, b=%b, v=%b", x, y, z, b, v);

        $finish;
    end
endmodule
