//José Alejandro García Aguirre
//Lab9
//Ejecicio 1

module updown(output  y1, output y2);
	assign y1 = 0;
	assign y2 = 1;
endmodule


module ffd1(input clk, input reset, input enable, input d, output logic salida);

	always @ (posedge clk, posedge reset)
		if (reset)
			salida  <= 1'b0;
		else if (enable)
			salida <= d;			
endmodule

module ffd2(input clk, input reset, input enable, input [1:0]d, output logic [1:0]salida);

	always @ (posedge clk, posedge reset)
		if (reset)
			salida <= 2'b0;
		else if (enable)
			salida <= d;			
endmodule

module ffd4(input clk, input reset, input enable, input [3:0]d, output logic [3:0]salida);

	always @ (posedge clk, posedge reset)
		if (reset)
			salida <= 4'b0;
		else if (enable)
			salida <= d;			
endmodule