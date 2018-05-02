module DataMemory (clk,WE,A,WD,RD);

input clk;
input WE;
input [31:0] A;
input [31:0] WD;

output [31:0] RD;

//memory blocks
reg [31:0] dataMemory [63:0];

//async read
assign RD = dataMemory[A[5:0]];

//read memory for memory content in hex
initial
	$readmemh ("memory.tv", dataMemory);

always@(posedge clk)
begin
	if(WE==1'b1)
		begin
			dataMemory[A[5:0]] <= WD;
		end
	else
		begin
			dataMemory[A[5:0]] <= dataMemory[A[5:0]];
		end
end

endmodule
