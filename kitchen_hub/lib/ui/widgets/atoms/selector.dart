import 'package:flutter/material.dart';
import 'package:kitchen_hub/utils/colors.dart' as app_colors;

class Selector extends StatelessWidget {
  final void Function()? onTap;
  final String title;
  final String icon;

  const Selector(
      {super.key, this.onTap, required this.title, required this.icon});

  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.of(context);

    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          constraints: BoxConstraints(
            maxWidth: media.size.width * 0.2,
            maxHeight: media.size.height * 0.4,
          ),
          decoration: BoxDecoration(
            color: app_colors.white,
            borderRadius: BorderRadius.circular(10.0),
          ),
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(icon, width: 50, height: 50, fit: BoxFit.cover),
              const SizedBox(height: 10),
              Flexible(
                  fit: FlexFit.loose,
                  child: Text(title,
                      style: const TextStyle(fontSize: 14.0),
                      textAlign: TextAlign.center)),
            ],
          ),
        ),
      ),
    );
  }
}
