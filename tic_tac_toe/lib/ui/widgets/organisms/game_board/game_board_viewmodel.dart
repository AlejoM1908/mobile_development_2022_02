// Package imports:
import 'package:stacked/stacked.dart';

// Project imports:
import 'package:tic_tac_toe/app/app.locator.dart';
import 'package:tic_tac_toe/services/game_service/game_service.dart';

class GameBoardViewModel extends ReactiveViewModel {
  final gameService = locator<GameService>();

  tileTap(int index) {
    gameService.tileTap(index);
    notifyListeners();
  }

  @override
  List<ReactiveServiceMixin> get reactiveServices => [gameService];
}
