// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedRouterGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs, unused_import, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../models/db_models.dart';
import '../ui/views/home/home_view.dart';
import '../ui/views/product_manager/product_manager_view.dart';
import '../ui/views/record_manage/record_manager_view.dart';
import '../ui/views/simple_manager/simple_manager_view.dart';
import '../ui/views/startup/startup_view.dart';

class Routes {
  static const String startupView = '/';
  static const String homeView = '/home';
  static const String recordManagerView = '/record_manager';
  static const String simpleManagerView = '/simple_manager';
  static const String productManagerView = '/product_manager';
  static const all = <String>{
    startupView,
    homeView,
    recordManagerView,
    simpleManagerView,
    productManagerView,
  };
}

class StackedRouter extends RouterBase {
  @override
  List<RouteDef> get routes => _routes;
  final _routes = <RouteDef>[
    RouteDef(Routes.startupView, page: StartupView),
    RouteDef(Routes.homeView, page: HomeView),
    RouteDef(Routes.recordManagerView, page: RecordManagerView),
    RouteDef(Routes.simpleManagerView, page: SimpleManagerView),
    RouteDef(Routes.productManagerView, page: ProductManagerView),
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
    HomeView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => const HomeView(),
        settings: data,
      );
    },
    RecordManagerView: (data) {
      var args = data.getArgs<RecordManagerViewArguments>(nullOk: false);
      return MaterialPageRoute<dynamic>(
        builder: (context) => RecordManagerView(
          key: args.key,
          product: args.product,
        ),
        settings: data,
      );
    },
    SimpleManagerView: (data) {
      var args = data.getArgs<SimpleManagerViewArguments>(nullOk: false);
      return MaterialPageRoute<dynamic>(
        builder: (context) => SimpleManagerView(
          key: args.key,
          data: args.data,
        ),
        settings: data,
      );
    },
    ProductManagerView: (data) {
      var args = data.getArgs<ProductManagerViewArguments>(nullOk: false);
      return MaterialPageRoute<dynamic>(
        builder: (context) => ProductManagerView(
          key: args.key,
          data: args.data,
        ),
        settings: data,
      );
    },
  };
}

/// ************************************************************************
/// Arguments holder classes
/// *************************************************************************

/// RecordManagerView arguments holder class
class RecordManagerViewArguments {
  final Key? key;
  final Record product;
  RecordManagerViewArguments({this.key, required this.product});
}

/// SimpleManagerView arguments holder class
class SimpleManagerViewArguments {
  final Key? key;
  final dynamic data;
  SimpleManagerViewArguments({this.key, required this.data});
}

/// ProductManagerView arguments holder class
class ProductManagerViewArguments {
  final Key? key;
  final Product data;
  ProductManagerViewArguments({this.key, required this.data});
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

  Future<dynamic> navigateToHomeView({
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo(
      Routes.homeView,
      id: routerId,
      preventDuplicates: preventDuplicates,
      parameters: parameters,
      transition: transition,
    );
  }

  Future<dynamic> navigateToRecordManagerView({
    Key? key,
    required Record product,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo(
      Routes.recordManagerView,
      arguments: RecordManagerViewArguments(key: key, product: product),
      id: routerId,
      preventDuplicates: preventDuplicates,
      parameters: parameters,
      transition: transition,
    );
  }

  Future<dynamic> navigateToSimpleManagerView({
    Key? key,
    required dynamic data,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo(
      Routes.simpleManagerView,
      arguments: SimpleManagerViewArguments(key: key, data: data),
      id: routerId,
      preventDuplicates: preventDuplicates,
      parameters: parameters,
      transition: transition,
    );
  }

  Future<dynamic> navigateToProductManagerView({
    Key? key,
    required Product data,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo(
      Routes.productManagerView,
      arguments: ProductManagerViewArguments(key: key, data: data),
      id: routerId,
      preventDuplicates: preventDuplicates,
      parameters: parameters,
      transition: transition,
    );
  }
}
