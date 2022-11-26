import 'package:flutter/cupertino.dart';
import 'package:kitchen_hub/utils/colors.dart' as app_colors;

class IconSelector extends StatelessWidget {
  final void Function() iconTapped;
  String iconPrefix;
  String icon;

  IconSelector({super.key, required this.iconTapped, required this.iconPrefix, required this.icon});

  String get imagePath => 'assets/images/${iconPrefix}_icon_$icon.png';

  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.of(context);

    return Container(
      padding: const EdgeInsets.all(4.0),
      decoration: BoxDecoration(
        color: app_colors.white,
        border: Border.all(color: app_colors.primary),
        borderRadius: BorderRadius.circular(10),
      ),
      width: media.size.width * 0.2,
      height: media.size.width * 0.2,
      child: GestureDetector(
        onTap: iconTapped,
        child: Image.asset(imagePath)
      ),
    );
  }
}
