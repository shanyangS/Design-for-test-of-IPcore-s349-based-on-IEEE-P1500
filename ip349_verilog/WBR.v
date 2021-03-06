module WBR
(
	input SE,HE,CFI,CTI,clk,
	output CFO,CTO
);

	wire mux_o1;

mux21 a0(.a(CFO),.b(CTI),.s(SE),.y(mux_o1));
D_FF a1(.clk(clk),.d(mux_o1),.q(CTO));
mux21 a2(.a(CFI),.b(CTO),.s(HE),.y(CFO));


endmodule
