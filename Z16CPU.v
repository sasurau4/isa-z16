module Z16CPU (
    input wire i_clk,
    input wire i_rst
);

  // Program Counter
  reg [15:0] r_pc;

  wire [15:0] w_instr;
  wire [3:0] w_rd_addr;  // Wire for destination register address
  wire [3:0] w_rs1_addr;  // Wire for source register 1 address
  wire [3:0] w_rs2_addr;
  wire [15:0] w_imm;  // Wire for immediate value
  wire w_rd_wen;  // Wire for write enable for destination register
  wire w_mem_wen;  // Wire for write enable for memory
  wire [3:0] w_alu_ctrl;  // Wire for ALU control signal
  wire [3:0] w_opcode;

  wire [15:0] w_rs1_data;  // Data from source register 1
  wire [15:0] w_rs2_data;
  wire [15:0] w_rd_data;

  wire [15:0] w_data_b;
  wire [15:0] w_alu_data;  // Data from ALU

  wire [15:0] w_mem_rdata;  // Data read from memory

  always @(posedge i_clk) begin
    if (i_rst) begin
      // reset
      r_pc <= 16'h0000;
    end else begin
      r_pc <= r_pc + 16'h0002;
    end
  end

  // Instruction Memory
  Z16InstrMemory InstrMem (
      .i_addr (r_pc),    // Address from Program Counter
      .o_instr(w_instr)
  );

  Z16Decoder Decoder (
      .i_instr   (w_instr),
      .o_opcode  (w_opcode),
      .o_rd_addr (w_rd_addr),
      .o_rs1_addr(w_rs1_addr),
      .o_rs2_addr(w_rs2_addr),
      .o_imm     (w_imm),
      .o_rd_wen  (w_rd_wen),
      .o_mem_wen (w_mem_wen),
      .o_alu_ctrl(w_alu_ctrl)
  );

  assign w_rd_data = (w_opcode[3:0] == 4'hA) ? w_mem_rdata : w_alu_data;
  Z16RegisterFile RegFile (
      .i_clk(i_clk),
      .i_rs1_addr(w_rs1_addr),  // Connect RS1 address
      .o_rs1_data(w_rs1_data),  // Output data from RS1
      .i_rs2_addr(w_rs2_addr),
      .o_rs2_data(w_rs2_data),
      .i_rd_data(w_rd_data),
      .i_rd_addr(w_rd_addr),
      .i_rd_wen(w_rd_wen)
  );

  assign w_data_b = (w_opcode <= 8'h8) ? w_rs2_data : w_imm;
  Z16ALU ALU (
      .i_data_a(w_rs1_data),  // Input from source register 1
      .i_data_b(w_data_b),
      .i_ctrl  (w_alu_ctrl),  // ALU control signal
      .o_data  (w_alu_data)   // Output data from ALU
  );

  // Data Memory
  Z16DataMemory DataMem (
      .i_clk (i_clk),
      .i_addr(w_alu_data),  // Address from ALU output
      .i_wen (w_mem_wen),   // Write enable signal from decoder
      .i_data(w_rs2_data),
      .o_data(w_mem_rdata)  // Output data from memory
  );

endmodule
