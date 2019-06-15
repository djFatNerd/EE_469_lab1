// 32:1 mux constructed by 2 16:1 mux and 1 2:1 mux
`timescale 1ns/10ps
module mux_32x1(out_o, in_i, sel_i);
	input logic [31:0]in_i;
	input logic [4:0]sel_i;
	output logic out_o;
	logic [1:0]temp;	
	
	mux_16x1 mux_16x1_1 (temp[1], in_i[31:16], sel_i[3:0]);
	mux_16x1 mux_16x1_2 (temp[0], in_i[15:0], sel_i[3:0]);
	mux_2x1 mux_2x1_1 (out_o, temp[1:0], sel_i[4]);
	
endmodule
 
module mux_32x1_testbench;
	logic [31:0]in_i;
	logic [4:0]sel_i;
	logic out_o;
	
	integer a;
	integer b;
	integer c;
	integer d;
	integer e;
	
	initial begin
		in_i[31:0] = 32'b11111111111111110000000000000000;
		for (int a = 0; a < 32; a++) begin
			sel_i[4:0] = a; #10;
		end
		
		in_i[31:0] = 32'b11111111000000000000000011111111;
		for (int b = 0; b < 32; b++) begin
			sel_i[4:0] = b; #10;
		end
		
		in_i[31:0] = 32'b11110000111100001111000011110000;
		for (int c = 0; c < 32; c++) begin
			sel_i[4:0] = c; #10;
		end
		
		in_i[31:0] = 32'b11001100110011001100110011001100;
		for (int d = 0; d < 32; d++) begin
			sel_i[4:0] = d; #10;
		end
		
		in_i[31:0] = 32'b10101010101010101010101010101010;
		for (int e = 0; e < 32; e++) begin
			sel_i[4:0] = e; #10;
		end		
	end 
	
	mux_32x1 dut(.out_o, .in_i, .sel_i);
endmodule