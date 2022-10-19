import 'package:flutter/material.dart';
import 'package:kitchen_hub/app/app.locator.dart';
import 'package:kitchen_hub/models/db_models.dart';
import 'package:kitchen_hub/services/App/product_service.dart';
import 'package:kitchen_hub/services/SQLite/sqlite_service.dart';
import 'package:stacked/stacked.dart';

class ProductRecordViewmodel extends BaseViewModel{
  final _productService = locator<ProductService>();
  final _sqlService = locator<SQLiteService>();
  final _descriptionController = TextEditingController();

  Record? get product => _productService.product;
  List<Storage> get storages => _productService.storages!;
  Storage get currentStorage => _productService.currentStorage!;

  // Getters
  TextEditingController get descriptionController => _descriptionController;

  void setProduct(Record product) {
    _productService.product = product;
    _descriptionController.text = product.description;
    notifyListeners();
  }

  void getStorages() async {
    _productService.storages = [Storage(id: -1, name: 'Indefinido')];
    _productService.storages?.addAll(await _sqlService.getStorages());
    _productService.currentStorage = _productService.storages![0];
    notifyListeners();
  }

  void changeStorage(Storage? storage) {
    _productService.currentStorage = storage;
    notifyListeners();
  }

  void changeAmount(int amount) {
    if (_productService.quantity! >= 0) _productService.quantity = amount;
    notifyListeners();
  }
}
