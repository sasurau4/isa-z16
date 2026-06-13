module HalfAdder (
    input  i_a,
    input  i_b,
    output o_c,
    output o_s
);

  assign o_c = i_a & i_b;
  assign o_s = i_a ^ i_b;
endmodule
