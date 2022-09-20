// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_svg/svg.dart';

// Project imports:
import '../../../utils/colors.dart' as app_colors;

class GameGrid extends StatefulWidget {
  /// Widget that represents the game grid
  final Function onTileTap;
  final List charactersList;

  const GameGrid(
      {Key? key, required this.onTileTap, required this.charactersList})
      : super(key: key);

  @override
  State<GameGrid> createState() => _GameGridState();
}

class _GameGridState extends State<GameGrid> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: GridView.builder(
        physics: const NeverScrollableScrollPhysics(),
        itemCount: 9,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          childAspectRatio: (0.5/0.5),
          crossAxisCount: 3,
        ),
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: () => widget.onTileTap(index),
            child: Container(
              decoration: BoxDecoration(
                  border: Border.all(color: app_colors.backgroundVariant)),
              child: Center(
                  child: getImage(widget.charactersList[index])),
            ),
          );
        },
      ),
    );
  }

  Widget getImage(String character) {
    if (character == '') {
      return Container();
    }

    return SvgPicture.asset(
      character == 'o'
          ? 'assets/images/circumference.svg'
          : 'assets/images/cross.svg',
      color: character == 'o' ? app_colors.primary : app_colors.secondary,
      width: 70.0,
    );
  }
}
