import 'package:gps_usage/ui/views/home/home_view.dart';
import 'package:gps_usage/ui/views/startup/startup_view.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';

@StackedApp(
  routes: [
    MaterialRoute(page: StartupView, path: '/', initial: true),
    MaterialRoute(page: HomeView, path: '/home'),
  ],
  dependencies: [
    LazySingleton(classType: NavigationService),
    LazySingleton(classType: DialogService),
  ]
)
class AppSetup{}
