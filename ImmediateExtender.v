module ImmediateExtender (ImmSrc,in,ExtImm);

input [11:0] in;
input ImmSrc;
output reg [31:0] ExtImm;

always@(in,ImmSrc)
	case(ImmSrc)
		1'b0: begin
			ExtImm = {24'b0,in[7:0]};
		end
		1'b1: begin
			ExtImm = {20'b0,in[11:0]};
		end
	endcase
endmodule



