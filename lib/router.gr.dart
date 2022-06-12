// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

import 'package:auto_route/auto_route.dart' as _i4;
import 'package:flutter/material.dart' as _i5;

import 'pages/home/home_page.dart' as _i1;
import 'pages/meet/meet_page.dart' as _i3;
import 'pages/pet_filter/pet_fillter_page.dart' as _i2;

class AppRouter extends _i4.RootStackRouter {
  AppRouter([_i5.GlobalKey<_i5.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i4.PageFactory> pagesMap = {
    HomeRoute.name: (routeData) {
      return _i4.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i1.HomePage());
    },
    PetFilterRoute.name: (routeData) {
      return _i4.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i2.PetFilterPage());
    },
    MeetRoute.name: (routeData) {
      return _i4.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i3.MeetPage());
    }
  };

  @override
  List<_i4.RouteConfig> get routes => [
        _i4.RouteConfig(HomeRoute.name, path: '/'),
        _i4.RouteConfig(PetFilterRoute.name, path: '/pet-filter-page'),
        _i4.RouteConfig(MeetRoute.name, path: '/meet-page')
      ];
}

/// generated route for
/// [_i1.HomePage]
class HomeRoute extends _i4.PageRouteInfo<void> {
  const HomeRoute() : super(HomeRoute.name, path: '/');

  static const String name = 'HomeRoute';
}

/// generated route for
/// [_i2.PetFilterPage]
class PetFilterRoute extends _i4.PageRouteInfo<void> {
  const PetFilterRoute() : super(PetFilterRoute.name, path: '/pet-filter-page');

  static const String name = 'PetFilterRoute';
}

/// generated route for
/// [_i3.MeetPage]
class MeetRoute extends _i4.PageRouteInfo<void> {
  const MeetRoute() : super(MeetRoute.name, path: '/meet-page');

  static const String name = 'MeetRoute';
}
