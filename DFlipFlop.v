module DFlipFlop (
  input wire clk,
  input wire reset_n, // Active-low asynchronous reset
  input wire d,       // Data input
  output reg q        // Data output
);

  always @(posedge clk or negedge reset_n) begin
    if (!reset_n) begin
      q <= 1'b0; 
    end else begin
      q <= d;
    end
  end

endmodule