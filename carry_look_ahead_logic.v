module carry_look_ahead_logic(
    input [3:0] P,
    input [3:0] G,
    input carry_in,
    output [3:0] carry_out
);
genvar i;
generate
    for (i = 0; i < 4; i = i + 1) begin : carry_gen
        if (i == 0) begin
            assign carry_out[i] = G[i] | (P[i] & carry_in);
        end else begin
            assign carry_out[i] = G[i] | (P[i] & carry_out[i-1]);
        end
    end
endgenerate
endmodule

