// 4:16 enabled Decoder
`timescale 1ns/10ps
module Decoder_4x16(in_i, en_i, out_o);

	input logic en_i;
	input logic [3:0] in_i;
	output logic [15:0] out_o;

	logic [3:0] control;
	
	// enable input output - the control 
	Decoder_2x4 decoder_2x4_1 (in_i[3:2], en_i, control);
	
	// the parallel Decoder to produce 16 outputs
	Decoder_2x4 decoder_2x4_2(in_i[1:0], control[0],  out_o[3:0]);
	Decoder_2x4 decoder_2x4_3(in_i[1:0], control[1],  out_o[7:4]);
	Decoder_2x4 decoder_2x4_4(in_i[1:0], control[2], out_o[11:8]);
	Decoder_2x4 decoder_2x4_5(in_i[1:0], control[3], out_o[15:12]);
	
endmodule


module Decoder_4x16_testbench;
	
	logic [3:0]in_i;
	logic en_i;
	logic [15:0]out_o;
	
	integer i;
	initial begin // Stimulus
		for (int i = 0; i < 32; i++) begin
				{en_i, in_i[3], in_i[2], in_i[1], in_i[0]} = i; #10;
		end
	end 
	
	Decoder_4x16 dut(.in_i, .en_i, .out_o);

endmodule