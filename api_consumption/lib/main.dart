import 'package:flutter/material.dart';
import 'package:api_consumption/app/app.locator.dart';
import 'package:api_consumption/app/app.router.dart';
import 'package:api_consumption/config/development.dart';
import 'package:api_consumption/env.dart';
import 'package:api_consumption/ui/widgets/organisms/dialogs/setup_dialog_ui.dart';
import 'package:api_consumption/utils/colors.dart' as app_colors;
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
        title: 'API Consumption',
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
