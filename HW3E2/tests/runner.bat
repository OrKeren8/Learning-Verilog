SET fileName=negate

E:\Programs\iverilog\bin\iverilog.exe -g2012 -o %fileName% .\..\deps\*.v .\..\%fileName%.v %fileName%_tb.v
E:\Programs\iverilog\bin\vvp %fileName%

del %fileName%
del %fileName%_tb.vcd