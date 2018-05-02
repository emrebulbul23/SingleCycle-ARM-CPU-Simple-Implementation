// to make the reqisters variable length
`define length 4
		
`define  ADD		3'b000 
`define  SubAB		3'b001 
`define  SubBA		3'b010 
`define	BIC		3'b011 
`define	AND		3'b100 
`define	OR			3'b101 
`define	EXOR		3'b110 
`define	EXNOR		3'b111
//operations

module ALU #(parameter reglength = `length)(ALUControl,SrcA,SrcB,ALUResult,N,Z,CO,OVF);

output reg [reglength-1:0] ALUResult;
output reg N;
output reg Z;
output reg CO;
output reg OVF;

input [reglength-1:0] SrcA;
input [reglength-1:0] SrcB;

input [2:0] ALUControl;



//compute the output
always@(ALUControl,SrcA,SrcB)
case(ALUControl)
	`ADD	: begin
			//sum and check carry
			{CO,ALUResult} = SrcA+SrcB;
			//check overflow
			if((SrcA[reglength-1]==1 && SrcB[reglength-1]==1 && ALUResult[reglength-1]==0)||(SrcA[reglength-1]==0 && SrcB[reglength-1]==0 && ALUResult[reglength-1]==1))
				OVF = 1;
			else
				OVF = 0;
			//check Z
			if(ALUResult == 0)
				Z = 1;
			else
				Z = 0;
			//check N
			if(ALUResult[reglength-1]==1)
				N = 1;
			else
				N = 0;
 end

	`SubAB: begin
			//subtract and check carry
			{CO,ALUResult} = SrcA + (~SrcB + 1'b1);
			//check overflow
			if((SrcA[reglength-1]==0 && SrcB[reglength-1]==1 && ALUResult[reglength-1]==1)||(SrcA[reglength-1]==1 && SrcB[reglength-1]==0 && ALUResult[reglength-1]==0))
				OVF = 1;
			else
				OVF = 0;
			//check Z
			if(ALUResult == 0)
				Z = 1;
			else
				Z = 0;
			//check N
			if(ALUResult[reglength-1]==1)
				N = 1;
			else
				N = 0;	
 end
 
	`SubBA: begin
			//subtract and check carry
			{CO,ALUResult} = SrcB + (~SrcA + 1'b1);
			//check overflow
			if((SrcB[reglength-1]==0 && SrcA[reglength-1]==1 && ALUResult[reglength-1]==1)||(SrcB[reglength-1]==1 && SrcA[reglength-1]==0 && ALUResult[reglength-1]==0))
				OVF = 1;
			else
				OVF = 0;
			//check Z
			if(ALUResult == 0)
				Z = 1;
			else
				Z = 0;
			//check N
			if(ALUResult[reglength-1]==1)
				N = 1;
			else
				N = 0;
 end
 
	`BIC	: begin
			ALUResult = SrcA & (~SrcB);
			//check Z
			if(ALUResult == 0)
				Z = 1;
			else
				Z = 0;
			//check N
			if(ALUResult[reglength-1]==1)
				N = 1;
			else
				N = 0;
 end
 
	`AND	: begin
			ALUResult = SrcA & SrcB;
			//check Z
			if(ALUResult == 0)
				Z = 1;
			else
				Z = 0;
			//check N
			if(ALUResult[reglength-1]==1)
				N = 1;
			else
				N = 0;
 end
 
	`OR	: begin
				ALUResult = SrcA | SrcB;
			//check Z
			if(ALUResult == 0)
				Z = 1;
			else
				Z = 0;
			//check N
			if(ALUResult[reglength-1]==1)
				N = 1;
			else
				N = 0;
 end
 
	`EXOR	: begin
			ALUResult = SrcA ^ SrcB;
			//check Z
			if(ALUResult == 0)
				Z = 1;
			else
				Z = 0;
			//check N
			if(ALUResult[reglength-1]==1)
				N = 1;
			else
				N = 0;
 end

	`EXNOR: begin
			ALUResult = ~(SrcA ^ SrcB);
			//check Z
			if(ALUResult == 0)
				Z = 1;
			else
				Z = 0;
			//check N
			if(ALUResult[reglength-1]==1)
				N = 1;
			else
				N = 0;
 end	
endcase	



endmodule