`timescale 1ns/10ps;
module Id_UR_tb();
	reg[2:0] data_in;
	reg UpdateWR,WRSTN,WRCK;
	wire[2:0] data_out;
	wire wir_bypass;

Id_UR ur1
(
.data_in(data_in),
.UpdateWR(UpdateWR),
.WRSTN(WRSTN),
.WRCK(WRCK),
.data_out(data_out),
.wir_bypass(wir_bypass)
);

always #5 WRCK = ~WRCK;

initial
begin
	WRCK <= 0; WRSTN <= 0;
	#20 WRSTN <=1; UpdateWR <= 1; data_in <= 3'b010;
	#20 data_in <= 3'b110;
	#20 data_in <= 3'b011;
	#20 data_in <= 3'b111;
	#20 data_in <= 3'b000;
	#20 data_in <= 3'b101;
	#50 $stop;
end

endmodule

/*
module Id_UR
(
	input[2:0] data_in,
	input UpdateWR,WRSTN,WRCK,
	output reg[2:0] data_out,
	output reg wir_bypass
);

always@(posedge WRCK or negedge WRSTN)
begin
	if(WRSTN)
	data_out <= 4'b0;
		else if(UpdateWR)
		data_out <= data_in;
			if(data_out == 4'b0)
			wir_bypass <= 0;
end

endmodule
*/
