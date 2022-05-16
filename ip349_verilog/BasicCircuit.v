`timescale 1ns/10ps

module my_and(a,b,c);
  input  a,b;
  output c;

  assign c = a & b;
endmodule


module my_or(a,b,c);
  input  a,b;
  output c;

  assign c = a | b;
endmodule


module my_not(a,b);
  input  a;
  output b;

  assign b = ~a;
endmodule


module D_FF(clk, d, q);

input clk,d;
output reg q;

always@(posedge clk) 
	begin
		q <= d;
	end

endmodule


module mux21(a,b,s,y);
  input a,b,s;
  output y;  

assign y=(s)?b:a;

endmodule


module shift_register(e, clk, din, dout, WRSTN);  
 
input clk,WRSTN,e;  
 
input [2:0] din;  
 
output reg[2:0] dout;  
 
 
always @(posedge clk or negedge WRSTN)  
begin
	if(!WRSTN)

	begin
		dout <= 3'b0;
	end

	else if(e)
	begin  
		dout <= din[2:1];  
	end

end  
 
endmodule  



module Id_UR
(
	input[2:0] data_in,
	input UpdateWR,WRSTN,WRCK,
	output reg[2:0] data_out,
	output reg wir_bypass
);

always@(posedge WRCK or negedge WRSTN)
begin
	if(!WRSTN)
	data_out <= 4'b0;
	else if(UpdateWR)begin
	data_out <= data_in;begin
		if(data_out == 3'b0)
		wir_bypass <= 1;
		else
		wir_bypass <= 0;
		end
	end
end

endmodule