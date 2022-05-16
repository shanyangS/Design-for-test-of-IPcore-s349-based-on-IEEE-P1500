module top
(
	input GND,VDD,CK,START,
	B0,B1,B2,B3,A0,A1,A2,A3,
	wby_si,wby_shift,
	input[2:0] wir_wsi,
	input WRSTN,WRCK,SelectWIR,ShiftWR,CaptureWR,UpdateWR,
	output wir_wso,CNTVCO2,CNTVCON2,READY,P0,P1,P2,P3,P4,P5,P6,P7
);

wire SE,HE,wir_wpc,wir_extest,
wby_wire,wir_intest,hold_inputs,hold_outputs;

wire CNTVCO2_wire,CNTVCON2_wire,READY_wire,
P7_wire,P6_wire,P5_wire,P4_wire,P3_wire,P2_wire,P1_wire,
P0_wire;

s349 kn1(.GND(GND),.VDD(VDD),.CK(CK),.START(START),
.B0(B0),.B1(B1),.B2(B2),.B3(B3),
.A0(A0),.A1(A1),.A2(A2),.A3(A3),
.CNTVCO2(CNTVCO2),.CNTVCON2(CNTVCON2),.READY(READY),
.P0(P0),.P1(P1),.P2(P2),.P3(P3),.P4(P4),.P5(P5),.P6(P6),.P7(P7));

WIR p1(.CaptureWR(CaptureWR),.WPSE(WPSE),.UpdateWR(UpdateWR),
.WRCK(CK),.WRSTN(WRSTN),.ShiftWR(ShiftWR),.SelectWIR(SelectWR)
,.wir_wsi(wir_wsi),.wir_wpc(wir_wpc),.wir_extest(wir_extest),
.wir_intest(wir_intest),
.hold_inputs(hold_inputs),.hold_outputs(hold_outputs),.wir_wso(wir_wso));

mux21 p2(.a(),.b(),.s(),.y(mux21_wire));
mux21 p3(.a(mux21_wire),.b(),.s(SelectWR),.y(WSO));

WBY y1(.clk(CK),.wby_si(wby_si),.wby_shift(by_shift),.q(wby_wire));

WBR a0(.SE(SE),.HE(HE),.CFI(CFI),.CTI(A0),.clk(CK),.CFO(CFO_0),.CTO(A0_wire));
WBR a1(.SE(SE),.HE(HE),.CFI(CFO_0),.CTI(A1),.clk(CK),.CFO(CFO_1),.CTO(A1_wire));
WBR a2(.SE(SE),.HE(HE),.CFI(CFO_1),.CTI(A2),.clk(CK),.CFO(CFO_2),.CTO(A2_wire));
WBR a3(.SE(SE),.HE(HE),.CFI(CFO_2),.CTI(A3),.clk(CK),.CFO(CFO_3),.CTO(A3_wire));
WBR a4(.SE(SE),.HE(HE),.CFI(CFO_3),.CTI(B0),.clk(CK),.CFO(CFO_4),.CTO(B0_wire));
WBR a5(.SE(SE),.HE(HE),.CFI(CFO_4),.CTI(B1),.clk(CK),.CFO(CFO_5),.CTO(B1_wire));
WBR a6(.SE(SE),.HE(HE),.CFI(CFO_5),.CTI(B2),.clk(CK),.CFO(CFO_6),.CTO(B2_wire));
WBR a7(.SE(SE),.HE(HE),.CFI(CFO_6),.CTI(B3),.clk(CK),.CFO(CFO_7),.CTO(B3_wire));
WBR a8(.SE(SE),.HE(HE),.CFI(CFO_7),.CTI(START),.clk(CK),.CFO(CFO_8),.CTO(START_wire));
WBR a9(.SE(SE),.HE(HE),.CFI(CFO_8),.CTI(CNTVCO2_wire),.clk(CK),.CFO(CFO_9),.CTO(CNTVCO2));
WBR a10(.SE(SE),.HE(HE),.CFI(CFO_9),.CTI(CNTVCON2_wire),.clk(CK),.CFO(CFO_10),.CTO(CNTVCON2));
WBR a11(.SE(SE),.HE(HE),.CFI(CFO_10),.CTI(READY_wire),.clk(CK),.CFO(CFO_11),.CTO(READY));
WBR a12(.SE(SE),.HE(HE),.CFI(CFO_11),.CTI(P7_wire),.clk(CK),.CFO(CFO_12),.CTO(P7));
WBR a13(.SE(SE),.HE(HE),.CFI(CFO_12),.CTI(P6_wire),.clk(CK),.CFO(CFO_13),.CTO(P6));
WBR a14(.SE(SE),.HE(HE),.CFI(CFO_13),.CTI(P5_wire),.clk(CK),.CFO(CFO_14),.CTO(P5));
WBR a15(.SE(SE),.HE(HE),.CFI(CFO_14),.CTI(P4_wire),.clk(CK),.CFO(CFO_15),.CTO(P4));
WBR a16(.SE(SE),.HE(HE),.CFI(CFO_0),.CTI(P3_wire),.clk(CK),.CFO(),.CTO(P3));
WBR a17(.SE(SE),.HE(HE),.CFI(CFO_0),.CTI(P2_wire),.clk(CK),.CFO(),.CTO(P2));
WBR a18(.SE(SE),.HE(HE),.CFI(CFO_0),.CTI(P1_wire),.clk(CK),.CFO(),.CTO(P1));
WBR a19(.SE(SE),.HE(HE),.CFI(CFO_0),.CTI(P0_wire),.clk(CK),.CFO(),.CTO(P0));

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
/*
module WIR
(
	input CaptureWR,WPSE,UpdateWR,WRCK,WRSTN,ShiftWR,SelectWIR,
	input[2:0] wir_wsi,
	output wir_wpc,wir_extest,wir_intest,hold_inputs,hold_outputs,wir_wso
	
);
*/
endmodule