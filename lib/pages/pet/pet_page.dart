import 'package:flutter/material.dart';
import 'package:pet_ni/utils/breakpoint.dart';

class PetPage extends StatelessWidget {
  const PetPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return fake(context);
  }
}

Widget fake(BuildContext context) {
  late String image;

  switch (Breakpoint.fromContext(context).windowSizeClass) {
    case WindowSizeClass.compact:
      image = 'fakes/pet_compact.png';
      break;
    case WindowSizeClass.medium:
      image = 'fakes/pet_medium.png';
      break;
    case WindowSizeClass.expanded:
      image = 'fakes/pet_expanded.png';
      break;
  }

  return Image.asset(
    image,
    fit: BoxFit.contain,
    height: double.infinity,
    alignment: Alignment.center,
  );
}
