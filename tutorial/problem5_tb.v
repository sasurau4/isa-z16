module problem5_tb;
  parameter i1 = 16'h0000;
  parameter i2 = 16'h0001;
  parameter i3 = 16'h0002;
  parameter i4 = 16'h0003;
  reg [1:0] i_ctrl = 2'b00;
  reg i_clk = 0;

  initial begin
    $dumpfile("wave.vcd");
    $dumpvars(0, DUT);
  end

  problem5 DUT (
      .i_data_0(i1),
      .i_data_1(i2),
      .i_data_2(i3),
      .i_data_3(i4),
      .i_ctrl  (i_ctrl),
      .i_clk   (i_clk)
  );

  always #1 begin
    i_clk <= ~i_clk;
  end

  initial begin
    #10 i_ctrl = 2'b01;
    #10 i_ctrl = 2'b10;
    #10 i_ctrl = 2'b11;
    #10 $finish;
  end
endmodule
