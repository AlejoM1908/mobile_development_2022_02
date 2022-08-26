// Package imports:
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';

// Project imports:
import 'package:tic_tac_toe/services/game_service/game_service.dart';
import 'package:tic_tac_toe/ui/views/game/game_view.dart';
import 'package:tic_tac_toe/ui/views/main_menu/main_menu_view.dart';
import 'package:tic_tac_toe/ui/views/startup/startup_view.dart';

@StackedApp(
  routes:[
    MaterialRoute(page: StartupView, path: '/', initial:true),
    MaterialRoute(page: GameView, path: '/game'),
    MaterialRoute(page: MainMenuView, path: '/main_menu'),
  ],
  dependencies:[
    LazySingleton(classType: NavigationService),
    LazySingleton(classType: DialogService),
    LazySingleton(classType: GameService)
  ])
class AppSetup{}
