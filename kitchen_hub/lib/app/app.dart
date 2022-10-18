// Package imports:
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
  ],
  dependencies:[
    LazySingleton(classType: NavigationService),
    LazySingleton(classType: DialogService),
    LazySingleton(classType: SQLiteService),
    LazySingleton(classType: DatabaseMigrationService),
  ])
class AppSetup{}
