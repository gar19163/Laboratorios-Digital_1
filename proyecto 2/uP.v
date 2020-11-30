//José Alejandro García Aguirre
//19163
//Electronica Digital 1
//Sección 10
//Proyecto Final

//Program Counter
module counter (input wire clock, reset, load, enable, input wire [11:0]load_data, output reg [11:0]value);
  always @ (posedge clock, posedge reset) begin
    if (reset) begin
      value <= 11'b0;
    end
    else if (load) begin
      value <= load_data;
    end
    else if (enable) begin
      value <= value + 1;
    end
  end
endmodule

//ROM
module ROM (input wire [11:0]address, output wire [7:0]data);
  reg [7:0] ROM [0:4095];
  initial begin
      $readmemh("memory.list", ROM);
  end
  assign data = ROM[address];
endmodule

//Fetch 
module fetch (input wire clk, reset, enable, input wire [7:0]d, output [3:0]inst, oprn);
	reg [3:0]inst;
	reg [3:0]oprn;

	always @ (posedge clk, posedge reset)begin

		if (reset)
			begin
				inst <= 4'b0;
				oprn <= 4'b0;
			end
		else if (enable)
			begin
				oprn <= d[3:0];
				inst <= d[7:4];
			end
	end
endmodule

//Flags
module flags (input wire clk, reset, enable, input wire [1:0]d, output reg [1:0]q);
	always @ (posedge clk or posedge reset or enable)begin
		if (reset) begin
			q <= 2'b0;
		end
    else if (enable) begin
      q <= d;
    end
	end
endmodule

//Phase
module ffd (input wire clk, reset, enable, input wire d, output reg q);
	always @ (posedge clk or posedge reset or enable)begin
		if (reset) begin
			q <= 1'b0;
		end
    else if (enable) begin
      q <= d;
    end
	end
endmodule

module phase (input wire clk, reset, enable, output wire q);
  wire d;
  assign d = ~q;
	ffd d1(clk, reset, enable, d, q);
endmodule

//Decode
module decode(input wire [6:0]address, output reg [12:0]control);
  always @ (address) begin
    casex (address)
    7'b??????0: 
      control <= 13'b1000000001000;
    7'b00001?1: 
      control <= 13'b0100000001000;
    7'b00000?1: 
      control <= 13'b1000000001000;
    7'b00011?1: 
      control <= 13'b1000000001000;
    7'b00010?1: 
      control <= 13'b0100000001000;
    7'b0010??1:
      control <= 13'b0001001000010;
    7'b0011??1:
      control <= 13'b1001001100000;
    7'b0100??1:
      control <= 13'b0011010000010;
    7'b0101??1:
      control <= 13'b0011010000100;
    7'b0110??1:
      control <= 13'b1011010100000;
    7'b0111??1:
      control <= 13'b1000000111000;
    7'b1000?11:
      control <= 13'b0100000001000;
    7'b1000?01:
      control <= 13'b1000000001000;
    7'b1001?11:
      control <= 13'b1000000001000;
    7'b1001?01:
      control <= 13'b0100000001000;
    7'b1010??1:
      control <= 13'b0011011000010;
    7'b1011??1:
      control <= 13'b1011011100000;
    7'b1100??1: 
      control <= 13'b0100000001000;
    7'b1101??1: 
      control <= 13'b0000000001001;
    7'b1110??1: 
      control <= 13'b0011100000010;
    7'b1111??1: 
      control <= 13'b1011100100000;
    default:
      control <= 13'b1111111111111;
    endcase
  end
endmodule

// Buffer triestado
module buffer (input wire enable, input wire [3:0]in, output wire [3:0]out);
  assign out = enable ? in:4'bz;
endmodule

//RAM
module RAM (input wire enable, write, read, input wire [11:0]address_RAM, inout [3:0]data);
  reg [3:0] RAM [0:4095];
  reg [3:0]data_out;

  assign data = (enable & read & ~write) ? data_out:4'bz;
  
  always @ ( address_RAM or data or enable or write ) begin
    if (enable && write) begin
      RAM[address_RAM] = data;
    end
  end
  
  always @ ( address_RAM or enable or write or read) begin
    if (enable && ~write && read) begin
      data_out = RAM[address_RAM];
    end
  end
endmodule


//Acculator

module accumulator (input wire clk, reset, enable, input wire [3:0]result, output reg [3:0]accu);
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
module ALU (input wire [3:0]data_bus, accu, input wire [2:0]selector, output reg [3:0]result, output wire [1:0]flags);
  wire zero;
  reg carry;
  always @ ( * ) begin
    case (selector)
    0:
      {carry, result} <= accu;
    1:
      {carry, result} <= accu - data_bus;
    2:
      {carry, result} <= data_bus;
    3:
      {carry, result} <= accu + data_bus;
    4:
      {carry, result} <= {1'b0, ~(accu & data_bus)};
    default:
      {carry, result} <= 5'b0;
    endcase
  end
  assign zero = (result == 4'b0) ? 1'b1:1'b0;
  assign flags[0] = zero;
  assign flags[1] = carry;
endmodule

//Outputs
module Outputs (input wire clk, reset, enable, input wire [3:0]d, output reg [3:0]q);
	always @ (posedge clk or posedge reset or enable)begin
		if (reset) begin
			q <= 4'b0;
		end
    else if (enable) begin
      q <= d;
    end
	end
endmodule

//union
module uP (input wire clock, reset, input wire [3:0]pushbuttons, output wire phase, c_flag, z_flag, output wire [3:0]instr, oprnd, data_bus, FF_out, accu, output wire [7:0]program_byte, output wire [11:0]PC, address_RAM);
  wire [1:0]flags_in, flags_out;
  wire [12:0]control;
  wire [3:0]alu_result;
  wire [6:0]address;
  assign address = {instr, c_flag, z_flag, phase};
  assign address_RAM = {oprnd, program_byte};
  assign c_flag = flags_out[1];
  assign z_flag = flags_out[0];
  
  decode D1(address, control);
  
  counter PC1(clock, reset, control[11], control[12], address_RAM, PC);
  
  ROM M1(PC, program_byte);
  
  fetch F1(clock, reset, ~phase, program_byte, instr, oprnd);
  
  phase P1(clock, reset, 1'b1, phase); 
  
  flags Fl1(clock, reset, control[9], flags_in, flags_out);
  
  buffer B1(control[1], oprnd, data_bus);
  
  ALU A1(data_bus, accu, control[8:6], alu_result, flags_in);
  
  accumulator A2(clock, reset, control[10], alu_result, accu);
  
  buffer B2(control[3], alu_result, data_bus);
  
  RAM R2(control[5], control[4], control[5], address_RAM, data_bus);
  
  buffer B3(control[2], pushbuttons, data_bus);
  
  Outputs O1(clock, reset, control[0], data_bus, FF_out);
endmodule