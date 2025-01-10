`timescale 1ns/1ns

module fullAdder(
  output f1,
  output f0,
  input  x,
  input  y,
  input  z
);

  andGate a1(xy,x,y);
  andGate a2(xz,x,z);
  andGate a3(yz,y,z);
  or3Gate o1(f1,xy,xz,yz);
  xor3Gate x1(f0,x,y,z);
endmodule