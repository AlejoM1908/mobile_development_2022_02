import 'package:company_directory/app/app.locator.dart';
import 'package:company_directory/app/app.router.dart';
import 'package:company_directory/models/company.dart';
import 'package:company_directory/models/company_type.dart';
import 'package:company_directory/services/details_service.dart';
import 'package:company_directory/services/sqlite_service.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class DetailsViewModel extends BaseViewModel {
  final _detailsService = locator<DetailsService>();
  final _sqliteService = locator<SQLiteService>();
  final _dialogService = locator<DialogService>();
  final _navigationService = locator<NavigationService>();

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
    isEditing = false;
    notifyListeners();
  }

  void edit() {
    isEditing = true;
    notifyListeners();
  }

  void delete() {
    _dialogService.showConfirmationDialog(
      title: 'Delete',
      description: 'Are you sure you want to delete this company?',
      confirmationTitle: 'Yes',
      cancelTitle: 'No',
    ).then((value) {
      if (value!.confirmed) {
        _sqliteService.deleteCompany(_detailsService.company!.id);
        _navigationService.clearStackAndShow(Routes.homeView);
      }
    });
  }
}
