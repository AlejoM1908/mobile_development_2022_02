// Dart imports:
import 'dart:math';

class Player {
  /// Abstract class to define a user playing the Tic Tac Toe game
  String character;
  String name;
  int _score = 0;

  Player({required this.character, required this.name});

  int getMove(List<String> board) {
    /// Abstract method to define the move of the player
    /// board is the current board state in a list of 9 strings
    /// Return the index of the move
    return 0;
  }

  int get score => _score;

  void incrementScore() {
    /// Increment the score of the player by 1
    _score++;
  }

  void resetScore() {
    /// Reset the score of the player to 0
    _score = 0;
  }

  List<int> _emptyTiles(List<String> board) {
    /// Used to return the empty tiles indexes
    /// board is the current board state in a list of 9 strings
    /// Return a list of indexes from the given board
    /// Example: ['x','o','x','x','o','o','','',''] => [6, 7, 8]
    return List.generate(board.length, (index) => index)
        .where((index) => board[index] == '')
        .toList();
  }

  int _minimax(List<String> board, bool isMaximizing, int index) {
    /// Implement the minimax algorithm to determine the best move for the IA
    /// board is the current board state in a list of 9 strings
    /// isMaximizing is true if the current player is the IA, false otherwise
    /// index is the index of the current move
    /// Return the index of the best move
    String character = isMaximizing ? this.character : 'x';
    List moves = _emptyTiles(board);

    // Check for Leaf nodes states
    if (checkWinner(board, index, !isMaximizing ? this.character : 'x')) {
      int score = moves.length + 1;
      return isMaximizing ? -score : score;
    } else if (moves.isEmpty) {
      return 0;
    }

    // Expand the tree and get the best move
    int bestScore = isMaximizing ? -500 : 500;

    for (var move in moves) {
      List<String> newBoard = List.from(board);
      newBoard[move] = character;

      // Select the best move for the maximizing player
      int score = _minimax(newBoard, !isMaximizing, move);
      if (score > bestScore && isMaximizing) {
        bestScore = score;
      } else if (score < bestScore && !isMaximizing) {
        bestScore = score;
      }
    }

    return bestScore;
  }

  /// Method that return if the given index is a winning move
  /// Return true if the given index is a winning move
  bool checkWinner(List<String> board, int index, String character) {
    /// Check if the given index in the board state is a winning move
    /// board is the current board state in a list of 9 strings
    /// index is the index of the current move in the board state
    /// character is the character of the current player
    /// Return true if the given index is a winning move
    /// Example: (['x','o','x','x','o','o','x','',''], 6, 'x') => true
    var row = index ~/ 3;
    var column = index % 3;
    var diagonal = (row == column) ? true : false;
    var antiDiagonal = (row + column == 2) ? true : false;

    // Check all the possible winning combinations for the given index
    if ((board[row * 3] == character &&
            board[row * 3 + 1] == character &&
            board[row * 3 + 2] == character) ||
        (board[column] == character &&
            board[column + 3] == character &&
            board[column + 6] == character) ||
        (diagonal &&
            board[0] == character &&
            board[4] == character &&
            board[8] == character) ||
        (antiDiagonal &&
            board[2] == character &&
            board[4] == character &&
            board[6] == character)) return true;

    return false;
  }
}

class HumanPlayer extends Player {
  /// Class that defines the behavior of a human player
  HumanPlayer({required String character, required String name})
      : super(character: character, name: name);

  @override
  int getMove(List<String> board) {
    return 0;
  }
}

class IAPlayer extends Player {
  /// Class that define a AI player that play sometimes randomly and sometimes with minimax algorithm
  int difficulty;

  IAPlayer(
      {required String character, required String name, this.difficulty = 40})
      : super(character: character, name: name);

  @override
  int getMove(List<String> board) {
    /// Return the index of the best move for the IA
    List<int> moves = _emptyTiles(board);

    if (Random().nextInt(100) >= difficulty) {
      return _emptyTiles(board)[Random().nextInt(_emptyTiles(board).length)];
    }

    if (moves.length == 9) return Random().nextInt(9);

    int bestScore = -500;
    int bestMove = -1;

    for (var move in moves) {
      List<String> newBoard = List.from(board);
      newBoard[move] = character;

      int score = _minimax(newBoard, false, move);
      if (score > bestScore) {
        bestScore = score;
        bestMove = move;
      }
    }

    return bestMove;
  }
}
