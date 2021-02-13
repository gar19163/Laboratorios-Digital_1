
// Buffer triestado
module bt (input wire enable, input wire [3:0]d, output wire [3:0]q);
  assign q = enable ? d:4'bz;
endmodule

//Accumulator
module accu (input wire clk, reset, enable, input wire [3:0]result, output reg [3:0]accu);
	always @ (posedge clk or posedge reset or enable) begin
		if (reset) begin
			accu <= 4'b0;
		end
    else if (enable) begin
      accu <= result;
    end
	end
endmodule
//ALU
module ALU (input wire [3:0] A, B, input wire [2:0]selector, output wire [3:0]result, output wire [1:0]flags);
  wire zero, carry;
  reg [4:0]Alu_resultados;
  always @ ( * ) begin
    case (selector)
    0:
      Alu_resultados <= A;
    1:
      Alu_resultados <= A - B;
    2:
      Alu_resultados <= B;
    3:
      Alu_resultados <= A + B;
    4:
      Alu_resultados <= A ~& B;
    default:
      Alu_resultados <= 5'b0;
    endcase
  end
  assign result = Alu_resultados[3:0];
  assign carry = Alu_resultados[4];
  assign zero = (Alu_resultados == 5'b0) ? 1'b1:1'b0;
  assign flags[0] = zero;
  assign flags[1] = carry;
endmodule
//Union
module operacion (input wire clk, reset, enable_acu, enabled_tri_1, enabled_tri_2, input wire [2:0]selector, input wire [3:0]in1, output wire [1:0]flags, output wire [3:0]out2);
  wire [3:0]data_bus, result, accu;
  bt bt1(enabled_tri_1, in1, data_bus);
  accu ac1(clk, reset, enable_acu, result, accu);
  ALU al2(data_bus, accu, selector, result, flags);
  bt bt2(enabled_tri_2, result, out2);
endmodule