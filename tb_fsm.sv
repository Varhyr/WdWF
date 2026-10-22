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
    assert property (@(posedge clk) (DUT.state == 0)&& run |-> ##1 DUT.state == 1);
    assert property (@(posedge clk) (DUT.state == 1)&& mode && run |-> ##1 DUT.state == 2);
    assert property (@(posedge clk) (DUT.state == 1)&& !mode && run |-> ##1 DUT.state == 3);
    assert property (@(posedge clk) (DUT.state == 2)&& run |-> ##1 DUT.state == 3);
    assert property (@(posedge clk) (DUT.state == 3)&& run |-> ##1 DUT.state == 0);

    assert property (@(posedge clk) DUT.state == 0 |-> vector == 4'b0001);
    assert property (@(posedge clk) DUT.state == 1 |-> vector == 4'b0010);
    assert property (@(posedge clk) DUT.state == 2 |-> vector == 4'b0100);
    assert property (@(posedge clk) DUT.state == 3 |-> vector == 4'b1000);

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