// 2:4 enabled decoder
`timescale 1ns/10ps
module Decoder_2x4(in_i, en_i, out_o);
	input logic [1:0]in_i;
	input logic en_i;
	output logic [3:0]out_o;
	
	logic [1:0]control;
	
	Decoder_1x2 decoder_1x2_1(in_i[1], en_i, control);
	Decoder_1x2 decoder_1x2_2(in_i[0], control[0], out_o[1:0]);
	Decoder_1x2 decoder_1x2_3(in_i[0], control[1], out_o[3:2]);  
	
endmodule

module Decoder_2x4_testbench;
	
	logic [1:0]in_i;
	logic en_i;
	logic [3:0]out_o;
	
	integer i;
	initial begin // Stimulus
		for (int i = 0; i < 8; i++) begin
				{en_i, in_i[1], in_i[0]} = i; #10;
		end
	end
	
	Decoder_2x4 dut(.in_i, .en_i, .out_o);

endmodule

