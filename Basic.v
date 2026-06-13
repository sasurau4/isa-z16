module Basic;

  // --- おまじないここから ---
  initial begin
    $dumpfile("wave.vcd");
    $dumpvars(0, Basic);
  end

  reg r_a;
  reg r_b;
  reg r_x;
  // --- おまじないここまで ---

  wire [1:0] w_add;

  assign w_add = r_a + r_b + r_x;

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
