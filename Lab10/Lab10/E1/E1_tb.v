// -----------------------------------
// José Alejandro Garía Aguirre
// Digital 
// lab10
// -----------------------------------
// Ejerccicio 1 TB

module testbench();

reg clk = 0;
reg reset = 0;
reg ena_load_counter = 0;
reg loadCounter = 0;
reg enabledCounter = 0;
reg enabled_fetch = 0;
reg [11:0]dato;

//ejercicio1
output wire[7:0]Program_byte;
output wire[3:0]instruccion;
output wire[3:0]operando;

preparacion part1(clk, reset, loadCounter, ena_load_counter, enabledCounter,  enabled_fetch, dato, Program_byte, instruccion, operando );

initial begin
	$display(" ");
	$display(" LOAD COUNTER    | Program byte  |   Instruccion   |  Operando  |");
	$display("----------------|---------------|-----------------|------------|");
	$monitor("%b               |  %b     |   %b          |    %b    |", loadCounter, Program_byte, instruccion, operando);

	reset = 1; #1 reset = 0; #1 dato = 12'b000011100000;
	#5 enabledCounter = 1;
	#5 ena_load_counter = 1; #2 ena_load_counter = 0;
	#5 enabled_fetch = 1;
	#5 reset = 1; #1 reset = 0;
	#5 dato = 12'b000000111000; #1 ena_load_counter = 1; #2 ena_load_counter = 0;
end

    initial
      #40 $finish;
    initial begin
        $dumpfile("E1_tb.vcd");
        $dumpvars(0, testbench);
      end
  endmodule
