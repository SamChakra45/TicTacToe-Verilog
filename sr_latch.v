module sr_latch (
  input wire s,       // Set input
  input wire r,       // Reset input
  output reg q,       // Q output
  output reg q_n      // Q' output
);

  always @(s or r) begin
    if (s && ~r) begin
      // Set condition
      q <= 1'b1;
      q_n <= 1'b0;
    end else if (~s && r) begin
      // Reset condition
      q <= 1'b0;
      q_n <= 1'b1;
    end else begin
      // Hold state
      q <= q;
      q_n <= q_n;
    end
  end

endmodule
