// Dart imports:
import 'dart:async';

// Package imports:
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

// Project imports:
import 'package:tic_tac_toe/app/app.locator.dart';
import 'package:tic_tac_toe/app/app.router.dart';

class StartupViewModel extends BaseViewModel {
  /// Viewmodel for the startup widget
  final _navigationService = locator<NavigationService>();

  StartupViewModel() {
    // Using a 3 seconds timer, then navigating to other route
    Timer(const Duration(seconds: 1), _nextScreen);
  }

  Future<void> _navigateToMainMenu() async {
    /// The method _navigateToMainMenu is used to clear the widget tree and navigate to the game route
    await _navigationService.clearStackAndShow(Routes.mainMenuView);
  }

  void _nextScreen() async {
    /// The method _nextScreen is used to chose the next route to push into the widget tree
    await _navigateToMainMenu();
  }
}
