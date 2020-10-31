//José Alejandro García Aguirre
//Lab9
//Ejecicio 4

module bft(input enable, input [3:0]d, output logic [3:0]q);
	always @ (*)
		if (enable == 0)
			q <= 1'bz;
		else
			q <= d;
endmodule