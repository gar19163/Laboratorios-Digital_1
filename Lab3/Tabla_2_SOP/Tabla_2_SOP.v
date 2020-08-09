// -----------------------------------
// José Alejandro Garía Aguirre
// Digital 
// Tabla_2_SOP
// -----------------------------------
module Tabla_2_SOP();	// nombre módulo
  
//   Elementos
 reg A, B, C;
 wire w1,w2,w3,w4,w5,w6,Y;
// compuertas    
not U1 (w1, A);					//A'
not U2 (w2, B);					//B'
not U3 (w3, C);					//C'
and a1 (w4, w1, w2, C);				//A'B'C
and a2 (w5, A, B, w3);				//ABC'
and a3 (w6, A, B, C);				//ABC
or  o1 (Y, w4, w5, w6);			//(A'B'C)+(ABC')+(ABC)

// Simulacion
initial begin	// inicio simulacion
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
      $dumpfile("Tabla_2_SOP_tb.vcd");
      $dumpvars(0,Tabla_2_SOP);
    end 
endmodule