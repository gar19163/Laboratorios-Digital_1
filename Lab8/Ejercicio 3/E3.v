//Alejandro García - 19163
//Lab 08 Ejercicio 3
//24-10-2020

module ALU (input [3:0]A, input [3:0]B, input [2:0]selector, output reg [3:0]result);
  always @ ( * ) begin
    case (selector)
    0:
      result <= A & B;
    1:
      result <= A | B;
    2:
      result <= A + B;
    3:
      result <= 4'b0;
    4:
      result <= A & ~B;
    5:
      result <= A | ~B;
    6:
      result <= A - B;
    7:
      result <= (A < B) ? 4'b1111:4'b0;
    default:
      result <= 4'b0;
    endcase
  end
endmodule