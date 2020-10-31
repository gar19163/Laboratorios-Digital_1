//josé Alejandro García Aguirre
//Lab9
//Ejecicio 3

module testbench();

reg clk, reset, enable, J, K;
wire Q;

ffjk U1(clk, reset, enable, J, K, Q);

initial begin
     clk = 0; reset = 0; enable = 0; J = 0; K = 0;
    #2 reset = 0;
    #2 reset = 1;
    #2 reset = 0;
    #2 enable = 1; J = 1;
    #2 enable = 0;
    #2 enable = 1; J = 0;
    #2 K = 1;
    #2 J = 1; K = 0;
    #2 K = 1;
end

always
    #1 clk = ~clk;

initial
    #25 $finish;

initial begin
    $dumpfile("E3_tb.vcd");
    $dumpvars(0, testbench);   
end

endmodule