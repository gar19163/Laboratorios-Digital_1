// -----------------------------------
// José Alejandro Garía Aguirre
// Digital 
// lab5 testbench
// -----------------------------------
module testbench();
// -----------------------------------
// Entradas
// -----------------------------------
  reg A21, B21, C21, A41, B41, C41, A81, B81, C81, A22, B22, C22, A42, B42, C42, A82, B82, C82;
  wire T1M2, T1M4, T1M8, T2M2, T2M4, T2M8;

	t1m2 t1_2(A21, B21, C21, T1M2);

// -----------------------------------
// Tabla 1 Modulo mux2_1
// ----------------------------------- 
  initial begin
	#5
	$display("Tabla 1 Mux2:1");
    $display("A B C | Y");
    $display("------|--");
    $monitor("%b %b %b | %b", A21, B21, C21, T1M2);
       A21 = 0; B21 = 0; C21 = 0;
    #1 A21 = 0; B21 = 0; C21 = 1;
    #1 A21 = 0; B21 = 1; C21 = 0;
    #1 A21 = 0; B21	= 1; C21 = 1;
    #1 A21 = 1; B21 = 0; C21 = 0;
    #1 A21 = 1; B21 = 0; C21 = 1;
    #1 A21 = 1; B21 = 1; C21 = 0;
    #1 A21 = 1; B21 = 1; C21 = 1;
  end
  
   initial
   #20 $finish;
// -----------------------------------
// GTKWAVE
// -----------------------------------
  initial begin
    $dumpfile("lab5_tb.vcd");
    $dumpvars(0, testbench);
  end
  