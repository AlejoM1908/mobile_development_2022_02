// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:stacked/stacked.dart';

// Project imports:
import 'game_viewmodel.dart';

// The class GameView is the view for the game route
class GameView extends StatelessWidget {
  const GameView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<GameViewModel>.reactive(
      builder: (context, model, child) => SafeArea(
        child: Scaffold(
        ),
      ),
      viewModelBuilder: () => GameViewModel(),
    );
  }
}
