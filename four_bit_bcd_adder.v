module four_bit_bcd_adder(
    input [3:0] A,
    input [3:0] B,
    input carry_in,
    output [3:0] sum,
    output carry_out
);
wire [3:0]sum_t,b;
wire carry1, carry2, z;

    four_bit_adder fa0 (
     .a(A),
     .b(B),
     .carry_in(carry_in),
     .sum(sum_t),
     .carry_out(carry1)
    );

    four_bit_adder fa1 (
     .a(sum_t),
     .b(b), // Adding 6 to correct the sum if it exceeds 9
     .carry_in(1'b0),
     .sum(sum),
     .carry_out(carry2)
    );
assign z=(carry1 |(sum_t[3]&sum_t[2])|(sum_t[3]&sum_t[1]));
assign b={1'b0,z,z,1'b0};
assign carry_out=z;
endmodule
// If sum exceeds 9, add 6