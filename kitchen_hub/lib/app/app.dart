// Package imports:
import 'package:kitchen_hub/services/App/product_service.dart';
import 'package:kitchen_hub/ui/views/product_manage/product_manage_view.dart';
import 'package:sqflite_migration_service/sqflite_migration_service.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';

// Project imports:
import 'package:kitchen_hub/services/SQLite/sqlite_service.dart';
import 'package:kitchen_hub/ui/views/home/home_view.dart';
import 'package:kitchen_hub/ui/views/startup/startup_view.dart';

@StackedApp(
  routes:[
    MaterialRoute(page: StartupView, path: '/', initial:true),
    MaterialRoute(page: HomeView, path: '/home'),
    MaterialRoute(page: ProductManageView, path: '/manage'),
  ],
  dependencies:[
    LazySingleton(classType: NavigationService),
    LazySingleton(classType: DialogService),
    LazySingleton(classType: SQLiteService),
    LazySingleton(classType: DatabaseMigrationService),
    LazySingleton(classType: ProductService)
  ])
class AppSetup{}
