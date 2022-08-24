import 'dart:math';

import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:tic_tac_toe/app/app.locator.dart';
import 'package:tic_tac_toe/models/player_model.dart';

class GameService with ReactiveServiceMixin {
  final _dialogService = locator<DialogService>();
  List<String> charactersList = List.filled(9, '');
  List<Player> players = [];
  bool turn = Random().nextBool(); // false for player1, true for player2
  bool isIA = false;
  final _counter = ReactiveValue<int>(0);

  GameService() {
    listenToReactiveValues([_counter]);
    players.add(HumanPlayer(character: 'x', name: 'Player X'));
    players.add(HumanPlayer(character: 'o', name: 'Player O'));
  }

  void setDefaultValues() {
    /// Start a new game saving the current scores
    charactersList = List.filled(9, '');
    turn = Random().nextBool();
    _counter.value = 0;

    if (turn && isIA) placeCharacter(players[1].getMove(charactersList));

    notifyListeners();
  }

  void clearGame() {
    /// Clear the game board and the scores
    setDefaultValues();

    for (var player in players) {
      player.resetScore();
    }

    notifyListeners();
  }

  void switchIA() {
    /// Switch between IA and human player
    isIA = !isIA;
    players.removeLast();

    isIA
        ? players.add(MiniMaxAIPlayer(character: 'o', name: 'IA player'))
        : players.add(HumanPlayer(character: 'o', name: 'Player O'));

    clearGame();
    notifyListeners();
  }

  void placeCharacter(int index) {
    /// Place the character in the board if the index is not -1
    if (index < 0 && charactersList[index] != '')
      return;

    charactersList[index] = turn ? players[1].character : players[0].character;
    turn = !turn;
    _counter.value++;

    if (_counter.value == 9) {
      _dialogService.showDialog(
        title: 'Game Over',
        description: 'It\'s a draw',
      );

      setDefaultValues();
      notifyListeners();
      return;
    }

    if (checkWinner(index)) _finishGame();
    notifyListeners();
  }

  void tileTap(int index) {
    /// Place the character in the board
    placeCharacter(index);

    if (isIA) {
      /// If the IA is playing, play the move
      placeCharacter(players[1].getMove(charactersList));
    }
  }

  bool checkWinner(int index) {
    /// Check if there is a winner
    var character = turn ? 'x' : 'o';
    var row = index ~/ 3;
    var column = index % 3;
    var diagonal = (row == column) ? true : false;
    var antiDiagonal = (row + column == 2) ? true : false;

    if ((charactersList[row * 3] == character &&
            charactersList[row * 3 + 1] == character &&
            charactersList[row * 3 + 2] == character) ||
        (charactersList[column] == character &&
            charactersList[column + 3] == character &&
            charactersList[column + 6] == character) ||
        (diagonal &&
            charactersList[0] == character &&
            charactersList[4] == character &&
            charactersList[8] == character) ||
        (antiDiagonal &&
            charactersList[2] == character &&
            charactersList[4] == character &&
            charactersList[6] == character)) return true;

    return false;
  }

  _finishGame() {
    _dialogService.showDialog(
      title: 'Game Over',
      description:
          'Game is over. The winner is ${turn ? players[0].name : players[1].name}',
    );

    turn ? players[0].incrementScore() : players[1].incrementScore();

    setDefaultValues();
  }
}
