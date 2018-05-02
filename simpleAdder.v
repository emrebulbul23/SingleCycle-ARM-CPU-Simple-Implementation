// to make the reqisters variable length
`define length 32

module simpleAdder #(parameter reglength = `length)(in0,in1,out);

input [reglength-1:0] in0;
input [reglength-1:0] in1;

output [reglength-1:0] out; 

assign out = in0 + in1;

endmodule
