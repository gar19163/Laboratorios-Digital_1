//josé Alejandro García Aguirre
//Lab9
//Ejecicio 3

module ffd(input wire clk, reset, enable, D, output reg Q);

    always @(posedge clk or posedge reset) begin
        if(reset)
            Q <= 0;
        else if (enable)
            Q <= D; 
    end
endmodule

module ffjk(input wire clk, reset, enable, J, K, output wire Q);

    wire nQ, nK, aJ, aK, q;

    not(nQ, Q);
    not(nK, K);
    and(aJ, J, nQ);
    and(aK, nK, Q);
    or(q, aJ, aK);

		ffd U1(clk, reset, enable, q, Q);
endmodule
