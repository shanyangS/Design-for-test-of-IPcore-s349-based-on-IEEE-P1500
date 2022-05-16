module WIR
(
	input CaptureWR,WPSE,UpdateWR,WRCK,WRSTN,ShiftWR,SelectWIR,
	input[2:0] wir_wsi,
	output wir_wpc,wir_extest,wir_intest,hold_inputs,hold_outputs,wir_wso
	
);

 wire and_wir1,wby_shift,and_wir2,wir_bypass;
 wire[2:0] dout_sr,data_out_IDUR; 

 my_and r1(ShiftWR,SelectWIR,and_wir1);
 shift_register r2(.e(and_wir1),.clk(WRCK),.WRSTN(WRSTN),.din(wir_wsi),.dout(dout_sr));
 D_FF r3(.clk(~WRCK),.d(dout_sr[2]),.q(wir_wso)); 
 Id_UR r4(.UpdateWR(UpdateWR),.WRSTN(WRSTN),.WRCK(WRCK),.data_in(dout_sr),.data_out(data_out_IDUR),
.wir_bypass(wir_bypass));
 my_and r5(ShiftWR,~SelectWR,wdr_shift);
 my_and r6(wdr_shift,wir_bypass,wby_shift);
 mux21 r7(.a(wdr_shift),.b(WPSE),.s(data_out_IDUR[0]),.y(mux_t1));
 mux21 r8(.a(~CaptureWR),.b(WPSE),.s(data_out_IDUR[0]),.y(mux_t2));
 D_FF r9(.clk(WRCK),.d(WPSE),.q(dff_out1));
 my_and r10(~WPSE,dff_out1,and_wir2);
 mux21 r11(.a(~CaptureWR),.b(~dff_out1),.s(data_out_IDUR[0]),.y(mux_t3));
 mux21 r13(.a(1'b1),.b(mux_t2),.s(data_out_IDUR[1]),.y(hold_inputs));
 mux21 r14(.a(1'b1),.b(mux_t3),.s(data_out_IDUR[1]),.y(hold_outputs));
 Id_UR r15(.data_in(dout_sr),.UpdateWR(UpdateWR),.WRSTN(WRSTN),.WRCK(WRCK),.data_out(data_out_IDUR),.wir_bypass(wir_bypass));

 assign wir_wpc = data_out_IDUR[0];
 assign wir_extest = data_out_IDUR[1];
 assign wir_intest = data_out_IDUR[2];
 
 
endmodule

/*
module Id_UR
(
	input[2:0] data_in,
	input UpdateWR,WRSTN,WRCK,
	output reg[2:0] data_out,
	output reg wir_bypass
);
*/