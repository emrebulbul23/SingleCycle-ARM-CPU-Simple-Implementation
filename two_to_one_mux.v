// to make the reqisters variable length
`define length 32

module two_to_one_mux #(parameter reglength = `length)(out,select,input0,input1);

output reg [reglength-1:0] out;
input [reglength-1:0] input0;
input [reglength-1:0] input1;
input select;

always@(select,input0,input1)
	case(select)
		1'b0: out = input0;
		1'b1: out = input1;
	endcase	
endmodule
