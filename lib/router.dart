import 'package:auto_route/auto_route.dart';

import 'pages/fake_home_page.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    AutoRoute(page: FakeHomePage, initial: true),
  ],
)
class $AppRouter {}
