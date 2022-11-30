import 'package:flutter/material.dart';
import 'package:kitchen_hub/models/db_models.dart';
import 'package:kitchen_hub/utils/colors.dart' as app_colors;

class CategorySelector extends StatefulWidget {
  final String title;
  final List categories;
  final void Function(Category?)? onCategoryChanged;
  Category selectedCategory;

  CategorySelector(
      {super.key,
      required this.title,
      required this.categories,
      required this.onCategoryChanged,
      required this.selectedCategory});

  @override
  State<CategorySelector> createState() => _CategorySelectorState();
}

class _CategorySelectorState extends State<CategorySelector> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Row(
        children: <Widget>[
          Text(widget.title,
              style: const TextStyle(color: app_colors.text, fontSize: 16.0)),
          const Expanded(child: SizedBox(width: 10.0)),
          Container(
            decoration: BoxDecoration(
              color: app_colors.white,
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 2.0),
              child: DropdownButton<Category>(
                value: widget.selectedCategory,
                icon: const Icon(Icons.arrow_drop_down, color: app_colors.text),
                iconSize: 24,
                underline: Container(),
                style: const TextStyle(color: app_colors.text),
                onChanged: widget.onCategoryChanged,
                items: widget.categories.map((category) {
                  return DropdownMenuItem<Category>(
                    value: category,
                    child: Text(category.name),
                  );
                }).toList(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
