// -----------------------------------
// José Alejandro Garía Aguirre
// Digital 
// lab4_tb
// -----------------------------------
module testbench();

  reg A1, B1, C1,		//Entradas Ejercicio 1
	  A2, B2, C2,
	  A3, B3, C3, D3,
	  A4, B4, C4, D4,
	  p1, p2, p3, p4,	//Entradas Ejercicio 2
	  p5, p6, p7,
	  p8, p9, p10, p11,
	  p12, p13, p14;
  wire Y1, Y2, Y3, Y4, //Salidas Ejercicio 1
	   e1, e2, e3, e4; //Salidas Ejercicio 2

//--------Modulos Ejercicio 1----------
  tabla1_1 T1_1(A1, B1, C1, Y1);
  tabla1_2 T1_2(A2, B2, C2, Y2);
  tabla1_3 T1_3(A3, B3, C3, D3, Y3);
  tabla1_4 T1_4(A4, B4, C4, D4, Y4);

//-------Modulos Ejercicio 2-----------
  tabla2_1 T2_1(p1,p2,p3,p4,e1);
  tabla2_2 T2_2(p5,p6,p7,e2);
  tabla2_3 T2_3(p8,p9,p10,p11,e3);
  tabla2_4 T2_4(p12,p13,p14,e4);
  
//--------------------------------------  
//Simulación Ejercicio 1
//--------------------------------------

//---------------tabla 1---------------
  initial begin
    $display("Ejercicio 1 Tabla 1");
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
    $display("Ejercicio 1 Tabla 2");
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


//---------------tabla 3--------------- 
  initial begin
	#30
    $display("Ejercicio 1 Tabla 3");
    $display("A B C D | Y ");
    $display("--------|---");
	$monitor("%b %b %b %b | %b", A3, B3, C3, D3, Y3);
	   A3 = 0; B3 = 0; C3 = 0; D3 = 0;
	#1 A3 = 0; B3 = 0; C3 = 0; D3 = 1;
	#1 A3 = 0; B3 = 0; C3 = 1; D3 = 0;
	#1 A3 = 0; B3 = 0; C3 = 1; D3 = 1;
	#1 A3 = 0; B3 = 1; C3 = 0; D3 = 0;
	#1 A3 = 0; B3 = 1; C3 = 0; D3 = 1;
	#1 A3 = 0; B3 = 1; C3 = 1; D3 = 0;
	#1 A3 = 0; B3 = 1; C3 = 1; D3 = 1;
	#1 A3 = 1; B3 = 0; C3 = 0; D3 = 0;
	#1 A3 = 1; B3 = 0; C3 = 0; D3 = 1;
	#1 A3 = 1; B3 = 0; C3 = 1; D3 = 0;
	#1 A3 = 1; B3 = 0; C3 = 1; D3 = 1;
	#1 A3 = 1; B3 = 1; C3 = 0; D3 = 0;
	#1 A3 = 1; B3 = 1; C3 = 0; D3 = 1;
	#1 A3 = 1; B3 = 1; C3 = 1; D3 = 0;
	#1 A3 = 1; B3 = 1; C3 = 1; D3 = 1;
    
  end 

//---------------tabla 4---------------
  initial begin
    #50
    $display("Ejercicio 1 Tabla 4");
    $display("A B C D | Y");
    $display("--------|--");
    $monitor("%b %b %b %b | %b", A4, B4, C4, D4, Y4);
       A4 = 0; B4 = 0; C4 = 0; D4 = 0;
	#1 A4 = 0; B4 = 0; C4 = 0; D4 = 1;
	#1 A4 = 0; B4 = 0; C4 = 1; D4 = 0;
	#1 A4 = 0; B4 = 0; C4 = 1; D4 = 1;
	#1 A4 = 0; B4 = 1; C4 = 0; D4 = 0;
	#1 A4 = 0; B4 = 1; C4 = 0; D4 = 1;
	#1 A4 = 0; B4 = 1; C4 = 1; D4 = 0;
	#1 A4 = 0; B4 = 1; C4 = 1; D4 = 1;
	#1 A4 = 1; B4 = 0; C4 = 0; D4 = 0;
	#1 A4 = 1; B4 = 0; C4 = 0; D4 = 1;
	#1 A4 = 1; B4 = 0; C4 = 1; D4 = 0;
	#1 A4 = 1; B4 = 0; C4 = 1; D4 = 1;
	#1 A4 = 1; B4 = 1; C4 = 0; D4 = 0;
	#1 A4 = 1; B4 = 1; C4 = 0; D4 = 1;
	#1 A4 = 1; B4 = 1; C4 = 1; D4 = 0;
	#1 A4 = 1; B4 = 1; C4 = 1; D4 = 1;
  end

  
  
