//Alejandro García - 19163
//Lab 08 Ejercicio 1 TB
//24-10-2020

module testbench();
//Entradas
reg clk = 0;
reg reset = 1;
reg load = 0;
reg enabled = 0;
reg [11:0]valor;

//Salidas
output wire[11:0]resultado;

contador c1(clk, reset, load, enabled, valor, resultado);

//Datos iniciales
initial begin
	#1 reset = 0;
	#1 valor = 12'b110000001111;
	#3 enabled = 1;
	#2 load = 1; 
	#1 load = 0; 
	#6 enabled = 0; 
	#1 valor = 12'b101100011100;
	#5 enabled = 1;
	#4 load = 1;
	#2 load = 0;
end

always@(*)begin
	#1 clk = ~clk;
end

initial
	#50 $finish;		

//GTK WAVE
initial begin
	$dumpfile("E1_tb.vcd");
	$dumpvars(0, testbench);
	end
endmodule