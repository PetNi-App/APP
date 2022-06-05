import 'package:flutter/material.dart';

class FakeHome extends StatelessWidget {
  const FakeHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      "fakes/fake_home.png",
      fit: BoxFit.contain,
      height: double.infinity,
      alignment: Alignment.center,
    );
  }
}
