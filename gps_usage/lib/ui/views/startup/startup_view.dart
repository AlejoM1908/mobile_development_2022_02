import 'package:gps_usage/ui/views/startup/startup_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class StartupView extends StatelessWidget {
  const StartupView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
      viewModelBuilder: () => StartupViewModel(),
      builder: (context, model, child) => SafeArea(
          child: Scaffold(
              body: Stack(
        children: <Widget>[
          Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const <Widget>[Center(child: Text('Loading app'))])
        ],
      ))),
    );
  }
}
