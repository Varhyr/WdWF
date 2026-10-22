module fifo #(
    parameter FIFO_width = 8,
    parameter FIFO_depth = 16
) (
    input  wire                  clk,
    input  wire                  FIFO_clr_n,
    input  wire                  FIFO_rst_n,
    input  wire                  push,
    input  wire                  pop,
    input  wire [FIFO_width-1:0] data_in,
    output wire [FIFO_width-1:0] data_out
);

    localparam PTR_WIDTH = (FIFO_depth > 1) ? $clog2(FIFO_depth) : 1;
    localparam COUNT_WIDTH = $clog2(FIFO_depth + 1);

    reg [FIFO_width-1:0] storage [0:FIFO_depth-1];
    reg [PTR_WIDTH-1:0] read_ptr;
    reg [PTR_WIDTH-1:0] write_ptr;
    reg [COUNT_WIDTH-1:0] count;

    wire empty = (count == 0);
    wire full = (count == FIFO_depth);
    wire do_pop = pop && !empty;
    wire do_push = push && (!full || do_pop);

    // Storage is not reset; expose zero when no valid entry is present.
    assign data_out = empty ? {FIFO_width{1'b0}} : storage[read_ptr];

    always @(posedge clk or negedge FIFO_rst_n) begin
        if (!FIFO_rst_n) begin
            read_ptr  <= 0;
            write_ptr <= 0;
            count     <= 0;
        end else if (!FIFO_clr_n) begin
            read_ptr  <= 0;
            write_ptr <= 0;
            count     <= 0;
        end else begin
            if (do_push) begin
                storage[write_ptr] <= data_in;
                if (write_ptr == FIFO_depth - 1)
                    write_ptr <= 0;
                else
                    write_ptr <= write_ptr + 1'b1;
            end

            if (do_pop) begin
                if (read_ptr == FIFO_depth - 1)
                    read_ptr <= 0;
                else
                    read_ptr <= read_ptr + 1'b1;
            end

            case ({do_push, do_pop})
                2'b10: count <= count + 1'b1;
                2'b01: count <= count - 1'b1;
                default: count <= count;
            endcase
        end
    end

endmodule
