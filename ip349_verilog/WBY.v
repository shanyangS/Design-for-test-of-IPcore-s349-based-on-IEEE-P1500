module WBY
(input clk,wby_si,wby_shift,
 output q
);

 wire wby_so;

 D_FF i0(.clk(clk),.d(wby_so),.q(q));
 mux21 y0(.a(q),.b(wby_si),.s(wby_shift),.y(wby_so));


endmodule

