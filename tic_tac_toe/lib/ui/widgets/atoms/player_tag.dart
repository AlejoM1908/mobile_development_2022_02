import 'dart:math';

import 'package:flutter/material.dart';
import 'package:tic_tac_toe/utils/colors.dart' as app_colors;

class PlayerTag extends StatefulWidget {
  final String? name;
  final Color color;
  const PlayerTag({super.key, this.name, this.color = app_colors.primary});

  @override
  State<PlayerTag> createState() => _PlayerTagState();
}

class _PlayerTagState extends State<PlayerTag> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Container(
            width: 120,
            height: 120,
            decoration: BoxDecoration(
              color: app_colors.white,
              shape: BoxShape.circle,
              border: Border.all(
                color: widget.name ==null ? app_colors.white : widget.color,
                width: 5,
              ),
            ),
            child: Center(
              child: widget.name == null
                  ? null
                  : Image(
                      image: AssetImage(
                        'assets/images/player_icon_${Random().nextInt(7) + 1}.png',
                      ),
                      width: 120,
                      height: 120,
                    ),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            widget.name == null ? 'Esperando un jugador...' : widget.name!,
            style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: app_colors.white),
          ),
        ],
      ),
    );
  }
}
