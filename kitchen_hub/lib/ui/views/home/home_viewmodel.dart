// Package imports:
import 'package:kitchen_hub/app/app.locator.dart';
import 'package:kitchen_hub/app/app.router.dart';
import 'package:kitchen_hub/models/db_models.dart';
import 'package:kitchen_hub/services/App/product_service.dart';
import 'package:kitchen_hub/services/SQLite/sqlite_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class HomeViewModel extends BaseViewModel {
  final _sqliteService = locator<SQLiteService>();
  final _productService = locator<ProductService>();
  final _navigationService = locator<NavigationService>();
  
  bool _centerClicked = false;
  int _currentIndex = 0;
  int _categoryIndex = -1;
  int quantity = 0;
  List<Category> _categories = [];
  List<Storage> _storages = [];
  List<List<Record>> _records = [];
  List<List<Product>> _products = [];

  String title = 'Kitchen Hub';

  Storage selectedStorage = Storage(id: 0, name: 'Seleccione una ubicación');

  // Getters
  bool get centerClicked => _centerClicked;
  int get currentIndex => _currentIndex;
  int get categoryIndex => _categoryIndex;
  List<Category> get categories => _categories;
  List<Storage> get storages => _storages;
  List<List<Record>> get records => _records;
  List<List<Product>> get products => _products;

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
    _records = [];
    _products = [];

    for (var category in _categories) {
      _records.add(await _sqliteService.getCompleteProductRecords(category.id));
    }

    for (var category in _categories) {
      _products.add(await _sqliteService.getProductByCategory(category.id));
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

  void categoryTapped(int index) {
    _categoryIndex = index;
    notifyListeners();
  }

  void productTapped(int index) {
    _productService.product = Record(
      id: -1,
      added: DateTime.now(),
      categoryName: _categories[_categoryIndex].name,
      productName: _products[_categoryIndex][index].name,
      amount: 0,
      storageName: 'Seleccione una ubicación',
      icon: _products[_categoryIndex][index].icon,
      expiracy: DateTime.now(),
      description: _products[_categoryIndex][index].description,
    );

    _navigationService.navigateTo(Routes.productManageView);
  }

  bool noProducts() {
    for (var product in _records) {
      if (product.isNotEmpty) {
        return false;
      }
    }

    return true;
  }
}
