import 'package:flutter/material.dart';
import 'package:kitchen_hub/app/app.locator.dart';
import 'package:kitchen_hub/models/db_models.dart';
import 'package:kitchen_hub/models/dialog_type.dart';
import 'package:kitchen_hub/services/App/data_service.dart';
import 'package:kitchen_hub/services/SQLite/sqlite_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class SimpleManagerViewModel extends ReactiveViewModel {
  final _dialogService = locator<DialogService>();
  final _sqliteService = locator<SQLiteService>();
  final _dataService = locator<DataService>();
  final _navigationService = locator<NavigationService>();

  final titleController = TextEditingController();
  String? name;
  dynamic data;

  SimpleManagerViewModel({required this.data, this.name}) {
    titleController.text = name ?? '';
  }

  void mainButton() async {
    if (titleController.text.isEmpty) {
      await _dialogService.showDialog(
        title: 'Error',
        description: 'Please enter a name',
        dialogPlatform: DialogPlatform.Material,
        barrierDismissible: true,
      );
      return;
    }
    if (data is Storage) {
      var storage =
          Storage(id: data.id, icon: data.icon, name: titleController.text);
      
      if (data.id == -1) {
        await _sqliteService.addStorage(storage);
      } else {
        await _sqliteService.updateStorage(storage);
      }

      List<Storage> storages = [Storage(id: -1, icon: -1, name: 'Seleccione una ubicación')];
      storages.addAll(await _sqliteService.getStorages());
      _dataService.setStogares(storages);
    } else if (data is Category) {
      var category = Category(
          id: data.id, icon: data.icon, name: titleController.text);

      if (data.id == -1) {
        await _sqliteService.addCategory(category);
      } else {
        await _sqliteService.updateCategory(category);
      }

      List<Category> categories = [
        Category(id: -1, icon: -1, name: 'Seleccione una categoría')
      ];

      categories.addAll(await _sqliteService.getCategories());
      _dataService.setCategories(categories);
    }

    notifyListeners();
    _navigationService.popRepeated(1);
  }

  void deleteButton() async {
    if (data is Storage) {
      _sqliteService.deleteStorage(data.id);
      _sqliteService.deleteSavingsByStorage(data.id);

      List<Storage> storages = [Storage(id: -1, icon: -1, name: 'Seleccione una ubicación')];
      List<List<Record>> records = [];

      for (var category in _dataService.categories.sublist(1)) {
        records
            .add(await _sqliteService.getCompleteProductRecords(category.id));
      }

      storages.addAll(await _sqliteService.getStorages());

      _dataService.setStogares(storages);
      _dataService.setRecords(records);
    } else if (data is Category) {
      _sqliteService.deleteCategory(data.id);
      _sqliteService.deleteProductsAndSavingsByCategory(data.id);

      List<List<Product>> products = [];
      List<List<Record>> records = [];
      List<Category> categories = [
        Category(id: -1, icon: -1, name: 'Seleccione una categoría')
      ];

      for (var category in _dataService.categories.sublist(1)) {
        products.add(await _sqliteService.getProductByCategory(category.id));
      }

      for (var category in _dataService.categories.sublist(1)) {
        records
            .add(await _sqliteService.getCompleteProductRecords(category.id));
      }

      categories.addAll(await _sqliteService.getCategories());

      _dataService.setCategories(categories);
      _dataService.setProducts(products);
      _dataService.setRecords(records);
    } 

    notifyListeners();
    _navigationService.popRepeated(1);
  }

  void changeIcon() async {
    await _dialogService.showCustomDialog(
      variant: DialogType.iconChooser,
      data: {'iconPrefix': getType(), 'icon': data.icon.toString()},
    ).then((value) {
      if (value != null) {
        if (data is Storage) {
          data = Storage(
              id: data.id,
              icon: int.parse(
                  value.data.toString().split('_icon_')[1].split('.png')[0]),
              name: data.name);
        } else if (data is Category) {
          data = Category(
              id: data.id,
              icon: int.parse(
                  value.data.toString().split('_icon_')[1].split('.png')[0]),
              name: data.name);
        } 
      }
    });

    notifyListeners();
  }

  String getType() {
    if (data is Storage) {
      return 'storage';
    } else if (data is Category) {
      return 'category';
    }

    return 'unknown';
  }

  @override
  List<ReactiveServiceMixin> get reactiveServices => [_dataService];
}
