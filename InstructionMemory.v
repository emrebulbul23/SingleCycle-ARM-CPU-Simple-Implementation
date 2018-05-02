module InstructionMemory (PC,instruction);

input [31:0] PC;
output [31:0] instruction;

//instructions
reg [31:0] instMemory [63:0];

//read memory for instructions in hex
initial
	$readmemh ("instrucitons.tv", instMemory);

assign instruction = instMemory[PC[5:0]];
	
endmodule	