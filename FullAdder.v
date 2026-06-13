module FullAdder (
    input  i_a,
    input  i_b,
    input  i_x,
    output o_c,
    output o_s
);

  wire w_c_ab;
  wire w_s_ab;
  wire w_c_abx;

  assign w_c_ab = i_a & i_b;
  assign w_s_ab = i_a ^ i_b;

  assign w_c_abx = w_s_ab & i_x;
  assign o_s = w_s_ab ^ i_x;

  assign o_c = w_c_ab | w_c_abx;

endmodule
