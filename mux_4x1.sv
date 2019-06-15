// 4:1 mux constructed by 3 2:1 mux
`timescale 1ns/10ps
module mux_4x1(out_o, in_i, sel_i);
	input logic [3:0]in_i;
	input logic [1:0]sel_i;
	output logic out_o;
	
	logic [1:0]temp;
	
	mux_2x1 mux_2x1_1 (temp[1], in_i[3:2], sel_i[0]);
	mux_2x1 mux_2x1_2 (temp[0], in_i[1:0], sel_i[0]);
	mux_2x1 mux_2x1_3 (out_o, temp[1:0], sel_i[1]);
endmodule


module mux_4x1_testbench;
	logic [3:0]in_i;
	logic [1:0]sel_i;
	logic out_o;
	
	integer i;
	initial begin	
		for (int i = 0; i < 64; i++) begin
			{sel_i[1:0], in_i[3:0]} = i; #10;
		end
	end	
	 
	mux_4x1 dut(.out_o, .in_i, .sel_i);

endmodule