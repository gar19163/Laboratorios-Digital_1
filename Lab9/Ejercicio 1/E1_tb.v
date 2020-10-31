//José Alejandro García Aguirre
//Lab9
//Ejecicio 1 Tb
module testbench();

reg clk = 0;
reg reset = 0;
reg enable = 0;
reg d1;
reg [1:0]d2;
reg [3:0]d4;
output wire q1;
output wire[1:0]q2;
output wire[3:0]q4;

ffd1 f1(clk, reset, enable, d1, q1);
ffd2 f2(clk, reset, enable, d2, q2);
ffd4 f3(clk, reset, enable, d4, q4);

initial begin
     #1	d1=1'b1; d2=2'b10;  d4=4'b1010; enable=1;
     #1 d1=1'b0; d2=2'b00;  d4=4'b1110; enable=1;
	 #1 reset=1; 
     #1 d1=1'b1; d2=2'b01;  d4=4'b1011; enable=0;
     #1 d1=1'b1; d2=2'b11;  d4=4'b1100; enable=1;
	 #3 reset=0;
     #1 d1=1'b0; d2=2'b10;  d4=4'b1111; enable=1;
     #1 d1=1'b1; d2=2'b11;  d4=4'b0001; enable=0;
	 
     #1 d1=1'b0; d2=2'b11;  d4=4'b1110; enable=0;
     #1 d1=1'b1; d2=2'b10;  d4=4'b1101; enable=1;

end	

always@(*)begin
	#1 clk = ~clk;
end
always@(*)begin
	#1 clk = ~clk;
end

initial
	#15 $finish;		

initial begin
	$dumpfile("E1_tb.vcd");
	$dumpvars(0, testbench);
	end
endmodule