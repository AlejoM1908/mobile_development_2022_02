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
              body: SingleChildScrollView(
                child: Column(
                  children: [
                    customTextField(
                      labelText: 'Company Name',
                      isEnabled: model.isEditing,
                      controller: model.nameController,
                    ),
                    customTextField(
                      labelText: 'Company URL',
                      isEnabled: model.isEditing,
                      controller: model.urlController,
                    ),
                    customTextField(
                      labelText: 'Company Email',
                      isEnabled: model.isEditing,
                      controller: model.emailController,
                    ),
                    customTextField(
                      labelText: 'Company Phone',
                      isEnabled: model.isEditing,
                      controller: model.phoneController,
                    ),
                    customTextField(
                      labelText: 'Company Products',
                      isEnabled: model.isEditing,
                      controller: model.productsController,
                    ),
                    DropdownButton<CompanyType>(
                      value: model.selector,
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
                    TextButton(
                        onPressed: () => model.save(), child: const Text('Save'))
                  ],
                ),
              ),
            ),
        viewModelBuilder: () => DetailsViewModel());
  }

  Widget customTextField(
      {required String labelText,
      required TextEditingController controller,
      required bool isEnabled}) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 10.0),
      color: app_colors.primary,
      child: TextField(
        controller: controller,
        enabled: isEnabled,
        decoration: InputDecoration(
          labelText: labelText,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
        ),
      ),
    );
  }
}
