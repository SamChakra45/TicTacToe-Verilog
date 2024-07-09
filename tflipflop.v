module tflipflop (
  input wire clk,      // Clock input
  input wire reset_n,  // Active-low asynchronous reset
  input wire t,        // Toggle input
  output reg q         // Data output
);

  always @(posedge clk or negedge reset_n) begin
    if (!reset_n) begin
      // Reset condition
      q <= 1'b0; // or any other default value
    end else begin
      // T flip-flop operation
      if (t) begin
        // Toggle condition
        q <= ~q;
      end
    end
  end

endmodule
