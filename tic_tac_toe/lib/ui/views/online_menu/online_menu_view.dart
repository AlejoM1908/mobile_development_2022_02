import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:tic_tac_toe/ui/views/online_menu/online_menu_viewmodel.dart';
import 'package:tic_tac_toe/ui/widgets/atoms/menu_button.dart';
import 'package:tic_tac_toe/utils/colors.dart' as app_colors;

class OnlineMenuView extends StatelessWidget {
  const OnlineMenuView({super.key});

  @override
  Widget build(BuildContext context) {
    final _media = MediaQuery.of(context);
    return ViewModelBuilder.reactive(
      builder: (context, OnlineMenuViewModel model, child) => Scaffold(
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
      viewModelBuilder: () => OnlineMenuViewModel(),
    );
  }

  Widget _portraitUpView(OnlineMenuViewModel model) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          const SizedBox(height: 5.0),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30.0),
            child: Container(
              decoration: BoxDecoration(
                color: app_colors.backgroundVariant,
                borderRadius: BorderRadius.circular(5.0),
              ),
              child: TextField(
                controller: model.usernameController,
                style: const TextStyle(
                  color: app_colors.text,
                ),
                decoration: const InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: app_colors.white),
                  
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: app_colors.primary),
                  ),
                  filled: true,
                  labelText: 'Nombre de usuario',
                  labelStyle: TextStyle(color: app_colors.text),
                ),
              ),
            ),
          ),
          const SizedBox(height: 10.0),
          MenuButton(
            text: 'Crear sala',
            onPressed: () => model.navigateToRoom(),
          ),
          MenuButton(
            text: 'Unirse a sala',
            onPressed: () => model.navigateToJoinMatch(),
          ),
        ],
      ),
    );
  }

  Widget _portraitDownView(OnlineMenuViewModel model) {
    return SingleChildScrollView(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const SizedBox(height: 10.0),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30.0),
              child: Container(
                decoration: BoxDecoration(
                  color: app_colors.backgroundVariant,
                  borderRadius: BorderRadius.circular(5.0),
                ),
                child: TextField(
                  controller: model.usernameController,
                  style: const TextStyle(
                    color: app_colors.text,
                  ),
                  decoration: const InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: app_colors.white),
                    
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: app_colors.primary),
                    ),
                    filled: true,
                    labelText: 'Nombre de usuario',
                    labelStyle: TextStyle(color: app_colors.text),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10.0),
            MenuButton(
              text: 'Crear sala',
              onPressed: () => model.navigateToRoom(),
            ),
            MenuButton(
              text: 'Unirse a sala',
              onPressed: () => model.navigateToJoinMatch(),
            ),
          ],
        ),
      ),
    );
  }
}
