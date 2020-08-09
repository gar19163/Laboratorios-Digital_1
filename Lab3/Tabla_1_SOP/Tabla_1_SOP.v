// -----------------------------------
// José Alejandro Garía Aguirre
// Digital 
// Tabla_1_SOP
// -----------------------------------
module Tabla_1_SOP();	// nombre módulo
  
//   Elementos
 reg A, B, C;
 wire w1,w2,w3,w4,w5,w6, Y;
// compuertas    
not U1 (w1, A);					//A'
not U2 (w2, B);					//B'
not U3 (w3, C);					//C'
and U4 (w4, w1, w2, w3);		//a'b'c'
and U5 (w5, w1, B, w3);			//a'bc'
and U6 (w6, A, w2, w3);			//ab'c'
and U7 (w7, A, w2, C);			//ab'c
and U8 (w8, A, B, C);			//abc
or U9 (Y, w4, w5, w6, w7, w8);	//Salida

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
  #1 $finish;   // termina la simulación
end	

 
  initial 
    begin
      $dumpfile("Tabla_1_SOP_tb.vcd");
      $dumpvars(0,Tabla_1_SOP);
    end 
endmodule
