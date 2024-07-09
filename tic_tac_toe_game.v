

module tic_tac_toe_game (
  input play, reset, clk, 
  input [3:0] xPlayerPos, oPlayerPos,
  output[1:0] gameWinner, pos1, pos2, pos3, pos4, pos5, pos6, pos7, pos8, pos9
  
);
  
  parameter [1:0] IDLE=00, O_PLAYER=01, X_PLAYER=10, GAME_OVER=11;
  
  reg [1:0] currentState, nextState;
  reg [1:0] board[0:8];
  reg [3:0] moveCount;
  reg illegalMoveoPlayer, illegalMovexPlayer;
  reg noVacantSpace, result;
  reg [1:0] winner;
  integer i,j;
  
  assign gameWinner = winner;
  assign pos1=board[0];
  assign pos2=board[1];
  assign pos3=board[2];
  assign pos4=board[3];
  assign pos5=board[4];
  assign pos6=board[5];
  assign pos7=board[6];
  assign pos8=board[7];
  assign pos9=board[8];
  
  always @(*) begin
    illegalMoveoPlayer = (board[oPlayerPos-1] == 0) ? 0 : 1;
    illegalMovexPlayer = (board[xPlayerPos-1] == 0) ? 0 : 1;
  end
    
  
  
  always @(posedge reset or result or noVacantSpace ) begin
    if (result && winner==2'b01)begin
      $display("O_PLAYER WON THE GAME :)");#2;
    end
    else if (result && winner==2'b10) begin
      $display("X_PLAYER WON THE GAME :)");#2;
    end
    else if (noVacantSpace)
      $display("DRAW -_-");
   
   
    noVacantSpace = 0;
    currentState = IDLE;
    moveCount = 0;
    for ( i = 0; i < 9; i = i + 1)
      board[i] = 0;
     winner=2'b00;
     result=0; 
  end
  
  always @(nextState) begin
   

    for ( i = 0; i <= 2; i = i + 1) begin
      for ( j = 0; j <= 2; j = j + 1) begin
        case (board[3*i+j])
          0: $write(". ");
          1: $write("O ");
          2: $write("X ");
          default: $write(". ");
        endcase
      end $display("");
    end $display("");
  end
  
  always @(posedge clk) begin
    currentState = nextState;
  end

  always @(negedge clk) begin
    case (currentState)
      IDLE: begin
        if (play && ~reset) begin
          nextState = O_PLAYER;
        end else begin
          nextState = currentState;
        end
      end

      O_PLAYER: begin
        $display("O Player's Move");
        
        if (~illegalMoveoPlayer) begin
          nextState = X_PLAYER;
          board[oPlayerPos-1] = 1;
          moveCount = moveCount + 1;
        end else if (noVacantSpace || result) begin
          nextState = GAME_OVER;
        end else if (illegalMoveoPlayer) begin
          nextState = currentState;
          $display("Invalid Move, Please try again");
        end else begin
          nextState = currentState;
        end
      end

      X_PLAYER: begin
        $display("X Plyaer's Move");
       
        if (~illegalMovexPlayer) begin
          nextState = O_PLAYER;
          board[xPlayerPos-1] = 2;
          moveCount = moveCount + 1;
        end else if (noVacantSpace || result) begin
          nextState = GAME_OVER;
        end else if (illegalMovexPlayer) begin
          nextState = currentState;
          $display("Invalid Move, Please try again");
        end else begin
          nextState = currentState;
        end
      end

      GAME_OVER: begin
        if (~reset) begin
          nextState = currentState;
        end else begin
          nextState = IDLE;
        end
      end
    endcase
  end
  
  always @(currentState) begin

    if (moveCount == 9)
      noVacantSpace = 1;
    else
      noVacantSpace = 0;
  end
  
  always @(currentState) begin
    if (board[0] == 1 && board[1] == 1 && board[2] == 1) begin
      result = 1;winner = 2'b01;
    end else if (board[0] == 1 && board[3] == 1 && board[6] == 1) begin
      result = 1;winner = 2'b01;
    end else if (board[0] == 1 && board[4] == 1 && board[8] == 1) begin
      result = 1;winner = 2'b01;
    end else if (board[1] == 1 && board[4] == 1 && board[7] == 1) begin
      result = 1;winner = 2'b01;
    end else if (board[2] == 1 && board[5] == 1 && board[8] == 1) begin
      result = 1;winner = 2'b01;
    end else if (board[3] == 1 && board[4] == 1 && board[5] == 1) begin
      result = 1;winner = 2'b01;
    end else if (board[6] == 1 && board[7] == 1 && board[8] == 1) begin
      result = 1;winner = 2'b01;
    end else if (board[2] == 1 && board[4] == 1 && board[6] == 1) begin
      result = 1;winner = 2'b01;
    end else if (board[0] == 2 && board[1] == 2 && board[2] == 2) begin
      result = 1;winner = 2'b10;
    end else if (board[0] == 2 && board[3] == 2 && board[6] == 2) begin
      result = 1;winner = 2'b10;
    end else if (board[0] == 2 && board[4] == 2 && board[8] == 2) begin
      result = 1;winner = 2'b10;
    end else if (board[1] == 2 && board[4] == 2 && board[7] == 2) begin
      result = 1;winner = 2'b10;
    end else if (board[2] == 2 && board[5] == 2 && board[8] == 2) begin
      result = 1;winner = 2'b10;
    end else if (board[3] == 2 && board[4] == 2 && board[5] == 2) begin
      result = 1;winner = 2'b10;
    end else if (board[6] == 2 && board[7] == 2 && board[8] == 2) begin
      result = 1;winner = 2'b10;
    end else if (board[2] == 2 && board[4] == 2 && board[6] == 2) begin
      result = 1;winner = 2'b10;
    end
     
  end
endmodule