module Z16CPU (
    input wire i_clk,
    input wire i_rst
);

  // Instruction Memory
  Z16InstrMem InstrMem (
      .i_addr (),
      .o_instr()
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
