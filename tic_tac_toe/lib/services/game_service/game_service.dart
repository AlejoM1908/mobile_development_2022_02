// Dart imports:
import 'dart:math';

// Package imports:
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

// Project imports:
import 'package:tic_tac_toe/app/app.locator.dart';
import 'package:tic_tac_toe/models/dialog_type.dart';
import 'package:tic_tac_toe/models/player_model.dart';

class GameService with ReactiveServiceMixin {
  final _dialogService = locator<DialogService>();
  List<String> charactersList = List.filled(9, '');
  List<Player> players = [];
  bool turn = Random().nextBool(); // false for player1, true for player2
  bool isIA = false;
  int difficulty = 40;
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
    for (var player in players) {
      player.resetScore();
    }

    setDefaultValues();
  }

  void changeDifficulty(int value) {
    /// Change the difficulty of the AI player
    difficulty = value;
    clearGame();
  }

  void switchIA() {
    /// Switch between IA and human player
    isIA = !isIA;
    players.removeLast();

    isIA
        ? players.add(IAPlayer(character: 'o', name: 'IA player', difficulty: difficulty))
        : players.add(HumanPlayer(character: 'o', name: 'Player O'));

    clearGame();
    notifyListeners();
  }

  void placeCharacter(int index) {
    /// Place the character in the board if the index is not -1
    if (index < 0 || charactersList[index] != '') {
      return;
    }

    charactersList[index] = turn ? players[1].character : players[0].character;
    turn = !turn;
    _counter.value++;

    if (_counter.value == 9) {
      _dialogService.showCustomDialog(
        variant: DialogType.singleMessage,
        title: 'Game Over',
        description: 'It\'s a draw',
        mainButtonTitle: 'New Game',
      );

      setDefaultValues();
      return;
    }

    if (players[0].checkWinner(charactersList, index, turn ? 'x' : 'o')) {
      _finishGame();
    }
    notifyListeners();
  }

  void tileTap(int index) {
    /// Place the character in the board
    placeCharacter(index);

    if (isIA && turn) placeCharacter(players[1].getMove(charactersList));
  }

  _finishGame() {
    _dialogService.showCustomDialog(
      variant: DialogType.singleMessage,
      title: 'Game Over',
      description:
          'Game is over. The winner is ${turn ? players[0].name : players[1].name}',
          mainButtonTitle: 'New Game',
    );

    turn ? players[0].incrementScore() : players[1].incrementScore();

    setDefaultValues();
  }
}
