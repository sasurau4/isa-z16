module AdvancedDff_tb;

  initial begin
    $dumpfile("wave.vcd");
    $dumpvars(0, AD);
  end

  reg  i_clk = 1'b0;
  reg  i_data = 1'b0;
  reg  i_en = 1'b0;
  wire o_data;

  always #1 begin
    i_clk <= ~i_clk;
  end

  AdvancedDff AD (
      .i_clk (i_clk),
      .i_data(i_data),
      .i_en  (i_en),
      .o_data(o_data)
  );

  initial begin
    // initial state
    i_data = 1'b0;
    i_en   = 1'b0;
    #2
    // input data
    i_data = 1'b1;
    i_en = 1'b0;
    #6
    // enable write
    i_data = 1'b1;
    i_en = 1'b1;
    #2
    // disable write
    i_data = 1'b1;
    i_en = 1'b0;
    #4
    // reset data 0
    i_data = 1'b0;
    i_en = 1'b0;
    #4 $finish;
  end
endmodule
