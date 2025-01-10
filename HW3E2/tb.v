`timescale 1ns/1ns

module negate_tb;

    parameter N = 8;             // Bit-width for the test
    reg [N-1:0] in;              // Input for negation
    wire [N-1:0] out;            // Output after negation
    wire V;                      // Overflow flag

    // Instantiate the negate module
    negate #(N) uut (
        .V(V),
        .out(out),
        .in(in)
    );

    // Test Sequence
    initial begin
        // Generate waveform for GTKWave
        $dumpfile("negate_tb.vcd");
        $dumpvars(0, negate_tb);

        $display("in        | out       | V");
        $display("-------------------------");

        // Test Case 1: Negation of Zero
        in = 8'b00000000;  // Zero
        #20;
        $display("%b | %b | %b", in, out, V);

        // Test Case 2: Negation of a Positive Number
        in = 8'b00000011;  // 3
        #20;
        $display("%b | %b | %b", in, out, V);

        // Test Case 3: Negation of a Negative Number (2's complement)
        in = 8'b11111100;  // -4
        #20;
        $display("%b | %b | %b", in, out, V);

        // Test Case 4: Negation of the Maximum Positive Value
        in = 8'b01111111;  // +127
        #20;
        $display("%b | %b | %b", in, out, V);

        // Test Case 5: Negation of the Minimum Negative Value
        in = 8'b10000000;  // -128 (should overflow)
        #20;
        $display("%b | %b | %b", in, out, V);

        // Test Case 6: Negation of a Random Number
        in = 8'b00101110;  // 46
        #20;
        $display("%b | %b | %b", in, out, V);

        $finish;
    end
endmodule
