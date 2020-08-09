// -----------------------------------
// José Alejandro Garía Aguirre
// Digital 
// lab4
// -----------------------------------
// Ejercicio 5 Simplificada /Gate Level Modelling
// -----------------------------------
module t5_S(input wire A, B, C, output wire Y);
  
//   Elementos
 
 wire w1,w2,w3;
// compuertas  
not U1 (w1, B);					//B'
and a1 (w2, A, w1);				//AB'
and a3 (w3, A, C);				//AC
or  o1 (Y, w2,w3);	 			//Salida

endmodule

// -----------------------------------
// Ejercicio 5 SOP / Operadores Logicos
// -----------------------------------
module t5_SOP(input wire A,B,C, output wire Y);	
	
assign Y = (A & ~B & ~C) | (A & ~B & C ) | (A & B & C);
   
endmodule

// -----------------------------------
// Ejercicio 5 POS / Operadores Logicos
// -----------------------------------
module t5_POS(input wire A,B,C, output wire Y);
	
	assign Y = (A | B | C) & (A | B | ~C) & (A | ~B | C) & (~A | ~B | C) & (A | ~B | ~C);
	
endmodule