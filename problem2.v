module problem2 (
    input  [7:0] i_p0,
    input  [7:0] i_p1,
    input  [7:0] i_p2,
    output [7:0] o_p
);

  wire [7:0] w_p1;

  assign w_p1 = i_p1 & i_p2;
  assign o_p  = i_p0 + w_p1;
endmodule
