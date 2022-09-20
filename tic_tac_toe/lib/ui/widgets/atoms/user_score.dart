// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import '../../../utils/colors.dart' as app_colors;

class UserScore extends StatefulWidget {
  /// Widget that represents the user score
  final String userName;
  final int userScore;

  const UserScore({Key? key, this.userName='Undefined Player', this.userScore=0}) : super(key: key);

  @override
  State<UserScore> createState() => _UserScoreState();
}

class _UserScoreState extends State<UserScore> {
  @override
  Widget build(BuildContext context) {
    final _media = MediaQuery.of(context);

    return _media.orientation == Orientation.portrait
        ? _portraitUpView()
        : _portraitDownView();
  }

  Widget _portraitUpView() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 16.0),
      child: Column(
        children: [
          Text(
            widget.userName,
            style: const TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.w800,
              color: app_colors.white,
            ),
          ),
          const SizedBox(height: 20.0),
          Text(
            widget.userScore.toString(),
            style: const TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.w800,
              color: app_colors.white,
            ),
          ),
        ],
      ),
    );
  }

  Widget _portraitDownView() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            widget.userName,
            style: const TextStyle(
              fontSize: 22.0,
              fontWeight: FontWeight.w800,
              color: app_colors.white,
            ),
          ),
          const SizedBox(width: 20.0),
          Text(
            widget.userScore.toString(),
            style: const TextStyle(
              fontSize: 25.0,
              fontWeight: FontWeight.w800,
              color: app_colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
