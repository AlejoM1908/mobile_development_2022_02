// Package imports:
import 'package:kitchen_hub/app/app.locator.dart';
import 'package:kitchen_hub/models/db_models.dart';
import 'package:kitchen_hub/services/SQLite/sqlite_service.dart';
import 'package:stacked/stacked.dart';

class HomeViewModel extends BaseViewModel {
  final _sqliteService = locator<SQLiteService>();
  
  bool _centerClicked = false;
  int _currentIndex = 0;
  List<Category> _categories = [];
  List<List<Record>> _products = [];

  // Getters
  bool get centerClicked => _centerClicked;
  int get currentIndex => _currentIndex;
  List<Category> get categories => _categories;
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
    _categories = await _sqliteService.getCategories();
    _products = [];

    for (var category in _categories) {
      _products.add(await _sqliteService.getCompleteProductRecords(category.id));
    }

    return true;
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
