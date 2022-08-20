// Dart imports:
import 'dart:async';

// Package imports:
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

// Project imports:
import 'package:tik_tak_toe/app/app.locator.dart';
import 'package:tik_tak_toe/app/app.router.dart';

/// The class StartupViewModel is the ViewModel for the startup route
class StartupViewModel extends BaseViewModel {
  /// Service used to navigate to other routes
  final _navigationService = locator<NavigationService>();

  StartupViewModel() {
    // Using a 3 seconds timer, then navigating to other route
    Timer(const Duration(seconds: 3), _nextScreen);
  }

  /// The method _navigateToGame is used to clear the widget tree and navigate to the game route
  Future _navigateToGame() async {
    await _navigationService.clearStackAndShow(Routes.gameView);
  }

  /// The method _nextScreen is used to chose the next route to push into the widget tree
  _nextScreen() async {
    await _navigateToGame();
  }
}
