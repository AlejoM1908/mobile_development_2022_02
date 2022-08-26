// Package imports:
import 'package:stacked/stacked.dart';
import 'package:tic_tac_toe/app/app.locator.dart';
import 'package:tic_tac_toe/services/game_service/game_service.dart';

/// The class StartupViewModel is the ViewModel for the startup route
class GameViewModel extends BaseViewModel {
  final gameService = locator<GameService>();
  
  clearBoard(){
    gameService.clearGame();
    notifyListeners();
  }

  setIA(){
    gameService.switchIA();
    notifyListeners();
  }
}
