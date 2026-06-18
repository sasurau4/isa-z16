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
  wire w_s;

  FullAdder FA (
      .i_a(r_a),
      .i_b(r_b),
      .i_x(r_x),
      .o_c(w_c),
      .o_s(w_s)
  );

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
