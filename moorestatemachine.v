module MooreStateMachine (
  input wire clk,    // Clock input
  input wire reset,  // Asynchronous reset input
  input wire input,  // Input
  output reg output  // Output
);

  // Define states
  typedef enum logic [1:0] {
    S0,
    S1
  } state_t;

  // Declare state variable
  reg state, next_state;

  // Define state machine output
  always_comb begin
    case (state)
      S0: output = (input) ? 1'b0 : 1'b1; 
      S1: output = (input) ? 1'b1 : 1'b0; 
      default: output = 1'b0;
    endcase
  end

  // Define state transitions
  always_ff @(posedge clk or posedge reset) begin
    if (reset) begin
      // Reset to initial state
      state <= S0;
    end else begin
      // State transitions
      state <= next_state;
    end
  end

  // Define next_state logic
  always_comb begin
    case (state)
      S0: next_state = (input) ? S1 : S0; 
      S1: next_state = (input) ? S0 : S1; 
      default: next_state = S0;
    endcase
  end

endmodule

