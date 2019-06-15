// construct a 64-bit register using 64 D Flip-Flop
`timescale 1ns/10ps
module D_FF_x64 #(parameter WIDTH=64)(q_o, d_i, clk_i, en_i);
	output logic [WIDTH-1:0] q_o;
	input logic [WIDTH-1:0] d_i;
	input logic clk_i;
	input logic en_i;

	logic [WIDTH-1:0] data;
	
	genvar i;
	
	generate
		for(i=0; i < WIDTH; i++) begin: eachDff
		   mux_2x1 checkEnable(data[i], {d_i[i], q_o[i]}, en_i);
			D_FF dffs(q_o[i], data[i], 1'b0, clk_i);
		end
	endgenerate
	
endmodule


module D_FF_x64_testbench();
	logic [63:0] d_i;
	logic [63:0] q_o;
	logic clk_i;
	logic en_i;

	
	
	// Set up the clock.
	parameter CLOCK_PERIOD = 100;
	initial begin
		clk_i <= 0;
		forever #(CLOCK_PERIOD/2) clk_i <= ~clk_i;
	end
	
	
	// Set up the inputs to the design. Each line is a clock cycle.
	initial begin 
		 // test when enable equals to 0, the DFFs is not transferring data
		 // Q hold old q values, in this case is X
		 en_i <= 0;
		 d_i[63:0] = 0;					@(posedge clk_i);
										      @(posedge clk_i);
												@(posedge clk_i);
										      @(posedge clk_i);
		 d_i[0] = 1;						@(posedge clk_i);
										      @(posedge clk_i);
												@(posedge clk_i);
										      @(posedge clk_i);
		 d_i[1] = 1; 						@(posedge clk_i);
										      @(posedge clk_i);
												@(posedge clk_i);
										      @(posedge clk_i);
		 d_i[3] = 1;						@(posedge clk_i);
										      @(posedge clk_i);
												@(posedge clk_i);
										      @(posedge clk_i);
		 d_i[7] = 1;						@(posedge clk_i);
										      @(posedge clk_i);
												@(posedge clk_i);
										      @(posedge clk_i);
		 d_i[15] = 1;						@(posedge clk_i);
										      @(posedge clk_i);
												@(posedge clk_i);
										      @(posedge clk_i);
		 d_i[31] = 1;						@(posedge clk_i);
										      @(posedge clk_i);
												@(posedge clk_i);
										      @(posedge clk_i);
		 d_i[63] = 1;						@(posedge clk_i);
										      @(posedge clk_i);
												@(posedge clk_i);
										      @(posedge clk_i);
		 
		 // test when enable equals to 1, the DFFs are transferring data
		 // q = d;
		 en_i <= 1;
		 d_i[63:0] = 0;					@(posedge clk_i);
										      @(posedge clk_i);
												@(posedge clk_i);
										      @(posedge clk_i);
																					
		 d_i[0] = 1;						@(posedge clk_i);
										      @(posedge clk_i);
												@(posedge clk_i);
										      @(posedge clk_i);
		 d_i[1] = 1; 						@(posedge clk_i);
										      @(posedge clk_i);
												@(posedge clk_i);
										      @(posedge clk_i);
		 d_i[3] = 1;						@(posedge clk_i);
										      @(posedge clk_i);
												@(posedge clk_i);
										      @(posedge clk_i);
		 d_i[7] = 1;						@(posedge clk_i);
										      @(posedge clk_i);
												@(posedge clk_i);
										      @(posedge clk_i);
		 d_i[15] = 1;						@(posedge clk_i);
										      @(posedge clk_i);
												@(posedge clk_i);
										      @(posedge clk_i);
		 d_i[31] = 1;						@(posedge clk_i);
										      @(posedge clk_i);
												@(posedge clk_i);
										      @(posedge clk_i);
		 d_i[63] = 1;						@(posedge clk_i);
										      @(posedge clk_i);
												@(posedge clk_i);
										      @(posedge clk_i);
												
		 en_i <= 0;							@(posedge clk_i);
												@(posedge clk_i);
												@(posedge clk_i);
												@(posedge clk_i);
												@(posedge clk_i);
		$stop;
	end
	
	D_FF_x64 dut (.q_o, .d_i, .clk_i, .en_i);
	
endmodule
