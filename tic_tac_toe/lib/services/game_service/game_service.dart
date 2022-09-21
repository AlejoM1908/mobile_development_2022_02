// Dart imports:
import 'dart:math';

// Package imports:
import 'package:audioplayers/audioplayers.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

// Project imports:
import 'package:tic_tac_toe/app/app.locator.dart';
import 'package:tic_tac_toe/models/dialog_type.dart';
import 'package:tic_tac_toe/models/player_model.dart';

import '../firebase/online_service.dart';

class GameService with ReactiveServiceMixin {
  /// Service to manage all th game logic and state of the Tic Tac Toe.
  final _dialogService = locator<DialogService>();
  final _onlineService = locator<OnlineService>();
  final _audioPlayer = AudioPlayer();

  List<String> _charactersList = List.filled(9, '');
  final List<Player> _players = [];
  String _roomCode = '';
  bool _turn = Random().nextBool(); // false for player1, true for player2
  bool _isIA = false;
  bool _isOnline = false;
  int _difficulty = 40;
  final _counter = ReactiveValue<int>(0);

  // Getters
  List<String> get grid => _charactersList;
  String get roomCode => _roomCode;
  bool get turn => _turn;
  bool get isOnline => _isOnline;
  bool get isIA => _isIA;

  GameService() {
    listenToReactiveValues([_counter]);
    _players.add(HumanPlayer(character: 'x', name: 'Jugador X'));
    _players.add(HumanPlayer(character: 'o', name: 'Jugador O'));
  }

  Player getPlayer(int index) {
    /// Return the information of the player at the given index.
    /// Index (int): 0 is player1, index 1 is player2.
    if (index >= _players.length) throw ArgumentError('Invalid index');
    return _players[index];
  }

  bool canPlace() {
    /// Return true if the ia is playing and already made a move, false otherwise.
    if (_isIA && _turn) return false;
    if (_isOnline && _turn) return false;
    return true;
  }

  void generateRoomCode() {
    /// Generate a random room code with numbers and letters.
    final _random = Random();
    final _code = StringBuffer();

    for (var i = 0; i < 6; i++) {
      final _char = _random.nextInt(36);
      if (_char < 10) {
        _code.write(_char);
      } else {
        _code.write(String.fromCharCode(_char + 55));
      }
    }

    _roomCode = _code.toString();
  }

  void setDefaultValues() {
    /// Start a new game saving the current scores
    _charactersList = List.filled(9, '');
    _turn = Random().nextBool();
    _counter.value = 0;

    // IA player play first
    if (_turn && _isIA) placeCharacter(_players[1].getMove(_charactersList));
    notifyListeners();

    // Update the online game state
    if (_isOnline) {
      _onlineService.updateGameState(_roomCode, {
        'board': _charactersList,
        'score': [_players[0].score, _players[1].score],
        'turn': _turn,
      });
    }
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

  void switchOnline() {
    /// Switch between online and offline mode
    _isOnline = !_isOnline;
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

    // Update the online game state
    if (_isOnline) {
      _onlineService.updateGameState(_roomCode, {
        'board': _charactersList,
        'score': [_players[0].score, _players[1].score],
        'turn': _turn,
      });
    }

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
    if (_isIA && _turn) {
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
