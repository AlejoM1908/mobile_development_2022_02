// Flutter imports:
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

// Package imports:
import 'package:stacked/stacked.dart';

// Project imports:
import 'startup_viewmodel.dart';
import 'package:kitchen_hub/utils/colors.dart' as app_colors;

/// The class StartupView is the view for the startup route
class StartupView extends StatelessWidget {
  const StartupView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context);
    return ViewModelBuilder<StartupViewModel>.reactive(
      builder: (context, model, child) => SafeArea(
          child: Scaffold(
              body: Container(
        width: media.size.width,
        height: media.size.height,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              app_colors.background,
              app_colors.white,
            ],
          ),
        ),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const SpinKitPianoWave(color: app_colors.primary, size: 100.0),
              SizedBox(height: media.size.height * 0.06),
              Text(model.title, style: const TextStyle(fontSize: 40.0, color: app_colors.text)),
            ]),
      ))),
      viewModelBuilder: () => StartupViewModel(),
    );
  }
}
