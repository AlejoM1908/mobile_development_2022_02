import 'package:flutter/material.dart';

import 'package:kitchen_hub/utils/colors.dart' as app_colors;

class ProductName extends StatelessWidget {
  final String icon;
  final String category;
  final String name;

  const ProductName({super.key, required this.icon, required this.category, required this.name});

  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.of(context);
    const iamgeRelation = 0.15;

    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Container(
            padding: const EdgeInsets.all(4.0),
            decoration: BoxDecoration(
              color: app_colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
            width: media.size.width * 0.2,
            height: media.size.width * 0.2,
            child: Image.asset(icon, fit: BoxFit.cover),
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(category,
                style: const TextStyle(
                    color: app_colors.text,
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold)),
            const SizedBox(height: 5.0),
            Text(name,
                style: const TextStyle(color: app_colors.text, fontSize: 20.0)),
          ],
        ),
      ],
    );
  }
}
