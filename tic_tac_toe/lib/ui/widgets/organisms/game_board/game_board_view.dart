// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:stacked/stacked.dart';

// Project imports:
import 'package:tic_tac_toe/ui/widgets/atoms/game_grid.dart';
import 'package:tic_tac_toe/ui/widgets/atoms/turn_message.dart';
import 'package:tic_tac_toe/ui/widgets/atoms/user_score.dart';
import 'game_board_viewmodel.dart';

class GameBoard extends StatelessWidget {
  const GameBoard({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<GameBoardViewModel>.reactive(
      builder: (context, model, child) => SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  UserScore(
                    userName: model.getPlayer1().name,
                    userScore: model.getPlayer1().score,
                  ),
                  UserScore(
                    userName: model.getPlayer2().name,
                    userScore: model.getPlayer2().score,
                  ),
                ],
              ),
            ),
            GameGrid(
              onTileTap: (index) => model.tileTap(index),
              charactersList: model.getGrid(),
            ),
            TurnMessage(
              turn: !model.getTurn(),
              firstName: model.getPlayer1().name,
              secondName: model.getPlayer2().name,
            ),
          ],
        ),
      ),
      viewModelBuilder: () => GameBoardViewModel(),
    );
  }
}
