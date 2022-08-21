import 'package:flutter/material.dart';
import '../../../utils/colors.dart' as app_colors;

class TurnMessage extends StatefulWidget {
  final bool turn; // false for player1, true for player2

  const TurnMessage({Key? key, required this.turn}) : super(key: key);

  @override
  State<TurnMessage> createState() => _TurnMessageState();
}

class _TurnMessageState extends State<TurnMessage> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Center(
        child: Text(
          widget.turn ? 'Turn of O' : 'Turn of X',
          style: const TextStyle(color: app_colors.text),
        ),
      ),
    );
  }
}