// -----------------------------------
// José Alejandro Garía Aguirre
// Digital 
// Tabla_4_POS
// -----------------------------------
module Tabla_4_POS();	// nombre módulo
  
//   Elementos
 reg A, B, C, D;
 wire w1,w2,w3,w4,w5,w6,w7,w8, Y;
// compuertas    
not U1 (w1, A);					//A'
not U2 (w2, B);					//B'
not U3 (w3, C);					//C'
not U4 (w3, D);					//D'
or  o1 (w5, A, B, C, w4);		//a+b+c+d'
or  o2 (w6, A, w2, C, D);		//a+b'+c+d
or  o3 (w7, A, w2, C, w4);		//a+b'+c+d'
or  o4 (w8, w1, B, C, w4);		//a'+b+c+d'
or  o5 (w9, w1, B, w3, w4);		//a'+b+c'+d'
or  o6 (w10, w1, w2, C, D);		//a'+b'+c+d
or  o7 (w11, w1, w2, C, w4);	//a'+b'+c+d'
or  o8 (w12, w1, w2, w3, D);	//a'+b'+c'+d
or  o9 (w13, w1, w2, w3, w4);	//a'+b'+c'+d'
and a1 (Y, w5,w6,w7,w8,w9,w10,w11,w12,w13); 	//Salida

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
      $dumpfile("Tabla_4_POS_tb.vcd");
      $dumpvars(0,Tabla_4_POS);
    end 
endmodule