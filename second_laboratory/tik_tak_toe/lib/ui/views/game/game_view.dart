// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:stacked/stacked.dart';
import 'package:tic_tac_toe/ui/widgets/organisms/game_board/game_board_view.dart';

// Project imports:
import 'game_viewmodel.dart';
import '../../../utils/colors.dart' as app_colors;

// The class GameView is the view for the game route
class GameView extends StatelessWidget {
  const GameView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<GameViewModel>.reactive(
      builder: (context, model, child) => SafeArea(
        child: Scaffold(
            appBar: AppBar(
              elevation: 0,
              backgroundColor: app_colors.background,
              actions: [
                IconButton(
                  icon: const Icon(Icons.refresh),
                  onPressed: () {
                    model.clearBoard();
                  },
                ),
              ],
              title: const Text(
                'Tic Tac Toe',
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.w800,
                  color: app_colors.text,
                ),
              ),
            ),
            backgroundColor: app_colors.background,
            body: const GameBoard()),
      ),
      viewModelBuilder: () => GameViewModel(),
    );
  }
}
