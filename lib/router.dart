import 'package:auto_route/auto_route.dart';
import 'package:pet_ni/pages/home_page.dart';
import 'package:pet_ni/pages/main_page.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    AutoRoute(path: '/', page: MainPage, initial: true, children: [
      AutoRoute(page: HomePage, initial: true),
    ]),
  ],
)
class $AppRouter {}
