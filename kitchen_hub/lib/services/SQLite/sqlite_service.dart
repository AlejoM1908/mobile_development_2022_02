// Package imports:
import 'package:sqflite/sqflite.dart';
import 'package:sqflite_migration_service/sqflite_migration_service.dart';

// Project imports:
import 'package:kitchen_hub/app/app.locator.dart';
import 'package:kitchen_hub/models/db_models.dart';

const String DB_NAME = 'database.sqlite';

class SQLiteService {
  final _migrationService = locator<DatabaseMigrationService>();
  Database? _database;

  Future initialise() async {
    _database = await openDatabase(DB_NAME, version: 1);

    await _migrationService.runMigration(_database, migrationFiles: [
      '1_first_schema.sql',
    ], verbose: true);
  }

  Future<List<Storage>> getStorages() async {
    final List<Map<String, dynamic>> query = await _database!.query('Storage');

    return List.generate(query.length, (i) {
      return Storage(
        id: query[i]['id'],
        name: query[i]['name'],
      );
    });
  }

  Future<List<Category>> getCategories() async {
    final List<Map<String, dynamic>> query = await _database!.query('Category');

    return List.generate(query.length, (i) {
      return Category(
        id: query[i]['id'],
        icon: query[i]['icon'],
        name: query[i]['name'],
      );
    });
  }

  Future<List<Product>> getProducts() async {
    final List<Map<String, dynamic>> query = await _database!.query('Product');

    return List.generate(query.length, (i) {
      return Product(
        id: query[i]['id'],
        category: query[i]['ct_fk'],
        name: query[i]['name'],
        icon: query[i]['icon'],
        description: query[i]['description'],
      );
    });
  }

  Future<List<Savings>> getSavings() async {
    final List<Map<String, dynamic>> query = await _database!.query('Savings');

    return List.generate(query.length, (i) {
      return Savings(
        id: query[i]['id'],
        storage: query[i]['st_fk'],
        product: query[i]['pr_fk'],
        amount: query[i]['amount'],
        added: DateTime.parse(query[i]['added']),
        expiry: DateTime.parse(query[i]['expiry']),
      );
    });
  }

  Future<List<Savings>> getSavingsByStorage(int storageId) async {
    final List<Map<String, dynamic>> query = await _database!.query('Savings',
        where: 'st_fk = ?', whereArgs: [storageId]);

    return List.generate(query.length, (i) {
      return Savings(
        id: query[i]['id'],
        storage: query[i]['st_fk'],
        product: query[i]['pr_fk'],
        amount: query[i]['amount'],
        added: DateTime.parse(query[i]['added']),
        expiry: DateTime.parse(query[i]['expiry']),
      );
    });
  }

  Future<List<Savings>> getSavingsByProduct(int productId) async {
    final List<Map<String, dynamic>> query = await _database!.query('Savings',
        where: 'pr_fk = ?', whereArgs: [productId]);

    return List.generate(query.length, (i) {
      return Savings(
        id: query[i]['id'],
        storage: query[i]['st_fk'],
        product: query[i]['pr_fk'],
        amount: query[i]['amount'],
        added: DateTime.parse(query[i]['added']),
        expiry: DateTime.parse(query[i]['expiry']),
      );
    });
  }

  Future<List<Savings>> getSavingsByCategory(int categoryId) async {
    final List<Map<String, dynamic>> query = await _database!.query('Savings',
        where: 'pr_fk IN (SELECT id FROM Product WHERE ct_fk = ?)',
        whereArgs: [categoryId]);

    return List.generate(query.length, (i) {
      return Savings(
        id: query[i]['id'],
        storage: query[i]['st_fk'],
        product: query[i]['pr_fk'],
        amount: query[i]['amount'],
        added: DateTime.parse(query[i]['added']),
        expiry: DateTime.parse(query[i]['expiry']),
      );
    });
  }

  Future<List<Savings>> getSavingsByDate(DateTime date) async {
    final List<Map<String, dynamic>> query = await _database!.query('Savings',
        where: 'added = ?', whereArgs: [date.toIso8601String()]);

    return List.generate(query.length, (i) {
      return Savings(
        id: query[i]['id'],
        storage: query[i]['st_fk'],
        product: query[i]['pr_fk'],
        amount: query[i]['amount'],
        added: DateTime.parse(query[i]['added']),
        expiry: DateTime.parse(query[i]['expiry']),
      );
    });
  }

