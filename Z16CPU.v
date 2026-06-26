module Z16CPU (
    input wire i_clk,
    input wire i_rst
);

  // Program Counter
  reg [15:0] r_pc;

  wire [15:0] w_instr;
  wire [15:0] w_rd_addr;  // Wire for destination register address
  wire [15:0] w_rs1_addr;  // Wire for source register 1 address
  wire [15:0] w_imm;  // Wire for immediate value
  wire w_rd_wen;  // Wire for write enable for destination register
  wire w_mem_wen;  // Wire for write enable for memory
  wire [3:0] w_alu_ctrl;  // Wire for ALU control signal

  always @(posedge i_clk) begin
    if (i_rst) begin
      // reset
      r_pc <= 16'h0000;
    end else begin
      r_pc <= r_pc + 16'h0002;
    end
  end

  // Instruction Memory
  Z16InstrMem InstrMem (
      .i_addr (r_pc),    // Address from Program Counter
      .o_instr(w_instr)
  );

  Z16Decoder Decoder (
      .i_instr   (w_instr),
      .o_rd_addr (w_rd_addr),
      .o_rs1_addr(w_rs1_addr),
      .o_imm     (w_imm),
      .o_rd_wen  (w_rd_wen),
      .o_mem_wen (w_mem_wen),
      .o_alu_ctrl(w_alu_ctrl)
  );

  // Data Memory
  Z16DataMem DataMem (
      .i_clk (),
      .i_addr(),
      .i_wen (),
      .i_data(),
      .o_data()
  );

endmodule
