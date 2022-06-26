import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pet_ni/theme/svgs.dart';
import 'package:pet_ni/utils/breakpoint.dart';
import 'package:pet_ni/widgets/navigation_bar.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isExpanded = Breakpoint.fromContext(context).windowSizeClass ==
        WindowSizeClass.expanded;

    return Scaffold(
      appBar: isExpanded
          ? AppBar(
              toolbarHeight: 78.0,
              title: SvgPicture.asset(MySvgs.logo),
              actions: [
                SizedBox(
                  width: 470 / 5 * 5,
                  child: MyNavigationBar(),
                )
              ],
            )
          : null,
      body: AutoRouter(),
      bottomNavigationBar: isExpanded ? null : MyNavigationBar(),
    );
  }
}
