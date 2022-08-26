// Dart imports:
import 'dart:io';

// Flutter imports:
import 'package:flutter/services.dart';

// Package imports:
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

// Project imports:
import 'package:tic_tac_toe/app/app.locator.dart';
import 'package:tic_tac_toe/app/app.router.dart';
import 'package:tic_tac_toe/models/dialog_type.dart';
import 'package:tic_tac_toe/services/game_service/game_service.dart';

class MainMenuViewModel extends BaseViewModel{
  final _navigationService = locator<NavigationService>();
  final _dialogService = locator<DialogService>();
  final _gameService = locator<GameService>();
  
  String title = 'TIC TAC TOE';

  void newGame() {
    _gameService.clearGame();
    _navigationService.navigateTo(Routes.gameView);
  }

  Future<void> selectDifficulty() async {
    var selected = await _dialogService.showCustomDialog(
      variant: DialogType.difficultySelector,
      title: 'Dificultad de IA',
      description: 'Selecciona la dificultad de la IA',
      mainButtonTitle: 'Aceptar',
    );

    _gameService.changeDifficulty(selected!.data['difficulty']);
  }

  void closeApp() {
    if (Platform.isAndroid) {
      SystemNavigator.pop();
    } else if (Platform.isIOS) {
      exit(0);
    }
  }
}
