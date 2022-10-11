import 'package:flutter/material.dart';
import 'package:gps_usage/app/app.locator.dart';
import 'package:gps_usage/app/app.router.dart';
import 'package:gps_usage/config/development.dart';
import 'package:gps_usage/env.dart';
import 'package:gps_usage/ui/widgets/organisms/dialogs/setup_dialog_ui.dart';
import 'package:gps_usage/utils/colors.dart' as app_colors;
import 'package:stacked_services/stacked_services.dart';

void main() {
  setupLocator();
  setupDialogUI();
  Development();
}

/// Main widget for the app
class MyApp extends StatelessWidget {
  final Env env;
  MyApp(this.env);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'GPS Usage',
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
