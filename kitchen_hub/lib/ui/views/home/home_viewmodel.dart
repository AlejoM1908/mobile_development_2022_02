// Package imports:
import 'package:kitchen_hub/app/app.locator.dart';
import 'package:kitchen_hub/models/db_models.dart';
import 'package:kitchen_hub/services/SQLite/sqlite_service.dart';
import 'package:stacked/stacked.dart';

class HomeViewModel extends BaseViewModel {
  final _sqliteService = locator<SQLiteService>();

  bool _centerClicked = false;
  int _currentIndex = 0;
  int quantity = 0;
  List<Category> _categories = [];
  List<Storage> _storages = [];
  List<List<Record>> _products = [];

  Storage selectedStorage = Storage(id: 0, name: 'Seleccione una ubicación');

  // Getters
  bool get centerClicked => _centerClicked;
  int get currentIndex => _currentIndex;
  List<Category> get categories => _categories;
  List<Storage> get storages => _storages;
  List<List<Record>> get products => _products;

  void toggleCenterClicked() {
    _centerClicked = !_centerClicked;
    notifyListeners();
  }

  void changeIndex(int index) {
    _currentIndex = index;
    notifyListeners();
  }

  Future<bool> getRecords() async {
    getStorages();
    _categories = await _sqliteService.getCategories();
    _products = [];

    for (var category in _categories) {
      _products
          .add(await _sqliteService.getCompleteProductRecords(category.id));
    }

    return true;
  }

  Future<bool> getCategories() async {
    _categories = [];
    _categories = await _sqliteService.getCategories();
    return true;
  }

  Future<List<Storage>> getStorages() async {
    _storages = [Storage(id: -1, name: 'Seleccione una ubicación')];
    _storages.addAll(await _sqliteService.getStorages());
    selectedStorage = _storages[0];
    return _storages;
  }

  void changeQuantity(int value) {
    if (value >= 0) quantity = value;
    notifyListeners();
  }

  void changeStorage(Storage? storage) {
    selectedStorage = storage!;
    print(selectedStorage);
    notifyListeners();
  }

  bool noProducts() {
    for (var product in _products) {
      if (product.isNotEmpty) {
        return false;
      }
    }

    return true;
  }
}
