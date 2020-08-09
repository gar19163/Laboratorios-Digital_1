// -----------------------------------
// José Alejandro Garía Aguirre
// Digital 
// Tabla_2_POS
// -----------------------------------
module Tabla_2_POS();	// nombre módulo
  
//Elementos   
 reg A, B, C;
 wire w1,w2,w3,w4,w5,w6,w7,w8,Y;
// compuertas    
not U1 (w1, A);					//A'
not U2 (w2, B);					//B'
not U3 (w3, C);					//C'
or  o1 (w4, A, B, C);				//A+B+C
or  o2 (w5, A, W2, C);				//A+B'+C
or  o3 (w6, A, w2, w3);				//A'+B+C
or  o4 (w7, w1, B, C);				//A'+B+C	
or  o5 (w8, w1, B, w3);				//A'+B+C'
and a1 (Y, w4, w5, w6, w7, w8);	//Respuesta	

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
  #1 $finish;   // termina la simulación
end	

 
  initial 
    begin
      $dumpfile("Tabla_2_POS_tb.vcd");
      $dumpvars(0,Tabla_2_POS);
    end 
endmodule