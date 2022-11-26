import 'package:kitchen_hub/models/db_models.dart';
import 'package:stacked/stacked.dart';

class DataService with ReactiveServiceMixin{
  final ReactiveValue<List<Category>> _categories = ReactiveValue([]);
  final ReactiveValue<List<Storage>> _storages = ReactiveValue([]);
  final ReactiveValue<List<List<Record>>> _records = ReactiveValue([]);
  final ReactiveValue<List<List<Product>>> _products = ReactiveValue([]);

  DataService() {
    listenToReactiveValues([_categories, _storages, _records, _products]);
  }

  // Getters
  List<Category> get categories => _categories.value;
  List<Storage> get storages => _storages.value;
  List<Product> get productsList => _products.value.expand((element) => element).toList();
  List<List<Record>> get records => _records.value;
  List<List<Product>> get products => _products.value;

  // Setters
  void setCategories(List<Category> categories)  => _categories.value = categories;
  void setStogares(List<Storage> storages) => _storages.value = storages;
  void setRecords(List<List<Record>> records) => _records.value = records;
  void setProducts(List<List<Product>> products) => _products.value = products;

  void addCategory(Category category) => _categories.value.add(category);
  void addStorage(Storage storage) => _storages.value.add(storage);
  void addRecord(int category, Record record) => _records.value[category].add(record);
  void addProduct(int category, Product product) => _products.value[category].add(product);

  void addRecordsList(List<Record> records) => _records.value.add(records);
  void addProductsList(List<Product> products) => _products.value.add(products);

  void addEmptyRecordsList() => _records.value.add([]);
  void addEmptyProductsList() => _products.value.add([]);
}
