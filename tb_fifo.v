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

    initial begin
        always @(posedge clk) begin
            case (state)
                st_1: begin
                    FIFO_clr_n = 1;
                    FIFO_rst_n = 0;
                    push = 0;
                    pop = 0;
                    data_in = 8'h00;
                 
                end
                st_2: begin

                    FIFO_rst_n = 1;
                    state = st_3;
                end
                st_3: begin
                    data_in = 8'h01;
                    push = 1;
                    state = st_4;
                end
                st_4: begin
                    // Define behavior for state 4
                    push = 0;
                    state = st_5;
                end 
                st_5: begin
                    // Define behavior for state 5
                    data_in = 8'h02;
                    push = 1;
                    state = st_6;
                end
                st_6: begin
                    // Define behavior for state 6
                    push = 0;
                    state = st_7;
                end
                st_7: begin
                    // Define behavior for state 7
                    data_in = 8'h03;
                    push = 1;
                    state = st_8;
                end
                st_8: begin
                    // Define behavior for state 8
                    push = 0;
                    state = st_9;
                end
                st_9: begin
                    // Define behavior for state 9
                    pop = 1;
                    state = st_10;
                end
                st_10: begin
                    // Define behavior for state 10
                    pop = 0;
                    state = st_11;
                end
                st_11: begin
                    // Define behavior for state 11
                    pop = 1;
                    state = st_12;
                end
                st_12: begin
                    // Define behavior for state 12
                    pop = 0;
                    state = st_13;
                end
                st_13: begin
                    // Define behavior for state 13
                    pop = 1;

                    state = st_14;
                end
                st_14: begin
                    // Define behavior for state 14
                    pop = 0;
                    state = st_15;
                end
                st_15: begin
                    // Define behavior for state 15
                    state = st_16;
                end
                st_16: begin
                    // Define behavior for state 16
                    state = st_17;
                end
                st_17: begin
                    // Define behavior for state 17
                    state = st_18;
                end
                st_18: begin
                    // Define behavior for state 18
                    state = st_19;
                end
                st_19: begin
                    // Define behavior for state 19
                    state = st_20;
                end
                st_20: begin
                    // Define behavior for state 20
                    state = st_1;
                end
                default: state = st_1;
            endcase
        end
    end
endmodule