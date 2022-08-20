// Dart imports:
import 'dart:async';

// Package imports:
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

// Project imports:
import 'package:tik_tak_toe/app/app.locator.dart';
import 'package:tik_tak_toe/app/app.router.dart';

/// The class StartupViewModel is the ViewModel for the startup route
class GameViewModel extends BaseViewModel {
  /// Service used to navigate to other routes
  final _navigationService = locator<NavigationService>();

  StartupViewModel() {}
}
