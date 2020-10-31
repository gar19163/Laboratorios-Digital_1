//José Alejandro García Aguirre
//Lab9
//Ejecicio 2 tb

module testbench();

reg clk, reset, enable, T;
wire salida;


fft f(clk, reset, enable,salida);


        always 
            begin 
                clk <= 0; reset <= 0; #1 clk <= 1; #1;
            end

            
    initial begin
        $display("----------------------------");
		$display("----------------------------");
        $display("----------FF T--------------");
        $display("clk | reset | enable | T  | salida");
        $monitor("%b  | %b  |    %b    | %b | %b ", clk,reset, enable, T, salida);
        clk = 0; reset = 0; enable = 0; T = 0;        
     #1  reset = 1;
     #1  reset = 0;
     #2  enable = 1;  
     #2  T = 1;
    end

   always
    #1  clk = ~clk;
  
   initial 
        #25 $finish;

        initial begin
            $dumpfile("E2_tb.vcd");
            $dumpvars(0, testbench);
        end

        endmodule