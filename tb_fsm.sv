module tb_fsm;

    reg clk;
    reg run;
    reg mode;
    wire [3:0] vector;

    fsm uut (
        .clk(clk),
        .run(run),
        .mode(mode),
        .vector(vector)
    );

    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    initial begin
        run = 0;
        mode = 0;
        #50;

        run = 1;

        #100;
        mode = 1;
        #100;
        $finish;
    end
    
endmodule