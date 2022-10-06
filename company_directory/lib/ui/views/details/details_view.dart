import 'package:company_directory/models/company_type.dart';
import 'package:company_directory/ui/views/details/details_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:company_directory/utils/colors.dart' as app_colors;

class DetailsView extends StatelessWidget {
  const DetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
        builder: (context, DetailsViewModel model, child) => Scaffold(
              appBar: AppBar(
                elevation: 1.0,
                centerTitle: true,
                backgroundColor: app_colors.background,
                title: Text(model.title),
              ),
              floatingActionButton: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  model.isEditing
                      ? const SizedBox(height: 1.0)
                      : FloatingActionButton(
                        heroTag: 'delete',
                          onPressed: model.delete,
                          backgroundColor: app_colors.primary,
                          child: const Icon(Icons.delete_forever),
                        ),
                  const SizedBox(height: 8.0),
                  FloatingActionButton(
                    heroTag: 'edit-save',
                    onPressed: model.isEditing ? model.save : model.edit,
                    backgroundColor: app_colors.primary,
                    child: model.isEditing
                        ? const Icon(Icons.save, color: app_colors.white)
                        : const Icon(Icons.edit, color: app_colors.white),
                  ),
                ],
              ),
              body: SingleChildScrollView(
                child: Column(
                  children: [
                    customTextField(
                      labelText: 'Company Name',
                      isEnabled: model.isEditing,
                      controller: model.nameController,
                      model: model,
                    ),
                    customTextField(
                      labelText: 'Company URL',
                      isEnabled: model.isEditing,
                      controller: model.urlController,
                      model: model,
                    ),
                    customTextField(
                      labelText: 'Company Email',
                      isEnabled: model.isEditing,
                      controller: model.emailController,
                      model: model,
                    ),
                    customTextField(
                      labelText: 'Company Phone',
                      isEnabled: model.isEditing,
                      controller: model.phoneController,
                      model: model,
                    ),
                    customTextField(
                      labelText: 'Company Products',
                      isEnabled: model.isEditing,
                      controller: model.productsController,
                      model: model,
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(
                          horizontal: 8.0, vertical: 5.0),
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      decoration: BoxDecoration(
                        color: app_colors.primary,
                        border: Border.all(color: app_colors.white),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(4.0)),
                      ),
                      child: DropdownButton<CompanyType>(
                        value: model.selector,
                        isExpanded: true,
                        style: const TextStyle(color: app_colors.white),
                        onChanged: model.isEditing
                            ? (CompanyType? value) {
                                model.selector = value;
                                model.notifyListeners();
                              }
                            : null,
                        items: CompanyType.values
                            .map((e) => DropdownMenuItem<CompanyType>(
                                  value: e,
                                  child: Text(e.string),
                                ))
                            .toList(),
                      ),
                    )
                  ],
                ),
              ),
            ),
        viewModelBuilder: () => DetailsViewModel());
  }

  Widget customTextField(
      {required String labelText,
      required TextEditingController controller,
      required bool isEnabled,
      required DetailsViewModel model}) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 10.0),
      child: TextField(
        controller: controller,
        enabled: isEnabled,
        style: TextStyle(
            color: model.isEditing ? app_colors.white : app_colors.background),
        decoration: InputDecoration(
          labelText: labelText,
          fillColor: app_colors.primary,
          filled: true,
          labelStyle: const TextStyle(color: app_colors.white),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: app_colors.white),
          ),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: app_colors.secondary),
          ),
          disabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: app_colors.white),
          ),
        ),
      ),
    );
  }
}
