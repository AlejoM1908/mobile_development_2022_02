import 'package:flutter/material.dart';
import 'package:kitchen_hub/models/db_models.dart';
import 'package:kitchen_hub/ui/views/product_manager/product_manager_viewmodel.dart';
import 'package:kitchen_hub/ui/widgets/atoms/category_selector.dart';
import 'package:kitchen_hub/ui/widgets/atoms/icon_selector.dart';
import 'package:stacked/stacked.dart';
import 'package:kitchen_hub/utils/colors.dart' as app_colors;

class ProductManagerView extends StatelessWidget {
  final Product data;
  const ProductManagerView({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
      viewModelBuilder: () => ProductManagerViewModel(data: data, name: data.name),
      builder: (context, model, child) => Scaffold(
          appBar: AppBar(
            backgroundColor: app_colors.primary,
            title: const Text('Crear Nuevo Producto'),
            centerTitle: true,
          ),
          body: Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 20.0, horizontal: 15.0),
            child: Column(
              children: [
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      IconSelector(
                        iconTapped: model.changeIcon,
                        iconPrefix: 'product',
                        icon: model.data.icon.toString(),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10.0),
                          child: TextField(
                            controller: model.nameController,
                            style: const TextStyle(color: app_colors.primary),
                            cursorColor: app_colors.primary,
                            decoration: const InputDecoration(
                              enabledBorder: UnderlineInputBorder(
                                  borderSide:
                                      BorderSide(color: app_colors.primary)),
                              focusedBorder: UnderlineInputBorder(
                                  borderSide:
                                      BorderSide(color: app_colors.primary)),
                              labelStyle: TextStyle(color: app_colors.primary),
                              border: UnderlineInputBorder(),
                              labelText: 'Nombre',
                            ),
                          ),
                        ),
                      ),
                    ]),
                Padding(
                  padding: const EdgeInsets.only(top: 20.0),
                  child: CategorySelector(
                      title: 'Categoria:',
                      categories: model.categories,
                      onCategoryChanged: model.changeCategory,
                      selectedCategory: model.selectedCategory),
                ),
                Expanded(child: Container()),
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        decoration: const BoxDecoration(
                          color: app_colors.primary,
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        ),
                        child: TextButton(
                          onPressed: model.mainButton,
                          child: Text(
                            model.data.id == -1 ? 'Crear' : 'Actualizar',
                            style: const TextStyle(color: app_colors.white),
                          ),
                        ),
                      ),
                    ),
                    model.data.id != -1
                        ? Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: Container(
                              decoration: BoxDecoration(
                                  color: app_colors.red,
                                  borderRadius: BorderRadius.circular(10)),
                              child: IconButton(
                                  onPressed: model.deleteButton,
                                  icon: const Icon(Icons.delete_forever_rounded,
                                      size: 20)),
                            ),
                          )
                        : Container()
                  ],
                ),
              ],
            ),
          )),
    );
  }
}
