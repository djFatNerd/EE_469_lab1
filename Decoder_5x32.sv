// 5:32 enabled decoder
`timescale 1ns/10ps
module Decoder_5x32(in_i, en_i, out_o);
	input logic en_i;
	input logic [4:0] in_i;
	output logic  [31:0]out_o;
   
	logic[1:0] control;
	
	Decoder_1x2 decoder_1x2_1(in_i[4], en_i, control);
	
	Decoder_4x16 decoder_4x16_1(in_i[3:0], control[0], out_o[15:0]);
	Decoder_4x16 decoder_4x16_2(in_i[3:0], control[1], out_o[31:16]);
	
	
endmodule



module Decoder_5x32_testbench;
	logic [4:0] in_i;
	logic en_i;
	logic [31:0] out_o;
	
	integer i;
	initial begin
		for (int i = 0; i < 64; i++) begin
			{en_i, in_i[4:0]} = i; #10;
		end
	end
	
	Decoder_5x32 dut(.in_i, .en_i, .out_o);

endmodule