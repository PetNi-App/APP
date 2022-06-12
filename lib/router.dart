import 'package:auto_route/auto_route.dart';
import 'package:pet_ni/pages/home/home_page.dart';
import 'package:pet_ni/pages/meet/meet_page.dart';
import 'package:pet_ni/pages/pet_filter/pet_fillter_page.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    AutoRoute(page: HomePage, initial: true),
    AutoRoute(page: PetFilterPage),
    AutoRoute(page: MeetPage),
  ],
)
class $AppRouter {}
