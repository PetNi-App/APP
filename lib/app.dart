import 'package:flutter/material.dart';
import 'package:pet_ni/router.gr.dart';
import 'package:pet_ni/theme/theme.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final router = AppRouter();

    return MaterialApp.router(
      routerDelegate: router.delegate(),
      routeInformationParser: router.defaultRouteParser(),
      theme: MyTheme.light(),
      darkTheme: MyTheme.dark(),
    );
  }
}
