// 16:1 multiplexer constructed by 5 4:1 mux
`timescale 1ns/10ps
module mux_16x1(out_o, in_i, sel_i);
	input logic [15:0]in_i;
	input logic [3:0]sel_i;
	output logic out_o;
	
	logic [3:0]temp;
	
	
	// ?????????????  sel dimension
	mux_4x1 mux_4x1_1 (temp[3], in_i[15:12], sel_i[1:0]);
	mux_4x1 mux_4x1_2 (temp[2], in_i[11:8], sel_i[1:0]);
	mux_4x1 mux_4x1_3 (temp[1], in_i[7:4], sel_i[1:0]);
	mux_4x1 mux_4x1_4 (temp[0], in_i[3:0], sel_i[1:0]);
	
	mux_4x1 mux_4x1_5 (out_o, temp[3:0], sel_i[3:2]);

endmodule


module mux_16x1_testbench;
	logic [15:0]in_i;
	logic [3:0]sel_i;
	logic out_o;
	
	integer i;
	initial begin	
		for (int i = 0; i < 1048576; i++) begin
			{sel_i[3:0], in_i[15:0]} = i; #10;
		end
	end	
	 
	mux_16x1 dut(.out_o, .in_i, .sel_i);

endmodule