import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:tic_tac_toe/ui/views/join_room/join_room_viewmodel.dart';
import 'package:tic_tac_toe/ui/widgets/atoms/menu_button.dart';
import 'package:tic_tac_toe/utils/colors.dart' as app_colors;

class JoinRoomView extends StatelessWidget {
  const JoinRoomView({super.key});

  @override
  Widget build(BuildContext context) {
    final _media = MediaQuery.of(context);

    return ViewModelBuilder.reactive(
      builder: (context, JoinRoomViewModel model, child) => Scaffold(
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
      viewModelBuilder: () => JoinRoomViewModel(),
    );
  }

  Widget _portraitUpView(JoinRoomViewModel model) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30.0),
          child: Container(
            decoration: BoxDecoration(
              color: app_colors.backgroundVariant,
              borderRadius: BorderRadius.circular(5.0),
            ),
            child: TextField(
              controller: model.roomCodeController,
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
                labelText: 'Código de sala',
                labelStyle: TextStyle(color: app_colors.text),
              ),
            ),
          ),
        ),
        const SizedBox(height: 20.0),
        MenuButton(
          text: 'Buscar sala',
          onPressed: model.joinRoom,
        ),
      ],
    );
  }

  Widget _portraitDownView(JoinRoomViewModel model) {
    return Center();
  }
}
