// Package imports:
import 'package:kitchen_hub/services/App/data_service.dart';
import 'package:kitchen_hub/ui/views/product_manager/product_manager_view.dart';
import 'package:kitchen_hub/ui/views/record_manage/record_manager_view.dart';
import 'package:kitchen_hub/ui/views/simple_manager/simple_manager_view.dart';
import 'package:sqflite_migration_service/sqflite_migration_service.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';

// Project imports:
import 'package:kitchen_hub/services/SQLite/sqlite_service.dart';
import 'package:kitchen_hub/ui/views/home/home_view.dart';
import 'package:kitchen_hub/ui/views/startup/startup_view.dart';

@StackedApp(routes: [
  MaterialRoute(page: StartupView, path: '/', initial: true),
  MaterialRoute(page: HomeView, path: '/home'),
  MaterialRoute(page: RecordManagerView, path: '/record_manager'),
  MaterialRoute(page: SimpleManagerView, path: '/simple_manager'),
  MaterialRoute(page: ProductManagerView, path: '/product_manager'),
], dependencies: [
  LazySingleton(classType: NavigationService),
  LazySingleton(classType: DialogService),
  LazySingleton(classType: SQLiteService),
  LazySingleton(classType: DatabaseMigrationService),
  LazySingleton(classType: DataService),
])
class AppSetup {}
