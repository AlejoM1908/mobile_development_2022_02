// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedRouterGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs, unused_import, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../ui/views/game/game_view.dart';
import '../ui/views/join_room/join_room_view.dart';
import '../ui/views/main_menu/main_menu_view.dart';
import '../ui/views/mode_selector/mode_selector_view.dart';
import '../ui/views/online_menu/online_menu_view.dart';
import '../ui/views/room/room_view.dart';
import '../ui/views/startup/startup_view.dart';

class Routes {
  static const String startupView = '/';
  static const String gameView = '/game';
  static const String mainMenuView = '/main_menu';
  static const String modeSelectorView = '/mode_selector';
  static const String roomView = '/room';
  static const String onlineMenuView = '/online_menu';
  static const String joinRoomView = '/join_room';
  static const all = <String>{
    startupView,
    gameView,
    mainMenuView,
    modeSelectorView,
    roomView,
    onlineMenuView,
    joinRoomView,
  };
}

class StackedRouter extends RouterBase {
  @override
  List<RouteDef> get routes => _routes;
  final _routes = <RouteDef>[
    RouteDef(Routes.startupView, page: StartupView),
    RouteDef(Routes.gameView, page: GameView),
    RouteDef(Routes.mainMenuView, page: MainMenuView),
    RouteDef(Routes.modeSelectorView, page: ModeSelectorView),
    RouteDef(Routes.roomView, page: RoomView),
    RouteDef(Routes.onlineMenuView, page: OnlineMenuView),
    RouteDef(Routes.joinRoomView, page: JoinRoomView),
  ];
  @override
  Map<Type, StackedRouteFactory> get pagesMap => _pagesMap;
  final _pagesMap = <Type, StackedRouteFactory>{
    StartupView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => const StartupView(),
        settings: data,
      );
    },
    GameView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => const GameView(),
        settings: data,
      );
    },
    MainMenuView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => const MainMenuView(),
        settings: data,
      );
    },
    ModeSelectorView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => const ModeSelectorView(),
        settings: data,
      );
    },
    RoomView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => const RoomView(),
        settings: data,
      );
    },
    OnlineMenuView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => const OnlineMenuView(),
        settings: data,
      );
    },
    JoinRoomView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => const JoinRoomView(),
        settings: data,
      );
    },
  };
}

/// ************************************************************************
/// Extension for strongly typed navigation
/// *************************************************************************

extension NavigatorStateExtension on NavigationService {
  Future<dynamic> navigateToStartupView({
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo(
      Routes.startupView,
      id: routerId,
      preventDuplicates: preventDuplicates,
      parameters: parameters,
      transition: transition,
    );
  }

  Future<dynamic> navigateToGameView({
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo(
      Routes.gameView,
      id: routerId,
      preventDuplicates: preventDuplicates,
      parameters: parameters,
      transition: transition,
    );
  }

  Future<dynamic> navigateToMainMenuView({
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo(
      Routes.mainMenuView,
      id: routerId,
      preventDuplicates: preventDuplicates,
      parameters: parameters,
      transition: transition,
    );
  }

  Future<dynamic> navigateToModeSelectorView({
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo(
      Routes.modeSelectorView,
      id: routerId,
      preventDuplicates: preventDuplicates,
      parameters: parameters,
      transition: transition,
    );
  }

  Future<dynamic> navigateToRoomView({
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo(
      Routes.roomView,
      id: routerId,
      preventDuplicates: preventDuplicates,
      parameters: parameters,
      transition: transition,
    );
  }

  Future<dynamic> navigateToOnlineMenuView({
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo(
      Routes.onlineMenuView,
      id: routerId,
      preventDuplicates: preventDuplicates,
      parameters: parameters,
      transition: transition,
    );
  }

  Future<dynamic> navigateToJoinRoomView({
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo(
      Routes.joinRoomView,
      id: routerId,
      preventDuplicates: preventDuplicates,
      parameters: parameters,
      transition: transition,
    );
  }
}
