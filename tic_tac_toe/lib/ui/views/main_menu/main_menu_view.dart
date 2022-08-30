// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:stacked/stacked.dart';

// Project imports:
import 'package:tic_tac_toe/ui/views/main_menu/main_menu_viewmodel.dart';
import 'package:tic_tac_toe/utils/colors.dart' as app_colors;

class MainMenuView extends StatelessWidget {
  const MainMenuView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
      viewModelBuilder: () => MainMenuViewModel(),
      builder: (context, MainMenuViewModel model, child) => Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: app_colors.background,
          title: Text(
            model.title,
            style: const TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.w800,
              color: app_colors.text,
            ),
          ),
        ),
        body: Center(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
              MenuButton(
                text: 'Nuevo Juego',
                onPressed: () => model.newGame(),
              ),
              const SizedBox(width: 20.0),
              MenuButton(
                text: 'Seleccionar dificultad',
                onPressed: () => model.selectDifficulty(),
              ),
              const SizedBox(width: 20.0),
              MenuButton(
                text: 'Salir',
                onPressed: () => model.closeApp(),
              ),
            ])),
      ),
    );
  }
}

// ignore: non_constant_identifier_names
Widget MenuButton({required Function onPressed, required String text}) {
  return TextButton(
    onPressed: () => onPressed(),
    child: Text(
      text,
      style: const TextStyle(
        fontSize: 20.0,
        fontWeight: FontWeight.w800,
        color: app_colors.text,
      ),
    ),
  );
}
