// -----------------------------------
// José Alejandro Garía Aguirre
// Digital 
// lab10
// -----------------------------------
// Ejerccicio 1


//couenter
module counter #(parameter N=12) (input logic clk, input logic reset, input logic load, input logic enabled, input [11:0] d, output logic [N-1:0]q);

always@(posedge clk, posedge reset)
	if(reset)
		q<=0;
	else if (load)
		q<=d;
	else if (enabled && !load)
		q<=q+1;

endmodule

//ROM
module ROM (input wire [11:0]addres, output wire [7:0]data);

	reg [7:0]mem[0:4095];

initial begin
	$readmemb("m.list",mem);
end

assign data = mem[addres];

endmodule


//Fetch

module fetch(input clk, input reset, input ena, input [7:0]d,  output reg [3:0]instruccion, output reg [3:0]operando);
	always @ (posedge clk, posedge reset)begin
		if (reset)
			begin
				operando <= 4'b0;
				instruccion <= 4'b0;
			end
		else if (ena)
			begin
				operando <= d[3:0];
				instruccion <= d[7:4];
			end
	end
endmodule

//Unión del modulo

module preparacion(input clk, input reset, input logic load_counter, ena_load_counter, enabled_ct, enabled_fetch, input logic [11:0]in_dato, output wire [7:0]program_byte, output wire [3:0]intsr, output wire [3:0]oprnd); 
	wire [7:0]out_ROM;
	output wire [11:0]out_counter;
	output wire [3:0]fetch_instruccions;
	output wire [3:0]fetch_operando;
	
	counter co1(.clk(clk), .reset(reset),  .load(ena_load_counter), .enabled(enabled_ct), .d(in_dato),  .q(out_counter) );

	ROM r1(.addres(out_counter), .data(out_ROM) );

	fetch ftc(.clk(clk), .reset(reset),.ena(enabled_fetch),  .d(out_ROM), .instruccion(fetch_instruccions), .operando(fetch_operando) );

assign program_byte = out_ROM;
assign intsr = fetch_instruccions;
assign oprnd = fetch_operando;

endmodule