module tb_fifo;
    reg clk;
    reg FIFO_clr_n;
    reg FIFO_rst_n;
    reg push;
    reg pop;
    reg [7:0] data_in;
    wire [7:0] data_out;

    fifo DUT (
        .clk(clk),
        .FIFO_clr_n(FIFO_clr_n),
        .FIFO_rst_n(FIFO_rst_n),
        .push(push),
        .pop(pop),
        .data_in(data_in),
        .data_out(data_out)
    );

    always begin
        clk = 0;
        forever #10 clk = ~clk;
    end



    initial begin
        FIFO_clr_n = 1;
        FIFO_rst_n = 0;
        push = 0;
        pop = 0;
        data_in = 8'h00;
        #20;
        FIFO_rst_n = 1;

        #30;
        data_in = 8'h01;
        push = 1;
        #20;
        push = 0;
        #20;
        data_in = 8'h02;
        push = 1;
        #20;
        push = 0;
        #20;
        data_in = 8'h03;
        push = 1;
        #20;
        push = 0;
        #20;
        pop = 1;
        #20;
        pop = 0;
        #20;
        pop = 1;
        #20;
        pop = 0;
        #20;
        pop = 1;
        #20;
        pop = 0;
    end
endmodule