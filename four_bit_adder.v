module half_adder(
    input a,
    input b,
    output sum,
    output carry
);
assign sum = a ^ b;
assign carry = a & b;
endmodule


module full_adder(
    input a,
    input b,
    input carry_in,
    output sum,
    output carry_out
);
wire sum_half, carry_half1, carry_half2;
half_adder ha1 (
    .a(a),
    .b(b),
    .sum(sum_half),
    .carry(carry_half1)
);
half_adder ha2 (
    .a(sum_half),
    .b(carry_in),
    .sum(sum),
    .carry(carry_half2)
);
assign carry_out = carry_half1 | carry_half2;
endmodule


module four_bit_adder(
    input [3:0] a,
    input [3:0] b,
    input carry_in,
    output [3:0] sum,
    output carry_out
);
wire carry1, carry2, carry3;
   full_adder fa0 (
    .a(a[0]),
    .b(b[0]),
    .carry_in(carry_in),
    .sum(sum[0]),
    .carry_out(carry1)
);
  full_adder fa1 (
    .a(a[1]),
    .b(b[1]),
    .carry_in(carry1),
    .sum(sum[1]),
    .carry_out(carry2)
   );
    full_adder fa2 (
        .a(a[2]),
        .b(b[2]),
        .carry_in(carry2),
        .sum(sum[2]),
        .carry_out(carry3)
    );
    full_adder fa3 (
        .a(a[3]),
        .b(b[3]),
        .carry_in(carry3),
        .sum(sum[3]),
        .carry_out(carry_out)
    );
endmodule


