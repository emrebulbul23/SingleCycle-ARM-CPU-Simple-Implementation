module regfile (clk,A1,A2,A3,WD3,WE,RD1,RD2);

//inputs
input clk;
input WE;
input [3:0] A1;
input [3:0] A2;
input [3:0] A3;
input [31:0] WD3;

//outputs
output [31:0] RD1;
output [31:0] RD2;

//registers
reg [31:0] registers [15:0];

initial
begin
	registers[0] = 32'h00000000;
	registers[1] = 32'h00000000;
	registers[2] = 32'h00000000;
	registers[3] = 32'h00000000;
	registers[4] = 32'h00000000;
	registers[5] = 32'h00000000;
	registers[6] = 32'h00000000;
	registers[7] = 32'h00000000;
	registers[8] = 32'h00000000;
	registers[9] = 32'h00000000;
	registers[10] = 32'h00000000;
	registers[11] = 32'h00000000;
	registers[12] = 32'h00000000;
	registers[13] = 32'h00000000;
	registers[14] = 32'h00000000;
	registers[15] = 32'h00000000;
end

//async read
assign RD1 = registers[A1];
assign RD2 = registers[A2];

//synchronous write
always@(posedge clk)
begin
	if(WE==1'b1)
		begin
			registers[A3] <= WD3;
		end
	else
		begin
			registers[A3] <= registers[A3];
		end
end

endmodule

