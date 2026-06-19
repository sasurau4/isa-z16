module Z16DataMemory (
    input wire i_clk,  // clock
    input wire [15:0] i_addr,  // address
    input wire i_wen,  // write enable
    input wire [15:0] i_data,  // data to write
    output wire [15:0] o_data  // data read
);

  reg [15:0] mem[1023:0];

  // Load
  assign o_data = mem[i_addr[10:1]];

  always @(posedge i_clk) begin
    // Store
    if (i_wen) begin
      mem[i_addr[10:1]] <= i_data;
    end
  end

endmodule
