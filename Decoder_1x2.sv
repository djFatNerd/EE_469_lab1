// 1:2 enabled decoder 
// each logic gate delay = 50 ps
`timescale 1ns/10ps

module Decoder_1x2(in_i, en_i, out_o);
	// gate delay = 50ps, need to set
	input logic in_i; 
	input logic en_i; 
	output logic[1:0] out_o;
	
	logic n_in;
	not #5 gate_1 (n_in, in_i); 
	and #5 gate_2 (out_o[1], en_i, in_i);
	and #5 gate_3 (out_o[0], n_in,en_i);

endmodule


module Decoder_1x2_testbench;
	
	logic in_i;
	logic en_i;
	logic [1:0]out_o;
	
	integer i;
	initial begin // Stimulus
		for (int i = 0; i < 4; i++) begin
			{en_i, in_i} = i; #10;
		end
		
		
	end 
	
	Decoder_1x2 dut(.in_i, .en_i, .out_o);

endmodule