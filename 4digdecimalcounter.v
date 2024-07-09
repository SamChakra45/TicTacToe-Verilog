module four_digit_bcd_counter (
  input wire clk,            // Clock input
  input wire reset,          // Asynchronous reset input
  output reg [3:0] ones,     // Ones digit output
  output reg [3:0] tens,     // Tens digit output
  output reg [3:0] hundreds, // Hundreds digit output
  output reg [3:0] thousands, // Thousands digit output
  output reg enable_hundreds, // Enable signal for incrementing hundreds digit
  output reg enable_thousands // Enable signal for incrementing thousands digit
);

  reg [13:0] counter; // 16-bit counter to keep track of the overall count

  always @(posedge clk or posedge reset) begin
    if (reset) begin
      // Asynchronous reset
      counter <= 14'b0000_0000_0000_00;
      ones <= 4'b0000;
      tens <= 4'b0000;
      hundreds <= 4'b0000;
      thousands <= 4'b0000;
      enable_hundreds <= 1'b0;
      enable_thousands <= 1'b0;
    end else begin
      // Increment the counter on each clock edge
      counter <= counter + 1;

      // Extract individual digits
      ones <= counter[3:0];
      tens <= counter[7:4];
      hundreds <= counter[11:8];
      thousands <= counter[15:12];

      // Enable signals for incrementing hundreds and thousands
      enable_hundreds <= (counter[7:0] == 8'b1001); // Check for 9 in tens and ones
      enable_thousands <= (counter[11:0] == 12'b1001_1001); // Check for 99 in hundreds and tens
    end
  end

endmodule
