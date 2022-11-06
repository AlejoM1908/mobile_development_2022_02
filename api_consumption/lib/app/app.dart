import 'package:api_consumption/services/http/http_service.dart';
import 'package:api_consumption/ui/views/home/home_view.dart';
import 'package:api_consumption/ui/views/hotel/hotel_view.dart';
import 'package:api_consumption/ui/views/startup/startup_view.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';

@StackedApp(
  routes: [
    MaterialRoute(page: StartupView, path: '/', initial: true),
    MaterialRoute(page: HomeView, path: '/home'),
    MaterialRoute(page: HotelView, path: '/hotel'),
  ],
  dependencies: [
    LazySingleton(classType: NavigationService),
    LazySingleton(classType: DialogService),
    LazySingleton(classType: HttpService),
  ]
)
class AppSetup{}
