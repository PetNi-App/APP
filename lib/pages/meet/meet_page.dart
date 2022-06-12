import 'package:flutter/material.dart';
import 'package:pet_ni/utils/breakpoint.dart';

class MeetPage extends StatelessWidget {
  const MeetPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return fake(context);
  }
}

Widget fake(BuildContext context) {
  late String image;

  switch (Breakpoint.fromContext(context).windowSizeClass) {
    case WindowSizeClass.compact:
      image = 'fakes/meet_compact.png';
      break;
    case WindowSizeClass.medium:
      image = 'fakes/meet_medium.png';
      break;
    case WindowSizeClass.expanded:
      image = 'fakes/meet_expanded.png';
      break;
  }

  return Image.asset(
    image,
    fit: BoxFit.contain,
    height: double.infinity,
    alignment: Alignment.center,
  );
}
