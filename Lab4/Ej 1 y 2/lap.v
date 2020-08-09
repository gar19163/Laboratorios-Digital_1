// -----------------------------------
// José Alejandro Garía Aguirre
// Digital 
// lab4
// -----------------------------------
// Ejercicio 1 Tabla 1/Gate Level Modelling
// -----------------------------------
module tabla1_1(input wire A, B, C, output wire Y);
  
//   Elementos
// reg A, B, C;
 
 wire w1,w2,w3,w4,w5,w6,w7;
// compuertas    
not U1 (w1, A);					//A'
not U2 (w2, B);					//B'
not U3 (w3, C);					//C'
and a1 (w4, w1, w3);			//A'C'
and a2 (w5, w2, w3);			//B'C'
and a3 (w6, A, C);				//AC
or  o1 (Y, w4, w5, w6);			//Salida

endmodule



// -----------------------------------
// Ejercicio 1 Tabla 2/Gate Level Modelling
// -----------------------------------

module tabla1_2(input wire A, B, C, output wire Y);
  
// compuertas    
not U2 (Y, B);					//B'=Salida

endmodule

// -----------------------------------
// Ejercicio 1 Tabla 3/Gate Level Modelling
// -----------------------------------
module tabla1_3(input wire A, B, C, D, output wire Y);
  
//   Elementos
// reg A, B, C, D;
 wire w1,w2,w3,w4,w5,w6,w7,w8,w9,w10,w11,w12;
// compuertas    
not U1 (w1, A);					//A'
not U2 (w2, B);					//B'
not U3 (w3, C);					//C'
not U4 (w4, D);					//D'
and a1 (w5, w1, w2, w3, w4);	//A'B'C'D'
and a2 (w6, w1, w2, C, D);		//A´B´CD
and a3 (w7, w1, B, w3, D);		//A'BC'D
and a4 (w8, w1, B, C ,w4);		//A'BCD'
and a5 (w9, A, B, w3, w4);		//ABC'D'
and a6 (w10, A, B, C, D);		//ABCD
and a7 (w11, A, w2, w3, D);		//AB'C'D
and a8 (w12, A, w2, C, w4);		//AB'CD'
or  o1 (Y, w5,w6,w7,w8,w9,w10,w11,w12); 		//Salida

endmodule

// -----------------------------------
// Ejercicio 1 Tabla 4/Gate Level Modelling
// -----------------------------------
module tabla1_4(input wire A, B, C, D, output wire J);
  
//   Elementos
 wire j1,j2,j3,j4;
// compuertas    
not U1 (j1, D);					//D'
and a1 (j2, A, j1);				//AD'
and a2 (j3, A, C);				//AC
and a3 (j4, A, B);				//AB
or  o1 (J, j2, j3, j4);			//AD'+AC+AB
  
endmodule


// -----------------------------------
// Ejercicio 2 Tabla 1/Operadores Logicos
// -----------------------------------
module tabla2_1(input wire A,B,C,D, output wire Y);	
	
assign Y = (~B&~C&~D) | (A&~B) | (A&~C) | (A&~D);
   
endmodule

// -----------------------------------
// Ejercicio 2 Tabla 2/Operadores Logicos
// -----------------------------------
module tabla2_2(input wire A,B,C, output wire Y);
	
	assign Y = ~B | C;
	
endmodule

// -----------------------------------
// Ejercicio 2 Tabla 3/Operadores Logicos
// -----------------------------------
module tabla2_3(input wire A,B,C,D, output wire Y);

	assign Y = B | D ;
  
endmodule

// -----------------------------------
// Ejercicio 2 Tabla 4/Operadores Logicos
// -----------------------------------
module tabla2_4(input wire A,B,C, output wire Y);

	assign Y = ~A&~C | B ;
  
endmodule