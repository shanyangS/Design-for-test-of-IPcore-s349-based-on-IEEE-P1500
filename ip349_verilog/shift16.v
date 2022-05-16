module register_right(clk, din, dout);  
 
input clk;  
 
input [3:0] din;  
 
output [3:0] dout;  
 
reg [3:0] dout;  
 

 
always @(posedge clk)  
 
begin  
 
dout <= {din[0], din[3:1]};  
 
 end  
 
endmodule  
