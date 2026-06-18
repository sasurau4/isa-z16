module AdvancedDff (
    input i_clk,
    input i_data,
    input i_en,
    output reg o_data
);

  always @(posedge i_clk) begin
    o_data <= i_en ? i_data : o_data;
  end
endmodule

