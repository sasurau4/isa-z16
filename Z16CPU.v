module Z16CPU (
    input wire i_clk,
    input wire i_rst
);

  // Program Counter
  reg  [15:0] r_pc;
  wire [15:0] w_instr;

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

  // Data Memory
  Z16DataMem DataMem (
      .i_clk (),
      .i_addr(),
      .i_wen (),
      .i_data(),
      .o_data()
  );

endmodule
