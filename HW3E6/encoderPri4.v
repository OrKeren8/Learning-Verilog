`timescale 1ns/1ns

module encoderPri4(
    output v,
    output [1:0] z,
    input [3:0] x
    );

    wire x3Not, x2Not, z1Part1;
    wire z0Part1, orAll;
    
    notGate n1(.x(x[3]), .xn(x3Not));
    notGate n2(.x(x[2]), .xn(x2Not));
    andGate a1(.xy(z1Part1), .x(x[2]), .y(x3Not));
    orGate o1(.xy(z[1]), .x(z1Part1), .y(x[3]));

    and3Gate a2(.xyz(z0Part1), .x(x3Not), .y(x2Not), .z(x[1]));
    orGate o2(.xy(z[0]), .x(x[3]), .y(z0Part1));

    or4Gate o3(.xyzt(v), .x(x[3]), .y(x[2]), .z(x[1]), .t(x[0]));

endmodule