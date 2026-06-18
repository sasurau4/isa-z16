module Z16RegisterFile (
    input wire i_clk,  // clock
    input wire [3:0] i_rs1_addr,  // RS1 address
    output wire [15:0] o_rs1_data,  // RS1 data
    input wire [3:0] i_rs2_addr,  // RS2 address
    output wire [15:0] o_rs2_data,  // RS2 data

    input wire [3:0] i_rd_addr,  // RD address
    input wire i_rd_wen,  // RD write enable
    input wire [15:0] i_rd_data  // RD data
);
  reg [15:0] mem[15:0];

  // Read
  // If the address is 0, return 0, otherwise return the value in the register file
  assign o_rs1_data = (i_rs1_addr == 4'h0) ? 16'h0000 : mem[i_rs1_addr];
  assign o_rs2_data = (i_rs2_addr == 4'h0) ? 16'h0000 : mem[i_rs2_addr];

  // Write
  always @(posedge i_clk) begin
    if (i_rd_wen) begin
      mem[i_rd_addr] <= i_rd_data;
    end else begin
      mem[i_rd_addr] <= mem[i_rd_addr];
    end
  end

endmodule
