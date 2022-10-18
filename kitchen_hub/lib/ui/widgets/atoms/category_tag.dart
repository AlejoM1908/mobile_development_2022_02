import 'package:flutter/material.dart';
import 'package:kitchen_hub/utils/colors.dart' as app_colors;

class CategoryTag extends StatelessWidget {
  final String tag;
  final int count;

  const CategoryTag({super.key, required this.tag, required this.count});

  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.of(context);

    return Container(
      height: 20,
      width: media.size.width * 0.9,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            tag,
            style: const TextStyle(
              color: app_colors.text,
              fontSize: 12,
            ),
          ),
          Text(
            '  ($count)  ',
            style: const TextStyle(
              color: app_colors.text,
              fontSize: 12,
            ),
          ),
          Expanded(child: Text('.' * 100, maxLines: 1)),
        ],
      ),
    );
  }
}
