import 'package:company_directory/ui/widgets/organisms/dialogs/setup_dialog_ui.dart';
import 'package:flutter/material.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:company_directory/app/app.locator.dart';
import 'package:company_directory/app/app.router.dart';
import 'package:company_directory/config/development.dart';
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
  MyApp(this.env);

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
