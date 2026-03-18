module  four_bit_adder_test();
reg [3:0] a, b;
reg carry_in;
wire [3:0] sum;
wire carry_out;
four_bit_adder uut (
    .a(a),
    .b(b),
    .carry_in(carry_in),
    .sum(sum),
    .carry_out(carry_out)
);
reg clk;
reg rst;
initial
begin
clk = 0;
rst = 1;
#20
rst = 0;
end

always #10 clk = ~clk;
reg [3:0] i;
always @(posedge clk or posedge rst)
begin
    if (rst)    begin
        i =0;
    end
    else    begin
       a<= $random % 16; // Generate random 4-bit numbers
       b<= $random % 16;
       carry_in = $random % 2;
        #20;
       i=i+1;
       if(i==10)$finish;// Generate random carry_in (0 or 1)
    end
    $monitor("Time: %0t | A: %b | B: %b | Carry In: %b | Sum: %b | Carry Out: %b",$time, a, b, carry_in, sum, carry_out);
end
endmodule

