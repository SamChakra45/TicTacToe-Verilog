module mux4to1 (
  input wire [3:0] data_inputs,  // 4 data inputs
  input wire [1:0] select,       // 2-bit select input
  output reg output_data         // MUX output
);

  always @* begin
    case (select)
      2'b00: output_data = data_inputs[0];
      2'b01: output_data = data_inputs[1];
      2'b10: output_data = data_inputs[2];
      2'b11: output_data = data_inputs[3];
      default: output_data = 1'b0; // Default case, you can choose another default value if needed
    endcase
  end

endmodule
