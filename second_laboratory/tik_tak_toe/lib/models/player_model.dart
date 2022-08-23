import 'dart:math';

class Player {
  /// Abstract class to define a user with a character
  String character;
  String name;
  int _score = 0;

  Player({required this.character, required this.name});

  /// Abstract method to define the move of the player
  /// Return the index of the move
  int getMove(List<String> board) {
    return 0;
  }

  int get score => _score;

  void incrementScore() {
    _score++;
  }

  void resetScore() {
    _score = 0;
  }

  /// Method that return the empty tiles indexes
  /// Return a list of indexes from the given board
  /// Example: [0, 1, 2, 3, 4, 5, 6, 7, 8]
  List<int> _emptyTiles(List<String> board) {
    return List.generate(board.length, (index) => index).where((index) => board[index] == '').toList();
  }
}

class HumanPlayer extends Player {
  /// Class that define a human player
  HumanPlayer({required String character, required String name})
      : super(character: character, name: name);

  @override
  int getMove(List<String> board) {
    return 0;
  }
}

class RandomAIPlayer extends Player {
  /// Class that define a AI player that play randomly
  RandomAIPlayer({required String character, required String name})
      : super(character: character, name: name);

  @override
  int getMove(List<String> board) {
    /// Return a random index from the empty tiles
    return _emptyTiles(board)[Random().nextInt(_emptyTiles(board).length)];
  }
}

class MinMaxAIPlayer extends Player {
  /// Class that define a AI player that use the minmax algorithm
  MinMaxAIPlayer({required String character, required String name})
      : super(character: character, name: name);

  @override
  int getMove(List<String> board) {
    return _minmax(board, character= 'o');
  }

  int _minmax(List<String> board, String character) {
    /// Method that return the best move posible for the IA
    /// Return the index of the move
    /// Board is a list of 9 strings with the characters of the board
    /// character is the character of the player that play the move
    var tiles = _emptyTiles(board);
    if (tiles.length == 0) {
      return -1;
    }
    if (tiles.length == 1) {
      return tiles[0];
    }
    var bestMove = -1;
    var bestScore = -1;
    for (var move in tiles) {
      List<String> newBoard = List.from(board);
      newBoard[move] = character;
      var score = _minmax(newBoard, character == 'o' ? 'x' : 'o');
      if (score > bestScore) {
        bestScore = score;
        bestMove = move;
      }
    }
    return bestMove;
  }
}
