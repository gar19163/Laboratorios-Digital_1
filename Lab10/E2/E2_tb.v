module testbench();
  reg clock, reset, enable_acu, enabled_tri_1, enabled_tri_2;
  reg [2:0]selector;
  reg [3:0]in;

  wire [1:0]flags;
  wire [3:0]out, accu;

  operacion o1(clock, reset, enable_acu, enabled_tri_1, enabled_tri_2, selector, in, flags, out);

  always
    #1 clock <=~clock;

  initial begin
    #2
    $display(" \nPrograma ");
    $display("clock reset enable_acu enabled_tri_1 enabled_tri_2 selector    in   | flags   out ");
    $display("-------------------------------------------------------------|-------------");
    $monitor("%b       %b      %b          %b           %b       %b      %b  |  %b    %b ", clock, reset, enable_acu, enabled_tri_1, enabled_tri_2, selector, in, flags, out);

		enable_acu = 0; enabled_tri_1 = 0; enabled_tri_2 = 0; reset = 1; selector = 3'b0; in = 4'b0; clock = 0;
    #5  enable_acu = 0; enabled_tri_1 = 0; enabled_tri_2 = 0; reset = 0; selector = 3'b0; in = 4'b0;
    #5  enable_acu = 1; enabled_tri_1 = 1; enabled_tri_2 = 1; reset = 0; selector = 3'b0; in = 4'b1010;
    #5  enable_acu = 1; enabled_tri_1 = 0; enabled_tri_2 = 1; reset = 0; selector = 3'b011; in = 4'b0100;
    #5  enable_acu = 1; enabled_tri_1 = 1; enabled_tri_2 = 0; reset = 0; selector = 3'b010; in = 4'b0001;
    #5  enable_acu = 1; enabled_tri_1 = 1; enabled_tri_2 = 0; reset = 0; selector = 3'b001; in = 4'b0110;
    #5  enable_acu = 0; enabled_tri_1 = 1; enabled_tri_2 = 1; reset = 0; selector = 3'b001; in = 4'b0111;
  end

    initial
      #16 $finish;
    initial begin
        $dumpfile("E2_tb.vcd");
        $dumpvars(0, testbench);
      end
  endmodule