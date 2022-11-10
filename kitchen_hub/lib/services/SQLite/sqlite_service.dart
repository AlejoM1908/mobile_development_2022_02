// Package imports:
import 'package:sqflite/sqflite.dart';
import 'package:sqflite_migration_service/sqflite_migration_service.dart';

// Project imports:
import 'package:kitchen_hub/app/app.locator.dart';
import 'package:kitchen_hub/models/db_models.dart';
import 'package:stacked/stacked.dart';

const String DB_NAME = 'database.sqlite';

class SQLiteService with ReactiveServiceMixin {
  final _migrationService = locator<DatabaseMigrationService>();
  Database? _database;

  Future initialise() async {
    _database = await openDatabase(DB_NAME, version: 1);

    await _migrationService.runMigration(_database,
        migrationFiles: [
          '1_first_schema.sql',
          '2_adding_values.sql',
        ],
        verbose: true);
  }

  Future<List<Storage>> getStorages() async {
    final List<Map<String, dynamic>> query = await _database!.query('Storage');

    return query.map((storage) => Storage.fromMap(storage)).toList();
  }

  Future<List<Category>> getCategories() async {
    final List<Map<String, dynamic>> query = await _database!.query('Category');

    return query.map((category) => Category.fromMap(category)).toList();
  }

  Future<List<Product>> getProducts() async {
    final List<Map<String, dynamic>> query = await _database!.query('Product');

    return query.map((product) => Product.fromMap(product)).toList();
  }

  Future<List<Savings>> getSavings() async {
    final List<Map<String, dynamic>> query = await _database!.query('Savings');

    return query.map((savings) => Savings.fromMap(savings)).toList();
  }

  Future<List<Savings>> getSavingsByStorage(int storageId) async {
    final List<Map<String, dynamic>> query = await _database!
        .query('Savings', where: 'st_fk = ?', whereArgs: [storageId]);

    return query.map((savings) => Savings.fromMap(savings)).toList();
  }

  Future<List<Savings>> getSavingsByProduct(int productId) async {
    final List<Map<String, dynamic>> query = await _database!
        .query('Savings', where: 'pr_fk = ?', whereArgs: [productId]);

    return query.map((savings) => Savings.fromMap(savings)).toList();
  }

  Future<List<Savings>> getSavingsByCategory(int categoryId) async {
    final List<Map<String, dynamic>> query = await _database!.query('Savings',
        where: 'pr_fk IN (SELECT id FROM Product WHERE ct_fk = ?)',
        whereArgs: [categoryId]);

    return query.map((savings) => Savings.fromMap(savings)).toList();
  }

  Future<List<Savings>> getSavingsByDate(DateTime date) async {
    final List<Map<String, dynamic>> query = await _database!.query('Savings',
        where: 'added = ?', whereArgs: [date.toIso8601String()]);

    return query.map((savings) => Savings.fromMap(savings)).toList();
  }

  Future<List<Savings>> getSavingsByexpiracy(DateTime date) async {
    final List<Map<String, dynamic>> query = await _database!.query('Savings',
        where: 'expiracy = ?', whereArgs: [date.toIso8601String()]);

    return query.map((savings) => Savings.fromMap(savings)).toList();
  }

  Future<List<Savings>> getSavingsByDateRange(
      DateTime start, DateTime end) async {
    final List<Map<String, dynamic>> query = await _database!.query('Savings',
        where: 'added BETWEEN ? AND ?',
        whereArgs: [start.toIso8601String(), end.toIso8601String()]);

    return query.map((savings) => Savings.fromMap(savings)).toList();
  }

  Future<List<Savings>> getSavingsByexpiracyRange(
      DateTime start, DateTime end) async {
    final List<Map<String, dynamic>> query = await _database!.query('Savings',
        where: 'expiracy BETWEEN ? AND ?',
        whereArgs: [start.toIso8601String(), end.toIso8601String()]);

    return query.map((savings) => Savings.fromMap(savings)).toList();
  }

  Future<List<Product>> getProductByCategory(int categoryId) async {
    final List<Map<String, dynamic>> query = await _database!
        .query('Product', where: 'ct_fk = ?', whereArgs: [categoryId]);

    return query.map((product) => Product.fromMap(product)).toList();
  }

  Future<List<Record>> getCompleteProductRecords(int categoryId) async {
    final List<Map<String, dynamic>> query = await _database!.rawQuery(
        'SELECT Savings.id, Storage.name AS `storageName`, Storage.id AS `storage`, Product.name AS `productName`, Product.id AS `product`, Category.name AS `categoryName`, Savings.amount, Product.icon, Savings.added, Savings.expiracy, Product.description FROM Savings INNER JOIN Product ON Savings.pr_fk = Product.id INNER JOIN Storage ON Savings.st_fk = Storage.id INNER JOIN Category ON Product.ct_fk = Category.id WHERE Product.ct_fk = ?',
        [categoryId]);

    return query.map((record) => Record.fromMap(record)).toList();
  }

  Future addStorage(Storage storage) async {
    try {
      await _database!.insert('Storage', storage.toJson());
      notifyListeners();
    } catch (e) {
      print(e);
    }
  }

  Future addProduct(Product product) async {
    try {
      await _database!.insert('Product', product.toJson());
      notifyListeners();
    } catch (e) {
      print(e);
    }
  }

  Future addCategory(Category category) async {
    try {
      await _database!.insert('Category', category.toJson());
      notifyListeners();
    } catch (e) {
      print(e);
    }
  }

  Future addSavings(Savings savings) async {
    try {
      await _database!.insert('Savings', savings.toJson());
      notifyListeners();
    } catch (e) {
      print(e);
    }
  }

  Future updateStorage(Storage storage) async {
    try {
      await _database!.update('Storage', storage.toJson(),
          where: 'id = ?', whereArgs: [storage.id]);
      notifyListeners();
    } catch (e) {
      print(e);
    }
  }

  Future updateProduct(Product product) async {
    try {
      await _database!.update('Product', product.toJson(),
          where: 'id = ?', whereArgs: [product.id]);
      notifyListeners();
    } catch (e) {
      print(e);
    }
  }

  Future updateCategory(Category category) async {
    try {
      await _database!.update('Category', category.toJson(),
          where: 'id = ?', whereArgs: [category.id]);
      notifyListeners();
    } catch (e) {
      print(e);
    }
  }

  Future updateSavings(Savings savings) async {
    try {
      await _database!.update('Savings', savings.toJson(),
          where: 'id = ?', whereArgs: [savings.id]);
      notifyListeners();
    } catch (e) {
      print(e);
    }
  }

  Future deleteStorage(int id) async {
    try {
      await _database!.delete('Storage', where: 'id = ?', whereArgs: [id]);
      notifyListeners();
    } catch (e) {
      print(e);
    }
  }

  Future deleteProduct(int id) async {
    try {
      await _database!.delete('Product', where: 'id = ?', whereArgs: [id]);
      notifyListeners();
    } catch (e) {
      print(e);
    }
  }

  Future deleteCategory(int id) async {
    try {
      await _database!.delete('Category', where: 'id = ?', whereArgs: [id]);
      notifyListeners();
    } catch (e) {
      print(e);
    }
  }

  Future deleteSavings(int id) async {
    try {
      await _database!.delete('Savings', where: 'id = ?', whereArgs: [id]);
      notifyListeners();
    } catch (e) {
      print(e);
    }
  }
}
