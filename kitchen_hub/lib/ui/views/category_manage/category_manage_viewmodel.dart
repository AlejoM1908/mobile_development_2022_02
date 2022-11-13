import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:kitchen_hub/app/app.locator.dart';
import 'package:kitchen_hub/models/db_models.dart';
import 'package:kitchen_hub/models/dialog_type.dart';
import 'package:kitchen_hub/services/App/data_service.dart';
import 'package:kitchen_hub/services/SQLite/sqlite_service.dart';
import 'package:stacked_services/stacked_services.dart';

class CategoryManageViewModel extends BaseViewModel {
  final _dataService = locator<DataService>();
  final _dialogService = locator<DialogService>();
  final _sqlService = locator<SQLiteService>();
  final _navigationService = locator<NavigationService>();
  TextEditingController nameController = TextEditingController();

  late Category category;

  CategoryManageViewModel({required this.category});

  void save_category() async {
    await _sqlService.addCategory(category);
    _dataService.addCategory(category);
    _navigationService.back();
  }
}
