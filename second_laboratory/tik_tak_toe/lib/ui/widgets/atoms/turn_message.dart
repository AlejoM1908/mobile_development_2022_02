import 'package:flutter/material.dart';
import '../../../utils/colors.dart' as app_colors;

class TurnMessage extends StatefulWidget {
  final bool turn; // false for player1, true for player2
  final String firstName;
  final String secondName;

  const TurnMessage(
      {Key? key,
      required this.turn,
      required this.firstName,
      required this.secondName})
      : super(key: key);

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
          widget.turn ? 'Turn of ${widget.firstName}' : 'Turn of ${widget.secondName}',
          style: const TextStyle(color: app_colors.text),
        ),
      ),
    );
  }
}
