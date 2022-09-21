import 'package:flutter/material.dart';
import 'package:tic_tac_toe/utils/colors.dart' as app_colors;

class MenuButton extends StatelessWidget {
  /// Creates a button with a text and an action that expands to fill the available horizontal space.
  final String text;
  final Function onPressed;

  const MenuButton({super.key, required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 30.0),
      child: TextButton(
        onPressed: () => onPressed(),
        style: TextButton.styleFrom(
          backgroundColor: app_colors.backgroundVariant,
          minimumSize: const Size.fromHeight(50),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
        ),
        child: Text(
          text,
          style: const TextStyle(
            fontSize: 24.0,
            fontWeight: FontWeight.w800,
            color: app_colors.text,
          ),
        ),
      ),
    );
    ;
  }
}
