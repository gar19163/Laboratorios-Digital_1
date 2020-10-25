//Alejandro García - 19163
//Lab 08 Ejercicio 1
//24-10-2020

//Modulo sumador
module contador #(parameter N=12)
		(input clk, reset, load, enabled, input [11:0] valor, output logic [N-1:0]resultado);

always@(posedge clk, posedge reset)
	if(reset)
		resultado<=0;
	else if (load)
		resultado<=valor;
	else if (enabled && !load)
		resultado<=resultado+1;

endmodule