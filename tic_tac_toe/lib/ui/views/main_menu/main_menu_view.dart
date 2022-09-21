// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:stacked/stacked.dart';

// Project imports:
import 'package:tic_tac_toe/ui/views/main_menu/main_menu_viewmodel.dart';
import 'package:tic_tac_toe/ui/widgets/atoms/menu_button.dart';
import 'package:tic_tac_toe/utils/colors.dart' as app_colors;

class MainMenuView extends StatelessWidget {
  const MainMenuView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _media = MediaQuery.of(context);

    return ViewModelBuilder.reactive(
      viewModelBuilder: () => MainMenuViewModel(),
      builder: (context, MainMenuViewModel model, child) => Scaffold(
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
    );
  }
}

Widget _portraitUpView(MainMenuViewModel model) {
  return Center(
    child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: Image(
              image: AssetImage('assets/images/tic-tac-toe.png'),
              width: 200,
            ),
          ),
          MenuButton(
            text: 'Nuevo Juego',
            onPressed: () => model.navigateToModeSelector(),
          ),
          MenuButton(
            text: 'Seleccionar dificultad',
            onPressed: () => model.selectDifficulty(),
          ),
          MenuButton(
            text: 'Salir',
            onPressed: () => model.closeApp(),
          )
        ]),
  );
}

Widget _portraitDownView(MainMenuViewModel model) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: <Widget>[
      const Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.0),
        child: Image(
          image: AssetImage('assets/images/tic-tac-toe.png'),
          width: 200,
        ),
      ),
      Expanded(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            MenuButton(
              text: 'Nuevo Juego',
              onPressed: () => model.navigateToModeSelector(),
            ),
            MenuButton(
              text: 'Seleccionar dificultad',
              onPressed: () => model.selectDifficulty(),
            ),
            MenuButton(
              text: 'Salir',
              onPressed: () => model.closeApp(),
            )
          ],
        ),
      ),
    ],
  );
}
