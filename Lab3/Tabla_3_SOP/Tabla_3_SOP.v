// -----------------------------------
// José Alejandro Garía Aguirre
// Digital 
// Tabla_3_SOP
// -----------------------------------
module Tabla_3_SOP();	// nombre módulo
  
//   Elementos
 reg A, B, C, D;
 wire w1,w2,w3,w4,w5,w6,w7,w8,w9,w10,w11, Y;
// compuertas    
not U1 (w1, A);					//A'
not U2 (w2, B);					//B'
not U3 (w3, C);					//C'
not U4 (w4, D);					//D'
and A1 (w5, w1, w2, w3, w4);	//a'b'c'd'
and A2 (w6, w1, w2, w3, D);		//a'b'c'd
and A3 (w7, w1, w2, C, w4);		//a'b'cd'
and A4 (w8, w1, w2, C, D);		//a'b'cd
and A5 (w9, A, w2, w3, w4);		//ab'c'd'
and A6 (w10, A, w2, C, w4);		//ab'cd'
and A7 (w11, A, B, C, w4);		//abcd'
or  O1 (Y, w5,w6,w7,w8,w9,w10,w11); 	//Salida

// Simulacion
initial begin	// inicio simulacion
  $monitor(
  "Time%d: A=%b B=%b C=%b D=%b Y=%b", 
    $time, A,B,C,D,Y); 
  // Valores iniciales
  A = 0; B = 0; C = 0; D = 0;
  // Cambios en otros tiempo
  #1 A = 0; B = 0; C = 0; D = 1;
  #1 A = 0; B = 0; C = 1; D = 0;
  #1 A = 0; B = 0; C = 1; D = 1;
  #1 A = 0; B = 1; C = 0; D = 0;
  #1 A = 0; B = 1; C = 0; D = 1;
  #1 A = 0; B = 1; C = 1; D = 0;
  #1 A = 0; B = 1; C = 1; D = 1;
  #1 A = 1; B = 0; C = 0; D = 0;
  #1 A = 1; B = 0; C = 0; D = 1;
  #1 A = 1; B = 0; C = 1; D = 0;
  #1 A = 1; B = 0; C = 1; D = 1;
  #1 A = 1; B = 1; C = 0; D = 0;
  #1 A = 1; B = 1; C = 0; D = 1;
  #1 A = 1; B = 1; C = 1; D = 0;
  #1 A = 1; B = 1; C = 1; D = 1;
  #1 $finish;   // termina la simulación
  end	

 
  initial 
    begin
      $dumpfile("Tabla_3_SOP_tb.vcd");
      $dumpvars(0,Tabla_3_SOP);
    end 
endmodule