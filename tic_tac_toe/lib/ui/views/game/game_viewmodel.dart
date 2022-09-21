// Package imports:
import 'package:stacked/stacked.dart';

// Project imports:
import 'package:tic_tac_toe/app/app.locator.dart';
import 'package:tic_tac_toe/services/game_service/game_service.dart';

class GameViewModel extends BaseViewModel {
  /// Viewmodel for the game widget
  final gameService = locator<GameService>();
  
  void clearBoard(){
    /// The clearBoard method is used to clear the board
    gameService.clearGame();
    notifyListeners();
  }

  void setIA(){
    /// The setIA method is used to switch between IA and human player
    gameService.switchIA();
    notifyListeners();
  }

  bool isLocal(){
    /// The isLocal method is used to check if the game is local
    return !gameService.isOnline;
  }
}
