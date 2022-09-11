// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:stacked/stacked.dart';

// Project imports:
import 'login_viewmodel.dart';

// The class GameView is the view for the game route
class LoginView extends StatelessWidget {
  const LoginView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<LoginViewModel>.reactive(
      builder: (context, model, child) => SafeArea(
        child: Scaffold(
        ),
      ),
      viewModelBuilder: () => LoginViewModel(),
    );
  }
}
