module asercje;

logic req;
logic gnt;

logic clk;

logic a, b, c, d;


initial clk =0;
always #5 clk <= ~clk;

initial begin
     req<= 0; gnt<=0;
#10; req<= 1; gnt<=0;
#10; req<= 0; gnt<=0;
#10; req<= 0; gnt<=0;
#10; req<= 0; gnt<=1;
#10; req<= 0; gnt<=0;
#10; req<= 1; gnt<=0;
#10; req<= 1; gnt<=0;
#10; req<= 0; gnt<=0;
#10; req<= 0; gnt<=1;
#10; req<= 0; gnt<=1;
#10; req<= 1; gnt<=1;
#10; req<= 0; gnt<=0;
#10; req<= 0; gnt<=0;
#10; req<= 0; gnt<=0;
#10; req<= 0; gnt<=1;
#10; req<= 0; gnt<=0;
#10; req<= 1; gnt<=0;
#10; req<= 0; gnt<=0;
#10; req<= 0; gnt<=0;
#10; req<= 0; gnt<=0;
end




endmodule