`timescale 1ns/10ps;
module shift_register_tb();

reg clk,WRSTN;
reg[2:0] din;
wire[2:0] dout;

shift_register kn1
(
.clk(clk),
.WRSTN(WRSTN),
.din(din),
.dout(dout)
);

always #5 clk = ~clk;

initial
begin
	clk = 0; WRSTN = 0;
	#20 WRSTN = 1;
	#20 din = 3'b101;
	#20 din = 3'b111;
	#20 din = 3'b100;
	#20 din = 3'b001;
	#20 din = 3'b001;
	#50 $stop;
end
endmodule
/*module shift_register(clk, din, dout, WRSTN);  
 
input clk,WRSTN;  
 
input [2:0] din;  
 
output reg[2:0] dout;  
 
 
always @(posedge clk or negedge WRSTN)  
begin
	if(!WRSTN)

	begin
		dout <= 3'b0;
	end

	else
	begin  
		dout <= din[2:1];  
	end

end  
 
endmodule  */




/*
module shift_register(clk,clr,e,din,dout);
 
 input clk,clr,e;
 input [0:3] din;
 output reg[0:3] dout;
 
always@(posedge clk or posedge clr)
 begin
  if(clr)
   dout <= 4'b0;
  else if(e)
   dout = {1'b0, din[1:3]};
 end*/