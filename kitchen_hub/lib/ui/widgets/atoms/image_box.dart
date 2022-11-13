import 'package:flutter/cupertino.dart';
import 'package:kitchen_hub/utils/colors.dart' as app_colors;

class ImageBox extends StatelessWidget {
  final void Function() onTap;
  final String imagePath;

  const ImageBox({super.key, required this.onTap, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.of(context);

    return Padding(
        padding: const EdgeInsets.symmetric(vertical: 6.0, horizontal: 6.0),
        child: GestureDetector(
            onTap: onTap,
            child: Container(
                width: media.size.width * 0.15,
                height: media.size.height * 0.15,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10)),
                  border: Border.all(color: app_colors.grey),
                  color: app_colors.grey,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: Image.asset(
                    imagePath,
                    height: 50,
                    width: 50,
                    fit: BoxFit.scaleDown,
                  ),
                ))));
  }
}
