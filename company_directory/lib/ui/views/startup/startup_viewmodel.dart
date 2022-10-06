import 'dart:async';

import 'package:company_directory/app/app.locator.dart';
import 'package:company_directory/app/app.router.dart';
import 'package:company_directory/services/sqlite_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class StartupViewModel extends BaseViewModel {
  /// Viewmodel for the startup widget
  final _navigationService = locator<NavigationService>();
  final _sqliteService = locator<SQLiteService>();

  StartupViewModel() {
    // Using a 3 seconds timer, then navigating to other route
    Timer(const Duration(seconds: 1), _nextScreen);
  }

  Future<void> _navigateToMainMenu() async {
    /// The method _navigateToMainMenu is used to clear the widget tree and navigate to the game route
    await _navigationService.clearStackAndShow(Routes.homeView);
  }

  void _nextScreen() async {
    /// The method _nextScreen is used to chose the next route to push into the widget tree
    await _sqliteService.initialise();
    await _navigateToMainMenu();
  }
}
