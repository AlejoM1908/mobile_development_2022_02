import 'package:flutter/material.dart';
import 'package:kitchen_hub/app/app.locator.dart';
import 'package:kitchen_hub/models/db_models.dart';
import 'package:kitchen_hub/models/dialog_type.dart';
import 'package:kitchen_hub/services/App/data_service.dart';
import 'package:kitchen_hub/services/SQLite/sqlite_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class ProductManagerViewModel extends ReactiveViewModel {
  final _dataService = locator<DataService>();
  final _dialogService = locator<DialogService>();
  final _sqliteService = locator<SQLiteService>();
  final _navigationService = locator<NavigationService>();

  final nameController = TextEditingController();
  late Category selectedCategory;
  String? name;
  Product data;

  ProductManagerViewModel({required this.data, this.name}) {
    nameController.text = name ?? '';

    if (data.category == -1) {
      selectedCategory = categories[0];
    } else {
      selectedCategory = categories[data.category + 1];
    }
  }

  List<Category> get categories => _dataService.categories;

  void changeCategory(Category? category) {
    selectedCategory = category!;
    notifyListeners();
  }

  void mainButton() async {
    if (nameController.text.isEmpty) {
      showError('El nombre del producto no puede estar vacío');
      return;
    }
    if (selectedCategory.id == -1) {
      showError('Debe seleccionar una categoría');
      return;
    }

    var product = Product(
        id: data.id,
        category: selectedCategory.id,
        name: nameController.text,
        icon: data.icon,
        description: data.description);

    if (data.id == -1) {
      await _sqliteService.addProduct(product);
    } else {
      await _sqliteService.updateProduct(product);
    }

    List<List<Product>> products = [];
    List<List<Record>> records = [];

    for (var category in _dataService.categories.sublist(1)) {
      products.add(await _sqliteService.getProductByCategory(category.id));
    }

    for (var category in _dataService.categories.sublist(1)) {
      records.add(await _sqliteService.getCompleteProductRecords(category.id));
    }

    _dataService.setProducts(products);
    _dataService.setRecords(records);

    notifyListeners();
    _navigationService.popRepeated(1);
  }

  void deleteButton() async {
    _sqliteService.deleteProduct(data.id);
    _sqliteService.deleteSavingsByProduct(data.id);

    List<List<Product>> products = [];
    List<List<Record>> records = [];

    for (var category in _dataService.categories.sublist(1)) {
      products.add(await _sqliteService.getProductByCategory(category.id));
    }

    for (var category in _dataService.categories.sublist(1)) {
      records.add(await _sqliteService.getCompleteProductRecords(category.id));
    }

    _dataService.setProducts(products);
    _dataService.setRecords(records);
    
    notifyListeners();
    _navigationService.popRepeated(1);
  }

  void changeIcon() async {
    await _dialogService.showCustomDialog(
      variant: DialogType.iconChooser,
      data: {'iconPrefix': 'product', 'icon': data.icon.toString()},
    ).then((value) {
      if (value != null) {
        data = Product(
            id: data.id,
            icon: int.parse(
                value.data.toString().split('_icon_')[1].split('.png')[0]),
            name: data.name,
            category: data.category,
            description: data.description);
      }
    });

    notifyListeners();
  }

  void showError(String errorMessage) {
    _dialogService.showCustomDialog(
        variant: DialogType.singleMessage,
        title: 'Error en datos',
        description: errorMessage,
        mainButtonTitle: 'Aceptar');
  }

  @override
  List<ReactiveServiceMixin> get reactiveServices => [_dataService];
}
