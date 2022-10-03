import 'package:company_directory/models/company.dart';
import 'package:company_directory/models/company_type.dart';
import 'package:company_directory/ui/views/home/home_viewmodel.dart';
import 'package:company_directory/ui/widgets/atoms/company_card.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'package:company_directory/utils/colors.dart' as app_colors;

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
        viewModelBuilder: () => HomeViewModel(),
        builder: (context, HomeViewModel model, child) => Scaffold(
            appBar: AppBar(
              elevation: 1.0,
              centerTitle: true,
              backgroundColor: app_colors.background,
              title: Text(model.title),
            ),
            body: ListView.builder(
              itemCount: model.companies.length,
              itemBuilder: (context, index) {
                final Company company = model.companies[index];
                return CompanyCard(company: company, onTap: () {
                  model.navigateToDetails(company);
                });
              },
            ),
            floatingActionButton: FloatingActionButton(
              onPressed: model.createCompany,
              backgroundColor: app_colors.primary,
              child: const Icon(Icons.add),
            )));
  }
}
