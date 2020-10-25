//Alejandro García - 19163
//Lab 08 Ejercicio 2
//24-10-2020
 
module memoria (input wire [11:0]direccion, output wire [7:0]valor);
reg [7:0]mrom[0:4095];	

//Documento
initial begin
	$readmemb("E2.list",mrom);
end

assign valor = mrom[direccion];
endmodule