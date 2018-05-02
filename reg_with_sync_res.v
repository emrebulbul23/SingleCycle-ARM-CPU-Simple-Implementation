// to make the reqisters variable length
`define length 32

module reg_with_sync_res  #(parameter reglength = `length)(reset,in,clk,A);

output reg [reglength-1:0] A;
input [reglength-1:0] in;
input reset;
input clk;


always@(posedge clk)
	case(reset)
		1'b0: A <= in;
		1'b1: A <= 0;
	endcase	
endmodule