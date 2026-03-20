module four_bit_bcd_adder_test;
reg [3:0] a, b;
reg carry_in;
wire [3:0] sum;
wire carry_out;
four_bit_bcd_adder uut (
    .a(a),
    .b(b),
    .carry_in(carry_in),
    .sum(sum),
    .carry_out(carry_out)
);
reg clk;
reg rst;
initial begin
    clk = 0;
    rst = 1;
    a=0;
    b=0;
    carry_in=0;
    #20 rst = 0;
end
always #10 clk = ~clk;
reg [3:0] i;
always@(posedge clk or posedge rst) begin
    if (rst) begin
        i <= 0;
    end else begin
    a<=$urandom%10;
    b<=$urandom%10;
    carry_in<=$urandom%2;
    #20;
    i<=i+1;
    if (i==10) $finish;
    end
    $monitor("Time: %0t | A: %b | B: %b | Carry In: %b | Sum: %b | Carry Out: %b",$time, a, b, carry_in, sum, carry_out);
end