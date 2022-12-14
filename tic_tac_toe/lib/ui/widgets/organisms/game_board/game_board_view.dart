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
    final _media = MediaQuery.of(context);
    return ViewModelBuilder<GameBoardViewModel>.reactive(
      builder: (context, model, child) =>
          _media.orientation == Orientation.portrait
              ? _portraitUpView(model, _media.size.height, _media.size.width)
              : _portraitDownView(model, _media.size.height, _media.size.width),
      viewModelBuilder: () => GameBoardViewModel(),
    );
  }

  Widget _portraitUpView(GameBoardViewModel model, height, width) {
    return SizedBox(
      height: height,
      width: width,
      child: Column(
        children: [
          Row(
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
    );
  }

  Widget _portraitDownView(GameBoardViewModel model, height, width) {
    return SizedBox(
      height: height,
      width: width,
      child: Row(
        children: [
          Center(
            child: SizedBox(
              height: 400,
              width: 220,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
                child: Column(
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
                    TurnMessage(
                      turn: !model.getTurn(),
                      firstName: model.getPlayer1().name,
                      secondName: model.getPlayer2().name,
                    ),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(width: 40.0),
          SizedBox(
            height: 262,
            width: 262,
            child: GameGrid(
              onTileTap: (index) => model.tileTap(index),
              charactersList: model.getGrid(),
            ),
          ),
          const SizedBox(width: 70.0)
        ],
      ),
    );
  }
}
