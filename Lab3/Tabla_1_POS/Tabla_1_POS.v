// -----------------------------------
// José Alejandro Garía Aguirre
// Digital 
// Tabla_1_POS
// -----------------------------------
module Tabla_1_POS();	// nombre módulo
  
//   Elementos
 reg A, B, C;
 wire w1,w2,w3,w4,w5,w6, Y;
// compuertas    
not U1 (w1, A);					//A'
not U2 (w2, B);					//B'
not U3 (w3, C);					//C'
or o1 (w4, A, B, w3);				//a+b+c'
or o2 (w5, A, w2, w3);				//a+b'+c'
or o3 (w6, w1, w2, C);				//a'+b'+c
and a1 (Y, w4, w5, w6);			//respuesta

// Simulacion
initial begin	// inicio simulacion
  //monitor nos permite rastrear cambios en las entradas y salidas
  // %b = binario %d = decimal %h = hex  \t = tabulación
  $monitor(
  "Time%d: A=%b B=%b C=%b Y=%b", 
    $time, A,B,C,Y); 
  // Valores iniciales
  A = 0; B = 0; C = 0; 
  // Cambios en otros tiempo
  #1 A = 0; B = 0; C = 1;
  #1 A = 0; B = 1; C = 0;
  #1 A = 0; B = 1; C = 1;
  #1 A = 1; B = 0; C = 0;
  #1 A = 1; B = 0; C = 1;
  #1 A = 1; B = 1; C = 0;
  #1 A = 1; B = 1; C = 1;
  #1 $finish;   
end		// termina la simulación

 
  initial 
    begin
      $dumpfile("Tabla_1_POS_tb.vcd");
      $dumpvars(0,Tabla_1_POS);
    end 
endmodule