import 'package:flutter/material.dart';
import 'package:kitchen_hub/models/db_models.dart';
import 'package:kitchen_hub/ui/widgets/atoms/category_box.dart';
import 'package:kitchen_hub/ui/widgets/atoms/image_box.dart';
import 'package:stacked/stacked.dart';

import 'category_manage_viewmodel.dart';

class CategoryManageView extends StatelessWidget {
  final Category category;

  const CategoryManageView({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.of(context);

    return ViewModelBuilder.reactive(
      viewModelBuilder: () => CategoryManageViewModel(category: category),
      builder: (context, CategoryManageViewModel model, child) => Scaffold(
          appBar: AppBar(
            title: Text(model.category.id == -1
                ? 'Nueva Categoría'
                : 'Edición de Categoría'),
          ),
          body: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(children: [
                    ImageBox(
                        onTap: () {},
                        imagePath:
                            'assets/images/category_icon_${category.icon}.png'),
                    Expanded(
                      child: TextField(
                        controller: model.nameController,
                        decoration: const InputDecoration(
                          border: UnderlineInputBorder(),
                          labelText: 'Nombre de la Categoría',
                        ),
                      ),
                    ),
                  ]),
                ],
              ))),
    );
  }
}
