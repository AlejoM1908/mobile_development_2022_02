import 'package:kitchen_hub/app/app.locator.dart';
import 'package:kitchen_hub/models/db_models.dart';
import 'package:kitchen_hub/models/dialog_type.dart';
import 'package:kitchen_hub/services/App/data_service.dart';
import 'package:kitchen_hub/services/SQLite/sqlite_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class RecordManagerViewModel extends BaseViewModel {
  final _dataService = locator<DataService>();
  final _dialogService = locator<DialogService>();
  final _sqlService = locator<SQLiteService>();
  final _navigationService = locator<NavigationService>();

  late Storage selectedStorage;
  late Record product;
  late DateTime added;
  late DateTime expiracy;
  int quantity = 0;

  RecordManagerViewModel({required this.product}) {
    quantity = product.amount;
    if (product.product == -1) {
      selectedStorage = storages[0];
    } else {
      selectedStorage = storages[product.storage+1];
    }
    added = product.added;
    expiracy = product.expiracy;
  }

  // Getters
  List<Storage> get storages => _dataService.storages;

  void changeQuantity(int newQuantity) {
    quantity = newQuantity;
    notifyListeners();
  }

  void changeStorage(Storage? storage) {
    selectedStorage = storage!;
    notifyListeners();
  }

  void changeAdded(DateTime date) {
    added = date;
    notifyListeners();
  }

  void changeExpiracy(DateTime date) {
    expiracy = date;
    notifyListeners();
  }

  void showError(String error_message) {
    _dialogService.showCustomDialog(
        variant: DialogType.singleMessage,
        title: 'Error en datos',
        description: error_message,
        mainButtonTitle: 'Aceptar');
  }

  void _updateDataService() async {
    List<List<Record>> records = [];

    for (var category in _dataService.categories.sublist(1)) {
      records.add(await _sqlService.getCompleteProductRecords(category.id));
    }

    _dataService.setRecords(records);
    notifyListeners();
    _navigationService.popRepeated(1);
  }

  void saveProduct() async {
    await _sqlService.addSavings(Savings(
                  id: -1,
                  storage: selectedStorage.id,
                  product: product.product,
                  amount: quantity,
                  added: added,
                  expiracy: expiracy));

    _updateDataService();
  }

  void updateProduct() async {
    await _sqlService.updateSavings(Savings(
      id: product.id,
      storage: selectedStorage.id,
      product: product.product,
      amount: quantity,
      added: added,
      expiracy: expiracy
    ));
    
    _updateDataService();
  }
  
  void deleteProduct() async {
    await _sqlService.deleteSavings(product.id);

    _updateDataService();
  }

  void mainButton() async {
    String message = '';

    if (selectedStorage.id == -1) {
      message = 'No seleccionó un lugar de almacenamiento';
    } else if (quantity <= 0) {
      message = 'Ingresó una cantidad erronea de producto';
    } else if (expiracy.difference(added).isNegative) {
      message = 'La fecha de expiración es menor a la de ingreso';
    }

    if (message != '') {
      showError(message);
      return;
    } 

    // Check if the expiracy and save dates are coherent
    if (expiracy.difference(added) <= const Duration(days: 3)) {
      await _dialogService
          .showConfirmationDialog(
              title: 'Solicitud de concentimiento',
              description:
                  'Las fechas de agregado y expiración son muy cercanas, ¿Desea ingresarlas igualmente?',
              cancelTitle: 'No',
              confirmationTitle: 'Sí')
          .then((response) => response!.confirmed
              ? product.id == -1 ? saveProduct() : updateProduct()
              : null);
      return;
    }

    product.id == -1 ? saveProduct() : updateProduct();
  }
}
