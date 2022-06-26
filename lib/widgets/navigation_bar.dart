import 'package:flutter/material.dart';

class MyNavigationBar extends StatelessWidget {
  const MyNavigationBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'fakes/navigation_bar.png',
      fit: BoxFit.cover,
      height: 78.0,
      width: double.maxFinite,
    );
  }
}
