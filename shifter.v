`define LSL 2'b00
`define LSR 2'b01

module shifter (sh,shamt5,in,out);

input [1:0] sh;
input [4:0] shamt5;
input [31:0] in;

output reg [31:0] out;

always@(sh,shamt5,in)
begin
	case(sh)
	`LSL:	begin
		out = in << shamt5;
	end	
	`LSR: begin
		out = in >> shamt5;
	end
	endcase
end

endmodule
