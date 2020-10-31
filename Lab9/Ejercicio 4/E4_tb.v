//José Alejandro García Aguirre
//Lab9
//Ejecicio 4 Tb

module testbench();

reg enabled = 0;
reg [3:0]d;
output wire [3:0]q;

bft a(enabled, d, q);

initial begin
	   enabled=0; d=4'b0110;
	#2 enabled=1; d=4'b0001;	   
	#2 enabled=1; d=4'b0010;	   
	#2 enabled=1; d=4'b1011;	   
	#2 enabled=0; d=4'b0100;
	#2 enabled=1; d=4'b0001;	   
	#2 enabled=1; d=4'b0011;
	#2 enabled=0; d=4'b0101;	   
	#2 enabled=1; d=4'b1010;	   
end


initial
	#20 $finish;		

initial begin
	$dumpfile("E4_tb.vcd");
	$dumpvars(0, testbench);
	end
endmodule