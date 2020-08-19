// -----------------------------------
// José Alejandro Garía Aguirre
// Digital 
// lab5
// -----------------------------------
// Ejercicio 2 Modulo mux2_1
// -----------------------------------
module m2(output wire Y, input wire d0,d1,s);
 
  assign Y=s ? d1: d0;

endmodule 
// -----------------------------------
// Ejercicio 2 Modulo mux4_1
// -----------------------------------
module m4(output wire Y, input wire d0,d1,d2,d3,s0,s1);
 
  wire p0, p1;
  
  m2 x0(d0,d1,s0,p1);
  m2 x1(d2,d3,s1,p2);
  m2 x2(p0,p1,s1,Y);

endmodule 

// -----------------------------------
// Ejercicio 2 Modulo mux8_1
// -----------------------------------
module m8(output wire y2, input wire d0,d1,d2,d3,d4,d5,d6,d7,s0,s1,s2);
 
  wire p2, p3;
  
  m4 x3(d0,d1,d2,d3,s0,s1,p1);
  m4 x4(d4,d5,d6,d7,s0,s1,p2);
  m2 x5(p2,p3,s2,y2);
endmodule

// -----------------------------------
// Tabla 1 Modulo mux2_1
// -----------------------------------
module t1m2(input wire A, B, C, output wire Y);

	assign Y= A ?(B~^C): (B^C);
	
endmodule

// -----------------------------------
// Tabla 1 Modulo mux4_1
// -----------------------------------  
  
module t1m4(input wire A, B, C, output wire Y);

	assign Y= A ? B ?
	(C, ~C, ~C, C, A, B, Y);
	
endmodule

// -----------------------------------
// Tabla 1 Modulo mux8_1
// -----------------------------------
module t1m8(input wire A, B, C, output wire Y);

	wire E, S;
	assign E = 1;
	assign S = 0;
	m8 J3(Sal, E, E, S, ENT, SAL, SAL, ENT, A, B, C, Y);
	
endmodule

// -----------------------------------
// Tabla 2 Modulo mux2_1
// -----------------------------------
module t2m2(input wire A, B, C, output wire Y);
	
	m2 U1(~(B|C), ~(B&C), A, Y);
	
endmodule

// -----------------------------------
// Tabla 2 Modulo mux4_1
// -----------------------------------
module t2m4(input wire A, B, C, output wire Y);

	m4 U2(~C, ~C&C, ~C|C, ~C, A, B, Y);
	
endmodule

// -----------------------------------
// Tabla 2 Modulo mux8_1
// -----------------------------------
module t2m8(input wire A, B, C, output wire Y);

	wire E, S;
	assign E = 1;
	assign S = 0;
	m8 U3(E, S, S, S, E, E, E, S, A, B, C, Y);
	
endmodule