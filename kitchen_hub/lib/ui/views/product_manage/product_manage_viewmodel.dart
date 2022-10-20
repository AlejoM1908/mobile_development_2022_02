import 'package:kitchen_hub/app/app.locator.dart';
import 'package:kitchen_hub/models/db_models.dart';
import 'package:kitchen_hub/services/App/product_service.dart';
import 'package:kitchen_hub/services/SQLite/sqlite_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class ProductManageViewModel extends BaseViewModel {
  final _productService = locator<ProductService>();
  final _sqliteService = locator<SQLiteService>();
  final _navigationService = locator<NavigationService>();

  List<Storage> storages = [];
  Storage selectedStorage = Storage(id: 0, name: 'Seleccione una ubicación');
  int quantity = 0;

  void changeQuantity(int newQuantity) {
    quantity = newQuantity;
    notifyListeners();
  }

  void changeStorage(Storage? storage) {
    selectedStorage = storage!;
    notifyListeners();
  }
}
