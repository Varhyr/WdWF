module asercje;

logic req;
logic gnt;

logic clk;

logic a, b, c, d;


//assert property (@(posedge clk) req |-> ##3 gnt);
//assert property (@(posedge clk) $rose(req) |-> ##[1:2] req);
assert property (@(posedge clk) (a&&b) ##1 c |-> ##1 d);
assert property (@(posedge clk) a|-> ##1 b ##1 !c ##1 d);

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
#10; req<= 1; gnt<=1;
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

#10; a<=1; b<=1; c<=0; d<=1;
#10; a<=1; b<=0; c<=1; d<=0;
#10; a<=0; b<=1; c<=0; d<=1;
#10; a<=1; b<=1; c<=0; d<=0;
#10; a<=0; b<=0; c<=1; d<=1;
#10; a<=1; b<=0; c<=0; d<=0;

end




endmodule