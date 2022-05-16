`timescale 1ns/1ps;

module WBR_tb();

	reg SE,HE,CFI,CTI,clk;
	wire CFO,CTO;

WBR b1
(
.CFI(CFI),
.CTI(CTI),
.SE(SE),
.HE(HE),
.clk(clk),
.CFO(CFO),
.CTO(CTO)
);

always #5 clk = ~clk;



initial
	begin
	clk = 0;
	#20 SE = 0; HE = 1; CFI = 1; CTI = 1;
	#20 SE = 1; HE = 0; CFI = 1; CTI = 1;
	#20 SE = 1; HE = 1; CFI = 1; CTI = 1;
	#20 SE = 0; HE = 0; CFI = 1; CTI = 0;
	#20 SE = 1; HE = 0; CFI = 0; CTI = 1;
	#20 SE = 1; HE = 1; CFI = 1; CTI = 1;
	#20 SE = 0; HE = 0; CFI = 1; CTI = 1;
	#40 $stop;
	end

endmodule

/*module WBR
(
	input SE,HE,CFI,CTI,clk,
	output CFO,CTO
);

	wire mux_o1;

mux21 a0(.a(CFO),.b(CTI),.s(SE),.y(mux_o1));
D_FF a1(.clk(clk),.d(mux_o1),.q(CTO));
mux21 a2(.a(CFI),.b(CTO),.s(HE),.y(CFO));


endmodule */
