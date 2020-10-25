// -----------------------------------
// José Alejandro Garía Aguirre
// Digital 
// lab6
// -----------------------------------
// Codigo
// -----------------------------------

// -----------------------------------
// Flip Flop tipo D
// -----------------------------------
module ffd(input wire clk,reset,set, input wire [3:0]D, output reg [3:0]Q);
module ffd(input wire clk,reset,set, input wire [3:0]D, output reg [3:0]Q);
  always @ (posedge clk, posedge set, posedge reset) begin
    if(reset) begin
      Q <= 4'b0;
    end
    else if (set) begin
      Q <= 4'b1111;
    end
    else
      Q <= D;
    end
endmodule

module ffd2(input wire clk,reset, input wire D, output reg Q);
  always @ (posedge clk, posedge reset) begin
    if(reset) begin
      Q <= 1'b0;
    end
    else
      Q <= D;
    end
endmodule

module FSM1(input wire A, B,clk, reset, output wire S00, S11, SF0, SF1, Y);
    wire S1 , S0;

    assign SF0 = (~S1 & ~S0 & A);
    assign SF1 = ((S0 & B) | (S1 & A & B));

    ffd2 U1(clk, reset,SF1, S1);
    ffd2 U2(clk, reset,SF0, S0);
    assign S00 = S0;
    assign S11 = S1;
    assign Y = (S1 & A & B);
endmodule

module FSM2(input wire A, clk, reset, output wire O1, O2, O3);
    wire S0, S1, S2;

    assign SF0 = ((A & S2 & S1) | (~A & ~S2 & S1) | (~A & S2 & ~S1) | (A & ~S2 & ~S1));
    assign SF1 = ((S1 & ~S0) | (~A & S1 & S2) | (A & ~S2 & S0));
    assign SF2 = ((S2 & S0) | (A & S1 & ~S0) | (~A & ~S1 & ~S0));

    ffd2 U1(clk, reset, SF0, S0);
    ffd2 U2(clk, reset, SF1, S1);
    ffd2 U3(clk, reset, SF2, S2);

    assign O1 = S0;
    assign O2 = S1;
    assign O3 = S2;
endmodule