//--------------------------------------  
//Simulación Ejercicio 2
//--------------------------------------
//---------------tabla 41---------------
  initial begin
	#70
    $display("Ejercicio 2 Tabla 1");
    $display("A B C D | Y ");
    $display("--------|---");
    $monitor("%b %b %b %b | %b", p1, p2, p3, p4, e1);
       p1 = 0; p2 = 0; p3 = 0; p4 = 0;
    #1 p1 = 0; p2 = 0; p3 = 0; p4 = 1;
    #1 p1 = 0; p2 = 0; p3 = 1; p4 = 0;
    #1 p1 = 0; p2 = 0; p3 = 1; p4 = 1;
    #1 p1 = 0; p2 = 1; p3 = 0; p4 = 0;
    #1 p1 = 0; p2 = 1; p3 = 0; p4 = 1;
    #1 p1 = 0; p2 = 1; p3 = 1; p4 = 0;
    #1 p1 = 0; p2 = 1; p3 = 1; p4 = 1;
	#1 p1 = 1; p2 = 0; p3 = 0; p4 = 0;
    #1 p1 = 1; p2 = 0; p3 = 0; p4 = 1;
    #1 p1 = 1; p2 = 0; p3 = 1; p4 = 0;
    #1 p1 = 1; p2 = 0; p3 = 1; p4 = 1;
    #1 p1 = 1; p2 = 1; p3 = 0; p4 = 0;
    #1 p1 = 1; p2 = 1; p3 = 0; p4 = 1;
    #1 p1 = 1; p2 = 1; p3 = 1; p4 = 0;
    #1 p1 = 1; p2 = 1; p3 = 1; p4 = 1;
  end
  
//---------------tabla 2---------------
  initial begin
    #90
    $display("Ejercicio 2 Tabla 2");
    $display("A B C | Y");
    $display("------|--");
    $monitor("%b %b %b | %b", p5, p6, p7, e2);
       p5 = 0; p6 = 0; p7 = 0;
    #1 p5 = 0; p6 = 0; p7 = 1;
    #1 p5 = 0; p6 = 1; p7 = 0;
    #1 p5 = 0; p6 = 1; p7 = 1;
    #1 p5 = 1; p6 = 0; p7 = 0;
    #1 p5 = 1; p6 = 0; p7 = 1;
    #1 p5 = 1; p6 = 1; p7 = 0;
    #1 p5 = 1; p6 = 1; p7 = 1;
  end


//---------------tabla 3--------------- 
  initial begin
	#100
    $display("Ejercicio 2 Tabla 3");
    $display("A B C D | Y ");
    $display("--------|---");
    $monitor("%b %b %b %b | %b", p8, p9, p10, p11, e3);
       p8 = 0; p9 = 0; p10 = 0; p11 = 0;
    #1 p8 = 0; p9 = 0; p10 = 0; p11 = 1;
    #1 p8 = 0; p9 = 0; p10 = 1; p11 = 0;
    #1 p8 = 0; p2 = 0; p10 = 1; p11 = 1;
    #1 p8 = 0; p9 = 1; p10 = 0; p11 = 0;
    #1 p8 = 0; p9 = 1; p10 = 0; p11 = 1;
    #1 p8 = 0; p9 = 1; p10 = 1; p11 = 0;
    #1 p8 = 0; p9 = 1; p10 = 1; p11 = 1;
	#1 p8 = 1; p9 = 0; p10 = 0; p11 = 0;
    #1 p8 = 1; p9 = 0; p10 = 0; p11 = 1;
    #1 p8 = 1; p9 = 0; p10 = 1; p11 = 0;
    #1 p8 = 1; p9 = 0; p10 = 1; p11 = 1;
    #1 p8 = 1; p9 = 1; p10 = 0; p11 = 0;
    #1 p8 = 1; p9 = 1; p10 = 0; p11 = 1;
    #1 p8 = 1; p9 = 1; p10 = 1; p11 = 0;
    #1 p8 = 1; p9 = 1; p10 = 1; p11 = 1;
  end 

//---------------tabla 4---------------
  initial begin
    #120
    $display("Ejercicio 2 Tabla 4");
    $display("A B C | Y");
    $display("------|--");
    $monitor("%b %b %b | %b", p12, p13, p14, e4);
	   p12 = 0; p13 = 0; p14 = 0;
    #1 p12 = 0; p13 = 0; p14 = 1;
    #1 p12 = 0; p13 = 1; p14 = 0;
    #1 p12 = 0; p13 = 1; p14 = 1;
    #1 p12 = 1; p13 = 0; p14 = 0;
    #1 p12 = 1; p13 = 0; p14 = 1;
    #1 p12 = 1; p13 = 1; p14 = 0;
    #1 p12 = 1; p13 = 1; p14 = 1;
  end
  
  initial
    #130 $finish;
	
//---------------GTKWAVE----------------
  initial begin
    $dumpfile("lap_tb.vcd");
    $dumpvars(0, testbench);
  end
  
endmodule