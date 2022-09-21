import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:tic_tac_toe/app/app.locator.dart';
import 'package:tic_tac_toe/app/app.router.dart';

class RoomViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();
  final String _title = 'Juego en línea';
  String roomKey = 'Some key';

  // Getters
  String get title => _title;
  

  void navigateToLocalGame() {
  }

  void navigateToOnlineGame() {
    _navigationService.navigateTo(Routes.roomView);
  }

  void navigateToAIGame() {
  }

  void startGame() {
    
  }
}