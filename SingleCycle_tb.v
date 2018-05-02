module SingleCycle_tb();

reg clk, reset;
reg [31:0] out_exp;
wire N,Z,CO,OVF;
wire [31:0] out;

reg [31:0] vectornum, errors; // bookkeeping variables
reg [31:0] testvectors[99:0]; // array of testvectors

// instantiate device under test
SingleCycle dut (.clk(clk),.reset(reset),.out(out),.N(N),.Z(Z),.CO(CO),.OVF(OVF));

// generate clock
always // no sensitivity list, so it always executes
	begin
	clk = 1; #5; clk = 0; #5;
	end 
	
// at start of test, load vectors and pulse reset
initial
	begin
	$readmemh("SingleCycle_tv.tv", testvectors);
	vectornum = 0; errors = 0;
	reset = 1; #2; reset = 0;
	end
// Note: $readmemh reads testvector files written in
// hexadecimal	

// apply test vectors on rising edge of clk
always @(posedge clk)
	begin
	{out_exp} = testvectors[vectornum];
	end
	
// check results on falling edge of clk
always @(negedge clk)
	if (~reset) begin // skip during reset
		if (out !== out_exp) begin
			$display("Error");
			$display(" outputs = %h (%h expected)",out,out_exp);
			errors = errors + 1;
end

// increment array index and read next testvector
vectornum = vectornum + 1;
	if (testvectors[vectornum] === 32'hx) begin
		$display("%d tests completed with %d errors",vectornum, errors);
		$stop;
end
end
endmodule	