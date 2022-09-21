import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:tic_tac_toe/app/app.locator.dart';
import 'package:tic_tac_toe/app/app.router.dart';
import 'package:tic_tac_toe/services/game_service/game_service.dart';

class ModeSelectorViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();
  final _gameService = locator<GameService>();
  final String _title = 'Modos de juego';

  // Getters
  String get title => _title;

  void navigateToLocalGame() {
    _gameService.isIA ? _gameService.switchIA() : null;
    _gameService.isOnline ? _gameService.switchOnline() : null;
    _gameService.clearGame();
    _navigationService.navigateTo(Routes.gameView);
  }

  void navigateToOnlineGame() {
    _gameService.isIA ? _gameService.switchIA() : null;
    _gameService.isOnline ?  null : _gameService.switchOnline();
    _gameService.clearGame();
    _navigationService.navigateTo(Routes.onlineMenuView);
  }

  void navigateToAI() {
    _gameService.isIA ? null : _gameService.switchIA();
    _gameService.isOnline ? _gameService.switchOnline() : null;
    _gameService.clearGame();
    _navigationService.navigateTo(Routes.gameView);
  }
}