import 'package:company_directory/app/app.locator.dart';
import 'package:company_directory/models/company.dart';
import 'package:company_directory/models/company_type.dart';
import 'package:company_directory/services/details_service.dart';
import 'package:company_directory/services/sqlite_service.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class DetailsViewModel extends BaseViewModel {
  final DetailsService _detailsService = locator<DetailsService>();
  final SQLiteService _sqliteService = locator<SQLiteService>();

  DetailsViewModel(){
    fillData();
  }

  final String title = 'Details';
  bool isEditing = false;
  TextEditingController nameController = TextEditingController();
  TextEditingController urlController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController productsController = TextEditingController();
  CompanyType? selector;

  void fillData(){
    var company = _detailsService.company;

    if (company == null){
      isEditing = true;
      return;
    }

    isEditing = false;
    nameController.text = company.name;
    urlController.text = company.url;
    emailController.text = company.email;
    phoneController.text = company.phone;
    selector = company.companyType;
  }

  void save(){
    Company company = Company(
      id: 1,
      name: nameController.text,
      url: urlController.text,
      email: emailController.text,
      phone: phoneController.text,
      products: productsController.text.split(','),
      type: selector,
    );

    _sqliteService.addCompany(company);
  }
}
