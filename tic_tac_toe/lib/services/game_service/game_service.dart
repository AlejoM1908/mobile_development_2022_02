// Dart imports:
import 'dart:io';
import 'dart:math';

// Package imports:
import 'package:audioplayers/audioplayers.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

// Project imports:
import 'package:tic_tac_toe/app/app.locator.dart';
import 'package:tic_tac_toe/models/dialog_type.dart';
import 'package:tic_tac_toe/models/player_model.dart';

class GameService with ReactiveServiceMixin {
  /// Service to manage all th game logic and state of the Tic Tac Toe.
  final _dialogService = locator<DialogService>();
  final _audioPlayer = AudioPlayer();
  List<String> _charactersList = List.filled(9, '');
  final List<Player> _players = [];
  bool _turn = Random().nextBool(); // false for player1, true for player2
  bool _isIA = false;
  int _difficulty = 40;
  final _counter = ReactiveValue<int>(0);

  // Getters
  List<String> get grid => _charactersList;
  bool get turn => _turn;

  GameService() {
    listenToReactiveValues([_counter]);
    _players.add(HumanPlayer(character: 'x', name: 'Jugador X'));
    _players.add(HumanPlayer(character: 'o', name: 'Jugador O'));
  }

  Player getPlayer(int index) {
    /// Return the informatio of the player at the given index.
    /// Index (int): 0 is player1, index 1 is player2.
    if (index >= _players.length) throw ArgumentError('Invalid index');
    return _players[index];
  }

  bool canPlace() {
    /// Return true if the ia is playing and already made a move, false otherwise.
    if (_isIA && _turn) return false;
    return true;
  }

  void setDefaultValues() {
    /// Start a new game saving the current scores
    _charactersList = List.filled(9, '');
    _turn = Random().nextBool();
    _counter.value = 0;

    // IA player play first
    if (_turn && _isIA) placeCharacter(_players[1].getMove(_charactersList));
    notifyListeners();
  }

  void clearGame() {
    /// Clear the game board and the scores
    for (var player in _players) {
      player.resetScore();
    }

    setDefaultValues();
  }

  void changeDifficulty(int value) {
    /// Change the difficulty of the AI player
    _difficulty = value;

    // Update the AI player
    if (_isIA) {
      _players.removeLast();
      _players.add(IAPlayer(
          character: 'o', name: 'Jugador IA', difficulty: _difficulty));
    }
    clearGame();
  }

  void switchIA() {
    /// Switch between IA and human player
    _isIA = !_isIA;
    _players.removeLast();

    _isIA
        ? _players.add(IAPlayer(
            character: 'o', name: 'Jugador IA', difficulty: _difficulty))
        : _players.add(HumanPlayer(character: 'o', name: 'Jugador O'));

    clearGame();
    notifyListeners();
  }

  void placeCharacter(int index) {
    /// Place the character in the board if the index is not -1
    /// index (int): index of the cell to place the character.
    if (index < 0 || _charactersList[index] != '') {
      return;
    }

    // Place the character in the grid and update turn and counter
    _charactersList[index] =
        _turn ? _players[1].character : _players[0].character;
    _turn = !_turn;
    _counter.value++;
    _audioPlayer.play(
      AssetSource('audios/tile_tap.mp3'),
      volume: 0.6,
    );

    // Check if there is a winner
    if (_players[0].checkWinner(_charactersList, index, _turn ? 'x' : 'o')) {
      _finishGame();
    }

    // Check if there is a tie
    if (_counter.value == 9) {
      _dialogService.showCustomDialog(
        variant: DialogType.singleMessage,
        title: 'Juego Finalizado',
        description: 'Es un empate',
        mainButtonTitle: 'Nuevo Juego',
      );

      setDefaultValues();
    }
    notifyListeners();
  }

  void tileTap(int index) async {
    /// Place the character in the board where the player tapped
    /// index (int): index of the cell to place the character.
    placeCharacter(index);

    // The IA is playing, so it moves after the player
    if (_isIA && _turn){
      await Future.delayed(const Duration(seconds: 1),
          () => placeCharacter(_players[1].getMove(_charactersList)));
    }
  }

  void _finishGame() {
    /// Finish the game and show the winner
    _dialogService.showCustomDialog(
      variant: DialogType.singleMessage,
      title: 'Juego Finalizado',
      description:
          'El juego termino. El ganador es ${_turn ? _players[0].name : _players[1].name}',
      mainButtonTitle: 'New Game',
    );

    // Increment the score of the winner
    _turn ? _players[0].incrementScore() : _players[1].incrementScore();

    setDefaultValues();
  }
}
