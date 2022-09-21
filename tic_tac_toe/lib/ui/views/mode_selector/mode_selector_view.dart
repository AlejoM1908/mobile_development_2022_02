import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:tic_tac_toe/ui/widgets/atoms/menu_button.dart';
import 'package:tic_tac_toe/ui/views/mode_selector/mode_selector.viewmodel.dart';
import 'package:tic_tac_toe/utils/colors.dart' as app_colors;

class ModeSelectorView extends StatelessWidget {
  const ModeSelectorView({super.key});

  @override
  Widget build(BuildContext context) {
    final _media = MediaQuery.of(context);
    return ViewModelBuilder.reactive(
      builder: (context, ModeSelectorViewModel model, child) => Scaffold(
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
      viewModelBuilder: () => ModeSelectorViewModel(),
    );
  }

  Widget _portraitUpView(ModeSelectorViewModel model) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          MenuButton(
            text: 'Juego Local',
            onPressed: () => model.navigateToLocalGame(),
          ),
          MenuButton(
            text: 'Juego Online',
            onPressed: () => model.navigateToOnlineGame(),
          ),
          MenuButton(
            text: 'Inteligencia Artificial',
            onPressed: () => model.navigateToAI(),
          ),
        ],
      ),
    );
  }

  Widget _portraitDownView(ModeSelectorViewModel model) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          MenuButton(
            text: 'Juego Local',
            onPressed: () => model.navigateToLocalGame(),
          ),
          MenuButton(
            text: 'Juego Online',
            onPressed: () => model.navigateToOnlineGame(),
          ),
          MenuButton(
            text: 'Inteligencia Artificial',
            onPressed: () => model.navigateToAI(),
          ),
        ],
      ),
    );
  }
}
