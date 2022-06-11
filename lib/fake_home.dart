import 'package:flutter/material.dart';
import 'package:pet_ni/src/breakpoint/breakpoint.dart';

class FakeApp extends StatelessWidget {
  const FakeApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: FakeHome(),
    );
  }
}

class FakeHome extends StatelessWidget {
  const FakeHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    late String image;

    switch (Breakpoint.fromContext(context).windowSizeClass) {
      case WindowSizeClass.Compact:
        image = 'fakes/home_compact.png';
        break;
      case WindowSizeClass.Medium:
        image = 'fakes/home_medium.png';
        break;
      case WindowSizeClass.Expanded:
        image = 'fakes/home_expanded.png';
        break;
    }

    return Image.asset(
      image,
      fit: BoxFit.contain,
      height: double.infinity,
      alignment: Alignment.center,
    );
  }
}
