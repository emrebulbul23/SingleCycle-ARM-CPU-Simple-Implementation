/*
* Controller
*/

`define op 27:26
`define cond 31:28
`define Rn 19:16
`define Rd 15:12
`define cmd 24:21
`define L 20
`define imm12 11:0
`define shamt5 11:7
`define sh 6:5
`define Rm 3:0

`define ADD 4'b0100
`define SUB 4'b0010
`define AND 4'b0000
`define ORR 4'b1100
`define MOV 4'b1101
`define CMP 4'b1010


module Controller (
	MemtoReg,
	MemWrite,
	ImmSrc,
	RegSrc,
	ALUSrc,
	RegWrite,
	shiftSrc,
	ALUControl,
	inst);
	
input [31:0] inst;

output reg MemtoReg,MemWrite,ImmSrc,RegSrc,ALUSrc,RegWrite,shiftSrc;
output reg [2:0] ALUControl;

always@(inst)
begin
	if(inst[`op]==2'b00)
		begin
			ImmSrc = 0;
			RegSrc = 0;
			ALUSrc =  0;
			case(inst[`cmd])
				//ADD
				`ADD: begin
					RegWrite = 1;
					MemWrite = 0;
					MemtoReg = 0;
					shiftSrc = 0;
					ALUControl = 3'b000;
				end
				//SUB
				`SUB: begin
					RegWrite = 1;
					MemWrite = 0;
					MemtoReg = 0;
					shiftSrc = 0;
					ALUControl = 3'b001;
				end
				//AND
				`AND: begin
					RegWrite = 1;
					MemWrite = 0;
					MemtoReg = 0;
					ALUSrc =  0;
					shiftSrc = 0;
					ALUControl = 3'b100;
				end
				//ORR
				`ORR: begin
					RegWrite = 1;
					MemWrite = 0;
					MemtoReg = 0;
					shiftSrc = 0;
					ALUControl = 3'b101;
				end
				//CMP
				`CMP: begin
					RegWrite = 0;
					MemWrite = 0;
					MemtoReg = 0;
					shiftSrc = 0;
					ALUControl = 3'b001;
				end
				//LSL,LSR
				`MOV: begin
					RegWrite = 1;
					MemWrite = 0;
					MemtoReg = 0;
					shiftSrc = 1;
					ALUControl = 3'b000;
				end
				//to play safe
				default: begin
					RegWrite = 1;
					MemWrite = 0;
					MemtoReg = 0;
					shiftSrc = 0;
					ALUControl = 3'b000;
				end
			endcase
		end
	else if(inst[`op]==2'b01)
		begin
			ALUControl = 3'b000;
			shiftSrc = 0;
			ALUSrc =  1;
			ImmSrc = 1;
			case(inst[`L])
				//LDR
				1'b1: begin
					RegWrite = 1;
					MemWrite = 0;
					MemtoReg = 1;
					RegSrc = 0;

				end
				1'b0: begin
					RegWrite = 0;
					MemWrite = 1;
					MemtoReg = 0;
					RegSrc = 1;					
				end
				//to play safe
				default: begin
					RegWrite = 1;
					MemWrite = 0;
					MemtoReg = 1;
					RegSrc = 0;
				end
			endcase
			
		end
end

endmodule
