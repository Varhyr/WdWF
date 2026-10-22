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



    // initial begin
    //     FIFO_clr_n = 1;
    //     FIFO_rst_n = 0;
    //     push = 0;
    //     pop = 0;
    //     data_in = 8'h00;
    //     #20;
    //     FIFO_rst_n = 1;

    //     #30;
    //     data_in = 8'h01;
    //     push = 1;
    //     #20;
    //     push = 0;
    //     #20;
    //     data_in = 8'h02;
    //     push = 1;
    //     #20;
    //     push = 0;
    //     #20;
    //     data_in = 8'h03;
    //     push = 1;
    //     #20;
    //     push = 0;
    //     #20;
    //     pop = 1;
    //     #20;
    //     pop = 0;
    //     #20;
    //     pop = 1;
    //     #20;
    //     pop = 0;
    //     #20;
    //     pop = 1;
    //     #20;
    //     pop = 0;
    // end


    localparam st_1 = 1;
    localparam st_2 = 2;
    localparam st_3 = 3;
    localparam st_4 = 4;
    localparam st_5 = 5;
    localparam st_6 = 6;
    localparam st_7 = 7;
    localparam st_8 = 8;
    localparam st_9 = 9;
    localparam st_10 = 10;
    localparam st_11 = 11;
    localparam st_12 = 12;
    localparam st_13 = 13;
    localparam st_14 = 14;
    localparam st_15 = 15;
    localparam st_16 = 16;
    localparam st_17 = 17;
    localparam st_18 = 18;
    localparam st_19 = 19;
    localparam st_20 = 20;

    reg [4:0] state;

    task reset_fifo;
        begin
            FIFO_clr_n = 1;
            FIFO_rst_n = 0;
            push = 0;
            pop = 0;
            data_in = 8'h00;
            #20;
            FIFO_rst_n = 1;
        end
    endtask

    task push_data(input [7:0] value);
        begin
            data_in = value;
            push = 1;
            #20;
            push = 0;
        end
    endtask
    task pop_data;
        begin
            pop = 1;
            #20;
            pop = 0;
        end
    endtask


    assert property (@(posedge clk) DUT.full |-> ##1 !push);
    assert property (@(posedge clk) DUT.empty |-> ##1 !pop);


    initial begin
        reset_fifo;
        #20;
        pop_data;
        #20;
        push_data(8'h01);
        #20;
        push_data(8'h02);
        #20;
        pop_data;
        #20;
        push_data(8'h03);
        #20;
        push_data(8'h04);
        #20;
        push_data(8'h03);
        #20;
        push_data(8'h03);
        #20;
        push_data(8'h03);
        #20;
        push_data(8'h03);
        #20;
        push_data(8'h03);
        #20;
        push_data(8'h03);
        #20;
        push_data(8'h03);
        #20;
        push_data(8'h03);
        #20;
        push_data(8'h03);
        #20;
        push_data(8'h03);
        #20;
        push_data(8'h03);
        #20;
        push_data(8'h03);
        #20;
        push_data(8'h03);
        #20;
        push_data(8'h03);
        #20;
        
        pop_data;
        #20;
    end



    
endmodule