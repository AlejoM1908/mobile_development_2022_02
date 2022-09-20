// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:stacked_services/stacked_services.dart';

// Project imports:
import 'package:tic_tac_toe/app/app.locator.dart';
import 'package:tic_tac_toe/app/app.router.dart';
import 'package:tic_tac_toe/config/development.dart';
import 'package:tic_tac_toe/ui/widgets/organisms/dialogs/setup_dialog_ui.dart';
import 'env.dart';
import 'utils/colors.dart' as app_colors;

void main() {
  setupLocator();
  setupDialogUI();
  Development();
}

/// Main widget for the app
class MyApp extends StatelessWidget {
  final Env env;
  const MyApp(this.env, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Tik Tak Toe',
        theme: ThemeData(
            canvasColor: app_colors.background,
            primaryColor: app_colors.primary,
            colorScheme: ColorScheme.fromSwatch()
                .copyWith(secondary: app_colors.secondary)),
        navigatorKey: StackedService.navigatorKey,
        onGenerateRoute: StackedRouter().onGenerateRoute,
        initialRoute: Routes.startupView);
  }
}
