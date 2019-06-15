// 2:1 mux
`timescale 1ns/10ps


module mux_2x1(out_o, in_i, sel_i);
	input logic [1:0]in_i;
	input logic sel_i;
	output logic out_o;
	
	// assign out = (i1 & sel) | (i0 & ~sel); 
	
	logic temp_1;
	logic temp_2;
	logic not_sel;
	
	
	and #5 and_gate_1 (temp_1, in_i[1], sel_i); // in[1] & sel
	
	not #5 not_gate (not_sel, sel_i); // ~sel
	and #5 and_gate_2 (temp_2, in_i[0], not_sel);
 
	or #5 or_gate_1(out_o, temp_1, temp_2);
	
endmodule


module mux_2x1_testbench;
	logic [1:0]in_i;
	logic sel_i;
	logic out_o;
	
	integer i;
	initial begin	
		for (int i = 0; i < 8; i++) begin
			{sel_i, in_i[1:0]} = i; #10;
		end
	end	
	 
	mux_2x1 dut(.out_o, .in_i, .sel_i);

endmodule