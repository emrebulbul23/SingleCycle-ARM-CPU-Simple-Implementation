/*
 * Top level entity
*/

module SingleCycle (clk,reset,out,N,Z,CO,OVF);

input clk,reset;

output [31:0] out;
output N,Z,CO,OVF;

wire  MemtoReg;
wire	MemWrite;
wire	ImmSrc;
wire	RegSrc;
wire	ALUSrc;
wire	RegWrite;
wire	shiftSrc;
wire	[2:0] ALUControl;
wire	[31:0] inst;

Controller cntrl (
	.MemtoReg(MemtoReg),
	.MemWrite(MemWrite),
	.ImmSrc(ImmSrc),
	.RegSrc(RegSrc),
	.ALUSrc(ALUSrc),
	.RegWrite(RegWrite),
	.shiftSrc(shiftSrc),
	.ALUControl(ALUControl),
	.inst(inst));
	
Datapath datmem (
	.MemtoReg(MemtoReg),
	.MemWrite(MemWrite),
	.ImmSrc(ImmSrc),
	.RegSrc(RegSrc),
	.ALUSrc(ALUSrc),
	.RegWrite(RegWrite),
	.shiftSrc(shiftSrc),
	.ALUControl(ALUControl),
	.inst(inst),
	.clk(clk),
	.reset(reset),
	.out(out),
	.N(N),
	.Z(Z),
	.CO(CO),
	.OVF(OVF));

endmodule
