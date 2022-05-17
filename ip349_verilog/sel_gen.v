module sel_gen
(
	input wir_bypass,wir_wpc,wir_extest,wir_intest,
	output reg mux01,mux02,mux03,mux04,mux05,mux06,mux07,mux08,SE,HE
);


always@(*)
begin
	if(wir_bypass == 1)
	begin
	mux01 <= 0; mux02 <= 0; mux03 <= 0; mux04 <= 0; 
	mux05 <= 0; mux06 <= 0; mux07 <= 0; mux08 <= 0; 
	SE = 0; HE = 1;
	end
	if(wir_wpc == 1)
	begin
	mux01 <= 0; mux02 <= 0; mux03 <= 0; mux04 <= 1; 
	mux05 <= 1; mux06 <= 1; mux07 <= 0; mux08 <= 0; 
	SE = 1; HE = 0;
	end
	if(wir_extest == 1)
	begin
	mux01 <= 1; mux02 <= 1; mux03 <= 1; mux04 <= 1; 
	mux05 <= 1; mux06 <= 1; mux07 <= 1; mux08 <= 1; 
	SE = 0; HE = 1;
	end
	if(wir_intest == 1)
	begin
	mux01 <= 1; mux02 <= 1; mux03 <= 1; mux04 <= 1; 
	mux05 <= 1; mux06 <= 1; mux07 <= 1; mux08 <= 1; 
	SE = 1; HE = 0;
	end
end
endmodule
