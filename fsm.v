module fsm(
    input clk,
    input run,
    input mode,
    output reg [3:0] vector
);

reg [1:0] state;

localparam st_0 = 2'b00;
localparam st_1 = 2'b01;
localparam st_2 = 2'b10;
localparam st_3 = 2'b11;


always @(posedge clk) begin
    case (state)
        st_0: state <= run ? st_1 : st_0;
        st_1: state <= run ? (mode ? st_2 : st_3) : st_1;
        st_2: state <= run ? st_3 : st_2;
        st_3: state <= run ? st_0 : st_3;
        default: state <= st_0;
    endcase
end

always @(*) begin
    case (state)
        st_0: vector = 4'b0001;
        st_1: vector = 4'b0010;
        st_2: vector = 4'b0100;
        st_3: vector = 4'b1000;
        default: vector = 4'b0000;
    endcase
end
endmodule