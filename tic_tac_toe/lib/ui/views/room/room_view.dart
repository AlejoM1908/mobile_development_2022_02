import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:tic_tac_toe/ui/views/room/room_viewmodel.dart';
import 'package:tic_tac_toe/ui/widgets/atoms/menu_button.dart';
import 'package:tic_tac_toe/ui/widgets/atoms/player_tag.dart';
import 'package:tic_tac_toe/utils/colors.dart' as app_colors;

class RoomView extends StatelessWidget {
  const RoomView({super.key});

  @override
  Widget build(BuildContext context) {
    final _media = MediaQuery.of(context);
    return ViewModelBuilder.reactive(
      builder: (context, RoomViewModel model, child) => Scaffold(
          appBar: AppBar(
            elevation: 0,
            centerTitle: true,
            backgroundColor: app_colors.background,
            title: Text(
              model.title,
              style: const TextStyle(
                fontSize: 30.0,
                fontWeight: FontWeight.w800,
                color: app_colors.text,
              ),
            ),
          ),
          body: _media.orientation == Orientation.portrait
              ? _portraitUpView(model)
              : _portraitDownView(model)),
      viewModelBuilder: () => RoomViewModel(),
    );
  }

  Widget _portraitUpView(RoomViewModel model) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          PlayerTag(
            name: 'player 1',
            color: decideColor(true),
          ),
          PlayerTag(
            name: 'player 2',
            color: decideColor(true),
          ),
          const SizedBox(height: 8),
          Container(
            decoration: BoxDecoration(
              color: app_colors.backgroundVariant,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 4.0, horizontal: 10.0),
              child: Text(
                model.roomKey,
                style: const TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.w800,
                  color: app_colors.text,
                ),
              ),
            ),
          ),
          MenuButton(
            text: 'Iniciar Partida',
            onPressed: () => model.startGame(),
          )
        ],
      ),
    );
  }

  Widget _portraitDownView(RoomViewModel model) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              PlayerTag(
                name: 'player 1',
                color: decideColor(true),
              ),
              PlayerTag(
                name: 'player 2',
                color: decideColor(true),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            model.roomKey,
            style: const TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.w800,
              color: app_colors.text,
            ),
          ),
          MenuButton(
            text: 'Iniciar Partida',
            onPressed: () => model.startGame(),
          )
        ],
      ),
    );
  }

  Color decideColor(bool isReady) {
    return isReady ? app_colors.ready : app_colors.notReady;
  }
}
