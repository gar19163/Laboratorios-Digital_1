// -----------------------------------
// José Alejandro Garía Aguirre
// Digital 
// lab4
// -----------------------------------
module testbench();

  reg A1, B1, C1,		//Entradas Ejercicio 5
	  A2, B2, C2,
	  A3, B3, C3;
  wire Y1, Y2, Y3; 		//Salidas Ejercicio 5
  
 //--------Modulos Ejercicio 1----------
  t5_S    tS(A1, B1, C1, Y1);
  t5_SOP  tSOP(A2, B2, C2, Y2);
  t5_POS  tPOS(A3, B3, C3, Y3);
  
  //--------------------------------------  
//Simulación Ejercicio 5
//--------------------------------------

//---------------tabla 1---------------
  initial begin
    $display("Tabla Simplificada");
    $display("A B C | Y ");
    $display("------|------");
    $monitor("%b %b %b | %b", A1, B1, C1, Y1);
       A1 = 0; B1 = 0; C1 = 0;
	#1 A1 = 0; B1 = 0; C1 = 1;
	#1 A1 = 0; B1 = 1; C1 = 0;
	#1 A1 = 0; B1 = 1; C1 = 1;
	#1 A1 = 1; B1 = 0; C1 = 0;
	#1 A1 = 1; B1 = 0; C1 = 1;
	#1 A1 = 1; B1 = 1; C1 = 0;
	#1 A1 = 1; B1 = 1; C1 = 1;
  end
  
//---------------tabla 2---------------
  initial begin
    #20
    $display("Tabla SOP");
    $display("A B C | Y");
    $display("------|--");
    $monitor("%b %b %b | %b", A2, B2, C2, Y2);
       A2 = 0; B2 = 0; C2 = 0;
	#1 A2 = 0; B2 = 0; C2 = 1;
	#1 A2 = 0; B2 = 1; C2 = 0;
	#1 A2 = 0; B2 = 1; C2 = 1;
	#1 A2 = 1; B2 = 0; C2 = 0;
	#1 A2 = 1; B2 = 0; C2 = 1;
	#1 A2 = 1; B2 = 1; C2 = 0;
	#1 A2 = 1; B2 = 1; C2 = 1;
  end


//---------------POS--------------- 
  initial begin
	#30
    $display("Tabla POS");
    $display("A B C | Y ");
    $display("------|---");
	$monitor("%b %b %b | %b", A3, B3, C3, Y3);
	   A3 = 0; B3 = 0; C3 = 0;
	#1 A3 = 0; B3 = 0; C3 = 1;
	#1 A3 = 0; B2 = 1; C3 = 0;
	#1 A3 = 0; B2 = 1; C3 = 1;
	#1 A3 = 1; B2 = 0; C3 = 0;
	#1 A3 = 1; B3 = 0; C3 = 1;
	#1 A3 = 1; B3 = 1; C3 = 0;
	#1 A3 = 1; B3 = 1; C3 = 1;
    
  end 
  
  initial
    #40 $finish;
  //---------------GTKWAVE----------------
  initial begin
    $dumpfile("ej5_tb.vcd");
    $dumpvars(0, testbench);
  end
  
endmodule
