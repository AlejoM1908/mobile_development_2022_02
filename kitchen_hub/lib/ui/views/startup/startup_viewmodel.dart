// Dart imports:
import 'dart:async';

// Package imports:
import 'package:kitchen_hub/models/db_models.dart';
import 'package:kitchen_hub/services/App/data_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

// Project imports:
import 'package:kitchen_hub/app/app.locator.dart';
import 'package:kitchen_hub/app/app.router.dart';
import 'package:kitchen_hub/services/SQLite/sqlite_service.dart';

/// The class StartupViewModel is the ViewModel for the startup route
class StartupViewModel extends BaseViewModel {
  /// Service used to navigate to other routes
  final _navigationService = locator<NavigationService>();
  final _sqliteService = locator<SQLiteService>();
  final _dataService = locator<DataService>();

  final String _title = 'KITCHEN HUB';

  // Getters
  String get title => _title;

  StartupViewModel() {
    // Using a 3 seconds timer, then navigating to other route
    loadData();
    Timer(const Duration(seconds: 3), nextScreen);
  }

  /// The method _navigateToGame is used to clear the widget tree and navigate to the game route
  Future _navigateToHome() async {
    await _navigationService.clearStackAndShow(Routes.homeView);
  }

  /// The method _nextScreen is used to chose the next route to push into the widget tree
  void nextScreen() async {
    await _navigateToHome();
  }

  Future<bool> loadData() async {
    await _sqliteService.initialise();

    List<Storage> storages = [Storage(id: -1, icon: -1, name: 'Seleccione una ubicación')];
    List<List<Record>> records = [];
    List<List<Product>> products = [];

    List<Category> categories = await _sqliteService.getCategories();
    storages.addAll(await _sqliteService.getStorages());

    for (var category in categories) {
      records
          .add(await _sqliteService.getCompleteProductRecords(category.id));
    }

    for (var category in categories) {
      products.add(await _sqliteService.getProductByCategory(category.id));
    }

    _dataService.setCategories(categories);
    _dataService.setStogares(storages);
    _dataService.setRecords(records);
    _dataService.setProducts(products);

    return true;
  }
}