  Future<List<Savings>> getSavingsByExpiry(DateTime date) async {
    final List<Map<String, dynamic>> query = await _database!.query('Savings',
        where: 'expiry = ?', whereArgs: [date.toIso8601String()]);

    return List.generate(query.length, (i) {
      return Savings(
        id: query[i]['id'],
        storage: query[i]['st_fk'],
        product: query[i]['pr_fk'],
        amount: query[i]['amount'],
        added: DateTime.parse(query[i]['added']),
        expiry: DateTime.parse(query[i]['expiry']),
      );
    });
  }

  Future<List<Savings>> getSavingsByDateRange(DateTime start, DateTime end) async {
    final List<Map<String, dynamic>> query = await _database!.query('Savings',
        where: 'added BETWEEN ? AND ?', whereArgs: [start.toIso8601String(), end.toIso8601String()]);

    return List.generate(query.length, (i) {
      return Savings(
        id: query[i]['id'],
        storage: query[i]['st_fk'],
        product: query[i]['pr_fk'],
        amount: query[i]['amount'],
        added: DateTime.parse(query[i]['added']),
        expiry: DateTime.parse(query[i]['expiry']),
      );
    });
  }

  Future<List<Savings>> getSavingsByExpiryRange(DateTime start, DateTime end) async {
    final List<Map<String, dynamic>> query = await _database!.query('Savings',
        where: 'expiry BETWEEN ? AND ?', whereArgs: [start.toIso8601String(), end.toIso8601String()]);

    return List.generate(query.length, (i) {
      return Savings(
        id: query[i]['id'],
        storage: query[i]['st_fk'],
        product: query[i]['pr_fk'],
        amount: query[i]['amount'],
        added: DateTime.parse(query[i]['added']),
        expiry: DateTime.parse(query[i]['expiry']),
      );
    });
  }

  Future addStorage(Storage storage) async {
    try {
      await _database!.insert('Storage', storage.toJson());
    } catch (e) {
      print(e);
    }
  }

  Future addProduct(Product product) async {
    try {
      await _database!.insert('Product', product.toJson());
    } catch (e) {
      print(e);
    }
  }

  Future addCategory(Category category) async {
    try {
      await _database!.insert('Category', category.toJson());
    } catch (e) {
      print(e);
    }
  }

  Future addSavings(Savings savings) async {
    try {
      await _database!.insert('Savings', savings.toJson());
    } catch (e) {
      print(e);
    }
  }

  Future updateStorage(Storage storage) async {
    try {
      await _database!.update('Storage', storage.toJson(),
          where: 'id = ?', whereArgs: [storage.id]);
    } catch (e) {
      print(e);
    }
  }

  Future updateProduct(Product product) async {
    try {
      await _database!.update('Product', product.toJson(),
          where: 'id = ?', whereArgs: [product.id]);
    } catch (e) {
      print(e);
    }
  }

  Future updateCategory(Category category) async {
    try {
      await _database!.update('Category', category.toJson(),
          where: 'id = ?', whereArgs: [category.id]);
    } catch (e) {
      print(e);
    }
  }

  Future updateSavings(Savings savings) async {
    try {
      await _database!.update('Savings', savings.toJson(),
          where: 'id = ?', whereArgs: [savings.id]);
    } catch (e) {
      print(e);
    }
  }

  Future deleteStorage(int id) async {
    try {
      await _database!.delete('Storage', where: 'id = ?', whereArgs: [id]);
    } catch (e) {
      print(e);
    }
  }

  Future deleteProduct(int id) async {
    try {
      await _database!.delete('Product', where: 'id = ?', whereArgs: [id]);
    } catch (e) {
      print(e);
    }
  }

  Future deleteCategory(int id) async {
    try {
      await _database!.delete('Category', where: 'id = ?', whereArgs: [id]);
    } catch (e) {
      print(e);
    }
  }

  Future deleteSavings(int id) async {
    try {
      await _database!.delete('Savings', where: 'id = ?', whereArgs: [id]);
    } catch (e) {
      print(e);
    }
  }
}
