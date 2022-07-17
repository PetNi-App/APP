import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:pet_ni/router.gr.dart';
import 'package:pet_ni/theme/icons.dart';

class MyNavigationBar extends StatefulWidget {
  const MyNavigationBar({Key? key}) : super(key: key);

  @override
  State<MyNavigationBar> createState() => _MyNavigationBarState();
}

class _MyNavigationBarState extends State<MyNavigationBar> {
  var _currentPageIndex = 0;

  void setCurrentPageIndex(int value) => setState(() {
        _currentPageIndex = value;
      });

  Widget _iconText(IconData icon, String label) {
    final textColor = NavigationBarTheme.of(context)
        .iconTheme!
        .resolve({MaterialState.selected})!.color;

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon),
        SizedBox(width: 12.0),
        Text(label, style: TextStyle(color: textColor)),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return NavigationBar(
      onDestinationSelected: (value) {
        setCurrentPageIndex(value);
        switch (value) {
          case 0:
            context.pushRoute(HomeRoute());
            break;
          case 1:
            context.pushRoute(HomeRoute());
            break;
          case 2:
            context.pushRoute(HomeRoute());
            break;
        }
      },
      selectedIndex: _currentPageIndex,
      destinations: <Widget>[
        NavigationDestination(
          icon: Icon(MyIcons.card),
          selectedIcon: _iconText(MyIcons.card, '配對'),
          label: '配對',
        ),
        NavigationDestination(
          icon: Icon(MyIcons.card),
          selectedIcon: _iconText(MyIcons.card, '配對'),
          label: '配對',
        ),
        NavigationDestination(
          icon: Icon(MyIcons.card),
          selectedIcon: _iconText(MyIcons.card, '配對'),
          label: '配對',
        ),
      ],
    );
  }
}
