module three_bit_comparator (
  input wire [2:0] a,
  input wire [2:0] b,
  output reg eq,
  output reg gt,
  output reg lt
);

  always @* begin
    eq = (a == b);
    gt = (a > b);
    lt = (a < b);
  end

endmodule
