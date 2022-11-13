// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedRouterGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs, unused_import, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../models/db_models.dart';
import '../ui/views/category_manage/category_manage_view.dart';
import '../ui/views/home/home_view.dart';
import '../ui/views/product_manage/product_manage_view.dart';
import '../ui/views/startup/startup_view.dart';

class Routes {
  static const String startupView = '/';
  static const String homeView = '/home';
  static const String productManageView = '/manage';
  static const String categoryManageView = '/category';
  static const all = <String>{
    startupView,
    homeView,
    productManageView,
    categoryManageView,
  };
}

class StackedRouter extends RouterBase {
  @override
  List<RouteDef> get routes => _routes;
  final _routes = <RouteDef>[
    RouteDef(Routes.startupView, page: StartupView),
    RouteDef(Routes.homeView, page: HomeView),
    RouteDef(Routes.productManageView, page: ProductManageView),
    RouteDef(Routes.categoryManageView, page: CategoryManageView),
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
    ProductManageView: (data) {
      var args = data.getArgs<ProductManageViewArguments>(nullOk: false);
      return MaterialPageRoute<dynamic>(
        builder: (context) => ProductManageView(
          key: args.key,
          product: args.product,
        ),
        settings: data,
      );
    },
    CategoryManageView: (data) {
      var args = data.getArgs<CategoryManageViewArguments>(nullOk: false);
      return MaterialPageRoute<dynamic>(
        builder: (context) => CategoryManageView(
          key: args.key,
          category: args.category,
        ),
        settings: data,
      );
    },
  };
}

/// ************************************************************************
/// Arguments holder classes
/// *************************************************************************

/// ProductManageView arguments holder class
class ProductManageViewArguments {
  final Key? key;
  final Record product;
  ProductManageViewArguments({this.key, required this.product});
}

/// CategoryManageView arguments holder class
class CategoryManageViewArguments {
  final Key? key;
  final Category category;
  CategoryManageViewArguments({this.key, required this.category});
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

  Future<dynamic> navigateToProductManageView({
    Key? key,
    required Record product,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo(
      Routes.productManageView,
      arguments: ProductManageViewArguments(key: key, product: product),
      id: routerId,
      preventDuplicates: preventDuplicates,
      parameters: parameters,
      transition: transition,
    );
  }

  Future<dynamic> navigateToCategoryManageView({
    Key? key,
    required Category category,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo(
      Routes.categoryManageView,
      arguments: CategoryManageViewArguments(key: key, category: category),
      id: routerId,
      preventDuplicates: preventDuplicates,
      parameters: parameters,
      transition: transition,
    );
  }
}
