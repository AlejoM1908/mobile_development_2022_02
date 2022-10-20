import 'package:flutter/material.dart';
import 'package:kitchen_hub/models/db_models.dart';
import 'package:kitchen_hub/utils/colors.dart' as app_colors;

class CategoryBox extends StatelessWidget {
  final void Function() onTap;
  final Category category;

  const CategoryBox({super.key, required this.onTap, required this.category});

  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.of(context);

    return Padding(
        padding: const EdgeInsets.symmetric(vertical: 2.0, horizontal: 6.0),
        child: GestureDetector(
            onTap: onTap,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Container(
                    width: media.size.width * 0.2,
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
                        'assets/images/category_icon_${category.icon}.png',
                        height: 50,
                        width: 50,
                        fit: BoxFit.scaleDown,
                      ),
                    )),
                Container(
                  width: media.size.width * 0.2,
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(10),
                        bottomRight: Radius.circular(10)),
                    border: Border.all(color: app_colors.darkGrey),
                    color: app_colors.darkGrey,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: Flexible(
                      fit: FlexFit.loose,
                      child: Text(
                        category.name,
                        style: const TextStyle(
                          color: app_colors.white,
                          fontSize: 12,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                )
              ],
            )));
  }
}
