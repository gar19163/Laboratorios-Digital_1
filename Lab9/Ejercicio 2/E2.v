//José Alejandro García Aguirre
//Lab9
//Ejecicio 2

module ffd1 (input clk, reset, enable, d, output reg q);
    always @ (posedge clk or posedge reset)begin
        if (reset) begin
            q <= 1'b0;
        end
        else if (enable) begin
            q <= d;
        end
    end   
endmodule


module fft(input wire clk, reset, enable, output wire Y);
    wire d;    
    not (d, Y);
    ffd1 u(clk, reset, enable, d, Y);
endmodule