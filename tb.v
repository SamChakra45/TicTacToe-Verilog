`timescale 1ns/1ns
`include "tic_tac_toe_game.v"
module tb;
  reg play, reset, clk=1;
  reg [3:0] xPlayerPos, oPlayerPos;
  wire[1:0] gameWinner,pos1, pos2, pos3, pos4, pos5, pos6, pos7, pos8, pos9;
  
  tic_tac_toe_game uut(
    play, reset, clk, 
    xPlayerPos, oPlayerPos, 
    gameWinner,pos1, pos2, pos3, pos4, pos5, pos6, pos7, pos8, pos9
  );
  always begin #5 clk = ~clk;
  end
  initial
    begin
       
    $dumpfile("tb.vcd");
    $dumpvars(0, tb);
  
      reset = 1;
      
      reset = 0;#10
      play = 1;#10;
      play = 0;
      xPlayerPos = 5;#10
      oPlayerPos = 1;#10
      xPlayerPos = 7;#10
      oPlayerPos = 3;#10;
      xPlayerPos = 2;#10;
      oPlayerPos = 6;#10
      xPlayerPos = 8;#10
      oPlayerPos = 4;#10
      xPlayerPos = 9;#10#10#10#10

      
      $finish;
    end 
endmodule