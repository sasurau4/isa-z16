module Basic;

  // --- おまじないここから ---
  initial begin
    $dumpfile("wave.vcd");
    $dumpvars(0, Basic);
  end

  reg  r_a;
  reg  r_b;
  reg  r_x;
  // --- おまじないここまで ---

  wire w_c;
  wire w_x;
  wire w_c_abx;

  wire w_c_ab;
  wire w_s_ab;

  assign w_c_ab = r_a & r_b;
  assign w_s_ab = r_a ^ r_b;

  assign w_c_abx = w_s_ab & r_x;
  assign w_s = w_s_ab ^ r_x;

  assign w_c = w_c_ab | w_c_abx;

  // --- おまじないここから ---
  initial begin
    r_a = 1'b0;
    r_b = 1'b0;
    r_x = 1'b0;
    #2 r_a = 1'b0;
    r_b = 1'b0;
    r_x = 1'b1;
    #2 r_a = 1'b0;
    r_b = 1'b1;
    r_x = 1'b0;
    #2 r_a = 1'b0;
    r_b = 1'b1;
    r_x = 1'b1;
    #2 r_a = 1'b1;
    r_b = 1'b0;
    r_x = 1'b0;
    #2 r_a = 1'b1;
    r_b = 1'b0;
    r_x = 1'b1;
    #2 r_a = 1'b1;
    r_b = 1'b1;
    r_x = 1'b0;
    #2 r_a = 1'b1;
    r_b = 1'b1;
    r_x = 1'b1;
    #2 $finish;
  end
  // --- おまじないここまで ---

endmodule
