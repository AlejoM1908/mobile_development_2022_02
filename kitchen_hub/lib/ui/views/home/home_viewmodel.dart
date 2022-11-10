// Package imports:
import 'package:kitchen_hub/app/app.locator.dart';
import 'package:kitchen_hub/app/app.router.dart';
import 'package:kitchen_hub/models/db_models.dart';
import 'package:kitchen_hub/services/App/data_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class HomeViewModel extends ReactiveViewModel {
  final _dataService = locator<DataService>();
  final _navigationService = locator<NavigationService>();

  bool _centerClicked = false;
  int _currentIndex = 0;
  int _categoryIndex = -1;
  int quantity = 0;
  String title = 'Kitchen Hub';

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

    if (!_centerClicked){
      if (_currentIndex == 0) _categoryIndex = -1;
    }
    notifyListeners();
  }

  void changeIndex(int index) {
    _currentIndex = index;

    if (_centerClicked) toggleCenterClicked();
    notifyListeners();
  }

  void categoryTapped(int index) {
    _categoryIndex = index;
    notifyListeners();
  }

  void productTapped(int index) {
    Record product = Record(
      id: -1,
      added: DateTime.now(),
      categoryName: categories[_categoryIndex].name,
      productName: products[_categoryIndex][index].name,
      product: products[_categoryIndex][index].id,
      amount: 0,
      storageName: 'Seleccione una ubicación',
      storage: -1,
      icon: products[_categoryIndex][index].icon,
      expiracy: DateTime.now(),
      description: products[_categoryIndex][index].description,
    );

    if (_centerClicked) toggleCenterClicked();
    _navigationService.navigateTo(Routes.productManageView,
        arguments: ProductManageViewArguments(product: product));
  }

  bool noProducts() {
    for (var product in records) {
      if (product.isNotEmpty) {
        return false;
      }
    }

    return true;
  }

  @override
  List<ReactiveServiceMixin> get reactiveServices => [_dataService];
}
