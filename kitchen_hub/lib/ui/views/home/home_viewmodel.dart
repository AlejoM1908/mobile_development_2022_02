// Package imports:
import 'package:kitchen_hub/app/app.locator.dart';
import 'package:kitchen_hub/app/app.router.dart';
import 'package:kitchen_hub/models/db_models.dart';
import 'package:kitchen_hub/services/App/data_service.dart';
import 'package:kitchen_hub/services/App/product_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class HomeViewModel extends BaseViewModel {
  final _productService = locator<ProductService>();
  final _dataService = locator<DataService>();
  final _navigationService = locator<NavigationService>();
  
  bool _centerClicked = false;
  int _currentIndex = 0;
  int _categoryIndex = -1;
  int quantity = 0;

  String title = 'Kitchen Hub';

  Storage selectedStorage = Storage(id: 0, name: 'Seleccione una ubicación');

  // Getters
  bool get centerClicked => _centerClicked;
  int get currentIndex => _currentIndex;
  int get categoryIndex => _categoryIndex;
  List<Category> get categories => _dataService.categories;
  List<Storage> get storages => _dataService.storages;
  List<List<Record>> get records => _dataService.records;
  List<List<Product>> get products => _dataService.products;

  void toggleCenterClicked() {
    _centerClicked = !_centerClicked;
    notifyListeners();
  }

  void changeIndex(int index) {
    _currentIndex = index;
    notifyListeners();
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
      categoryName: categories[_categoryIndex].name,
      productName: products[_categoryIndex][index].name,
      amount: 0,
      storageName: 'Seleccione una ubicación',
      icon: products[_categoryIndex][index].icon,
      expiracy: DateTime.now(),
      description: products[_categoryIndex][index].description,
    );

    _navigationService.navigateTo(Routes.productManageView);
  }

  bool noProducts() {
    for (var product in records) {
      if (product.isNotEmpty) {
        return false;
      }
    }

    return true;
  }
}
