module problem4 (
    input i_rst,
    input i_clk,
    output reg [15:0] o_p
);

  parameter p1 = 16'h0001;
  parameter p2 = 16'h0000;

  wire [15:0] w_s_p0p1;
  wire [15:0] w_m;

  assign w_s_p0p1 = o_p + p1;
  assign w_m = i_rst ? p2 : w_s_p0p1;

  always @(posedge i_clk) begin
    o_p <= i_clk ? w_m : w_s_p0p1;
  end
endmodule
