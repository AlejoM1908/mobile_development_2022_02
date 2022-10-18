import 'package:flutter/material.dart';
import 'package:kitchen_hub/models/db_models.dart';
import 'package:kitchen_hub/utils/colors.dart' as app_colors;

class ProductTag extends StatelessWidget {
  final void Function() onTap;
  final Record product;
  final Color color;

  const ProductTag(
      {super.key,
      required this.onTap,
      required this.product,
      required this.color});

  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.of(context);

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2.0, horizontal: 6.0),
      child: GestureDetector(
        onTap: onTap,
        child: FittedBox(
          child: Container(
            height: 20,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: color),
              color: app_colors.white,
            ),
            child: Padding(
              padding: const EdgeInsets.all(2.0),
              child: Row(
                children: <Widget>[
                  Image.asset(
                    'assets/images/product_icon_${product.icon}.png',
                    height: 18,
                    width: 18,
                  ),
                  Text(
                    '  ${product.productName}  ',
                    style: const TextStyle(
                      color: app_colors.text,
                      fontSize: 12,
                    ),
                  ),
                ]
              ),
            )
          ),
        ),
      ),
    );
  }
}
