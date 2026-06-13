module problem6 (
    input [15:0] i_data,
    input i_rst,
    input i_clk,
    output reg [2:0] o_data
);

  wire [2:0] w_data;
  parameter IDLE = 3'b000;

  assign w_data = 
  (i_data[1:0] == 2'b00) ? i_data[4:2] :
  (i_data[1:0] == 2'b01) ? i_data[7:5] :
  (i_data[1:0] == 2'b10) ? i_data[10:8] : i_data[13:11];

  always @(posedge i_clk) begin
    o_data <= i_rst ? IDLE : w_data;
  end

endmodule
