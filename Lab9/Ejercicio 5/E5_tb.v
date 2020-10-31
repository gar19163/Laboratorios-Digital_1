//José Alejandro García Aguirre
//Lab9
//Ejecicio 5 tb

module testbench();

reg [6:0]inp;
output wire [12:0]outp;

ROM zucker(inp, outp);

initial begin
	#1 $display("-----------------------");
	#1 $display("---------Lab 9---------");
	#1 $display(" Input  | Output");
	#1 inp = 7'b0000000;
	#3 $display("%b | %b", inp, outp);
	
	#1 inp = 7'b00001;
	#3 $display("%b | %b", inp, outp);
	
	#1 inp = 7'b0000001;
	#3 $display("%b | %b", inp, outp);

	#1 inp = 7'b0001101;
	#3 $display("%b | %b", inp, outp);

	#1 inp = 7'b0001001;
	#3 $display("%b | %b", inp, outp);

	#1 inp = 7'b0010001;
	#3 $display("%b | %b", inp, outp);

	#1 inp = 7'b0011001;
	#3 $display("%b | %b", inp, outp);

	#1 inp = 7'b0100001;
	#3 $display("%b | %b", inp, outp);

	#1 inp = 7'b0101001;
	#3 $display("%b | %b", inp, outp);

	#1 inp = 7'b0110001;
	#3 $display("%b | %b", inp, outp);

	#1 inp = 7'b0111001;
	#3 $display("%b | %b", inp, outp);

	#1 inp = 7'b1000011;
	#3 $display("%b | %b", inp, outp);

	#1 inp = 7'b1000001;
	#3 $display("%b | %b", inp, outp);

	#1 inp = 7'b1001011;
	#3 $display("%b | %b", inp, outp);

	#1 inp = 7'b1001001;
	#3 $display("%b | %b", inp, outp);

	#1 inp = 7'b1010001;
	#3 $display("%b | %b", inp, outp);

	#1 inp = 7'b1011001;
	#3 $display("%b | %b", inp, outp);

	#1 inp = 7'b1100001;
	#3 $display("%b | %b", inp, outp);

	#1 inp = 7'b1101001;
	#3 $display("%b | %b", inp, outp);

	#1 inp = 7'b1110001;
	#3 $display("%b | %b", inp, outp);

	#1 inp = 7'b1111001;
	#3 $display("%b | %b", inp, outp);

	#1 inp = 7'b1010101;
	#3 $display("%b | %b", inp, outp);

	#1 inp = 7'b0101010;
	#3 $display("%b | %b", inp, outp);

	#1 inp = 7'b1001101;
	#3 $display("%b | %b", inp, outp);

	#1 inp = 7'b1000111;
	#3 $display("%b | %b", inp, outp);

	#1 inp = 7'b0111011;
	#3 $display("%b | %b", inp, outp);

	#1 inp = 7'b1111111;
	#3 $display("%b | %b", inp, outp);

	#1 inp = 7'b1111110;
	#3 $display("%b | %b", inp, outp);
end



initial
	#120 $finish;		
initial begin
	$dumpfile("E5_tb.vcd");
	$dumpvars(0, testbench);
	end
endmodule