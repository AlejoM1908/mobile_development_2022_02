// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:stacked/stacked.dart';

// Project imports:
import 'startup_viewmodel.dart';

/// The class StartupView is the view for the startup route
class StartupView extends StatelessWidget {
  const StartupView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<StartupViewModel>.reactive(
              builder: (context, model, child) => SafeArea(
                  child: Scaffold(
                      body: Stack(
                children: <Widget>[
                  Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const <Widget>[
                        Center(
                            child: Text('Loading app'))
                      ])
                ],
              ))),
              viewModelBuilder: () => StartupViewModel(),
            );
  }
}
