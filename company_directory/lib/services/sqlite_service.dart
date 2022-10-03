import 'package:company_directory/app/app.locator.dart';
import 'package:company_directory/models/company.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite_migration_service/sqflite_migration_service.dart';

// ignore: constant_identifier_names
const String DB_NAME = 'company_directory.sqlite';

class SQLiteService {
  final _migration_service = locator<DatabaseMigrationService>();
  Database? _database;

  Future initialise() async {
    _database = await openDatabase(DB_NAME, version: 1);

    await _migration_service.runMigration(_database,
        migrationFiles: [
          '1_create_schema.sql',
          '2_fix_database.sql'
        ],
        verbose: true);
  }

  Future<List<Company>> getCompanies() async {
    List<Map<String,dynamic>> companies_query = await _database!.query('company');
    return companies_query.map((company ) => Company.fromJson(company)).toList();
  }

  Future addCompany(Company company) async {
    try{
      await _database!.insert('company', company.toJson());
    }
    catch(e){
      print('could not insert the new company $e');
    }
  }

  Future updateCompany(int id, Company company) async {
    try{
      await _database!.update('company', company.toJson(), where: 'id = ?', whereArgs: [id]);
    }
    catch(e){
      print('could not update the company with the id $id $e');
    }
  }

  Future deleteCompany(int id) async {
    try{
      await _database!.delete('company', where: 'id = ?', whereArgs: [id]);
    }
    catch(e){
      print('could not delete the company with the id $id $e');
    }
  }

  Future<void> deleteDatabase(String path) => databaseFactory.deleteDatabase(path);
}
