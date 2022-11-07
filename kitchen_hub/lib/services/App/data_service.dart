import 'package:kitchen_hub/models/db_models.dart';

class DataService{
  List<Category> _categories = [];
  List<Storage> _storages = [];
  List<List<Record>> _records = [];
  List<List<Product>> _products = [];

  // Getters
  List<Category> get categories => _categories;
  List<Storage> get storages => _storages;
  List<List<Record>> get records => _records;
  List<List<Product>> get products => _products;

  // Setters
  void setCategories(List<Category> categories)  => _categories = categories;
  void setStogares(List<Storage> storages) => _storages = storages;
  void setRecords(List<List<Record>> records) => _records = records;
  void setProducts(List<List<Product>> products) => _products = products;

  void addCategory(Category category) => _categories.add(category);
  void addStorage(Storage storage) => _storages.add(storage);
  void addRecord(int category, Record record) => _records[category].add(record);
  void addProduct(int category, Product product) => _products[category].add(product);

  void addRecordsList(List<Record> records) => _records.add(records);
  void addProductsList(List<Product> products) => _products.add(products);

  void addEmptyRecordsList() => _records.add([]);
  void addEmptyProductsList() => _products.add([]);
}
