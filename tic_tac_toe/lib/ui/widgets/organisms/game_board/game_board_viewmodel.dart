// Package imports:
import 'package:stacked/stacked.dart';

// Project imports:
import 'package:tic_tac_toe/app/app.locator.dart';
import 'package:tic_tac_toe/models/player_model.dart';
import 'package:tic_tac_toe/services/game_service/game_service.dart';

class GameBoardViewModel extends ReactiveViewModel {
  /// Viewmodel for the game board widget
  final _gameService = locator<GameService>();

  void tileTap(int index) {
    /// Function to handle the tile tap event from the player
    /// index (int): index of the tile tapped
    _gameService.tileTap(index);
    notifyListeners();
  }

  // Getters for the players information
  Player getPlayer1() => _gameService.getPlayer(0);
  Player getPlayer2() => _gameService.getPlayer(1);
  List<String> getGrid() => _gameService.grid;
  bool getTurn() => _gameService.turn;

  @override
  List<ReactiveServiceMixin> get reactiveServices => [_gameService];
}
