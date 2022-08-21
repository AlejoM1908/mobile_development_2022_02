import 'package:flutter/material.dart';

import '../../../utils/colors.dart' as app_colors;

class UserScore extends StatefulWidget {
  final String userName;
  final int userScore;

  const UserScore({Key? key, this.userName='Undefined Player', this.userScore=0}) : super(key: key);

  @override
  State<UserScore> createState() => _UserScoreState();
}

class _UserScoreState extends State<UserScore> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: [
          Text(
            widget.userName,
            style: const TextStyle(
              fontSize: 22.0,
              fontWeight: FontWeight.w800,
              color: app_colors.white,
            ),
          ),
          const SizedBox(height: 20.0),
          Text(widget.userScore.toString(),
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