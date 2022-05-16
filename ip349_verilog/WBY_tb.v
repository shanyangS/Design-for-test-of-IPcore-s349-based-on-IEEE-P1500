`timescale 1ns/1ps;

module WBY_tb();
	reg clk,wby_si,wby_shift;
	wire q;



WBY w2
(
.wby_si(wby_si),
.wby_shift(wby_shift),
.clk(clk),
.q(q)
);

always #5 clk = ~clk;

initial
begin
	clk = 0;
	#20 wby_si <= 1; wby_shift <= 0; 
	#20 wby_si <= 1; wby_shift <= 1; 
	#20 wby_si <= 0; wby_shift <= 0; 
	#20 wby_si <= 1; wby_shift <= 0; 
	#20 wby_si <= 0; wby_shift <= 1; 
	#20 wby_si <= 1; wby_shift <= 0; 
	#50 $stop;
	
end
endmodule

/*
module WBY
(input clk,wby_si,wby_shift,
 output q
);

 wire wby_so;

 D_FF i0(.clk(clk),.d(wby_so),.q(q));
 mux21 y0(.a(q),.b(wby_si),.s(wby_shift),.y(wby_so));


endmodule
*/
