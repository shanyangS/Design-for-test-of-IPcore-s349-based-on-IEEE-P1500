`timescale 1ns/1ps;

module WIR_tb();
	reg CaptureWR,WPSE,UpdateWR,WRCK,WRSTN,ShiftWR,SelectWIR;
	reg[2:0] wir_wsi;
	wire wir_wpc,wir_extest,wir_intest,
hold_inputs,hold_outputs,wir_wso;

always #5 WRCK = ~WRCK;

WIR ir1
(
.CaptureWR(CaptureWR),
.WPSE(WPSE),
.UpdateWR(UpdateWR),
.WRCK(WRCK),
.wir_wsi(wir_wsi),
.WRSTN(WRSTN),
.ShiftWR(ShiftWR),
.SelectWIR(SelectWIR),
.wir_wpc(wir_wpc),
.wir_extest(wir_extest),
.wir_intest(wir_intest),
.hold_inputs(hold_inputs),
.hold_outputs(hold_outputs),
.wir_wso(wir_wso)
);

initial
begin
	WRCK <= 0;
	#20 WRSTN <= 0;
	#20 WRSTN <= 1;
	ShiftWR <= 1; SelectWIR <= 1; UpdateWR <= 1;
	#20 CaptureWR <= 1; wir_wsi <= 3'b111; WPSE <=1;
	#20 CaptureWR <= 0; wir_wsi <= 3'b110; WPSE <=1;
	#20 CaptureWR <= 1; wir_wsi <= 3'b001; WPSE <=1;
	#20 CaptureWR <= 1; wir_wsi <= 3'b011; WPSE <=1;
	#20 CaptureWR <= 0; wir_wsi <= 3'b101; WPSE <=1;
	#50 $stop;
end
endmodule

/*
module WIR(CaptureWR,WPSE,UpdateWR,WRCK,wir_wsi,WRSTN,ShiftWR,SelectWIR
,wby_shift,wir_wpc,wir_extest,wir_intest,wir_scanmode,
hold_inputs,hold_outputs,wir_wso);

 input CaptureWR,WPSE,UpdateWR,WRCK,wir_wsi,WRSTN,ShiftWR,SelectWIR;
 output wby_shift,wir_wpc,wir_extest,wir_intest,wir_scanmode,
hold_inputs,hold_outputs,wir_wso;
 wire and_wir1,wdr_shift,wby_shift,and_wir2;
 wire wir_bypass;
 reg[0:3] dout_sr,wir_wso,data_out_IDUR;

 
*/