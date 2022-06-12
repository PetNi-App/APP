import 'package:flutter/material.dart';
import 'package:pet_ni/utils/breakpoint.dart';
import 'package:pet_ni/components/navigation_bar.dart';

class FakeHomePage extends StatelessWidget {
  const FakeHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    late String image;

    switch (Breakpoint.fromContext(context).windowSizeClass) {
      case WindowSizeClass.compact:
        image = 'fakes/home_compact.png';
        break;
      case WindowSizeClass.medium:
        image = 'fakes/home_medium.png';
        break;
      case WindowSizeClass.expanded:
        image = 'fakes/home_expanded.png';
        break;
    }

    return Scaffold(body: MyNavigationBar());
  }
}
