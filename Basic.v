module Basic;

  initial begin
    $dumpfile("wave.vcd");
    $dumpvars(0, Basic);
  end

  reg  r_a;

  wire w_x;

  assign w_x = ~r_a;

  initial begin
    r_a = 1'b0;
    #2 r_a = 1'b1;
    #2 $finish;
  end

endmodule
