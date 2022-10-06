// Package imports:
import 'package:company_directory/services/details_service.dart';
import 'package:company_directory/services/sqlite_service.dart';
import 'package:company_directory/ui/views/details/details_view.dart';
import 'package:company_directory/ui/views/home/home_view.dart';
import 'package:company_directory/ui/views/startup/startup_view.dart';
import 'package:sqflite_migration_service/sqflite_migration_service.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';

// Project imports:

@StackedApp(
  routes:[
    MaterialRoute(page: StartupView, path: '/', initial:true),
    MaterialRoute(page: HomeView, path: '/home'),
    MaterialRoute(page: DetailsView, path: '/details'),
  ],
  dependencies:[
    LazySingleton(classType: NavigationService),
    LazySingleton(classType: DialogService),
    LazySingleton(classType: DetailsService),
    LazySingleton(classType: SQLiteService),
    LazySingleton(classType: DatabaseMigrationService),
  ])
class AppSetup{}
