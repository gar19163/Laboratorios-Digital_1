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
