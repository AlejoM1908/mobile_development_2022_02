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
                    userName: model.gameService.players[0].name,
                    userScore: model.gameService.players[0].score,
                  ),
                  UserScore(
                    userName: model.gameService.players[1].name,
                    userScore: model.gameService.players[1].score,
                  ),
                ],
              ),
            ),
            GameGrid(
              onTileTap: (index) => model.tileTap(index),
              charactersList: model.gameService.charactersList,
            ),
            TurnMessage(
              turn: !model.gameService.turn,
              firstName: model.gameService.players[0].name,
              secondName: model.gameService.players[1].name,
            ),
          ],
        ),
      ),
      viewModelBuilder: () => GameBoardViewModel(),
    );
  }
}
