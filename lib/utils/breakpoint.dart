import 'package:flutter/widgets.dart';

/// Following Material Design [https://m3.material.io/foundations/adaptive-design/large-screens/overview]
class Breakpoint {
  Breakpoint._(this.portrait, this.landscape, this.windowSizeClass);

  factory Breakpoint.fromContext(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    if (width < 600) {
      return Breakpoint._(
          Portrait.handset, Landscape.phone, WindowSizeClass.compact);
    }

    if (width < 840) {
      return Breakpoint._(
          Portrait.smallTablet, Landscape.smallTablet, WindowSizeClass.medium);
    }

    return Breakpoint._(
        Portrait.largeTablet, Landscape.largeTablet, WindowSizeClass.expanded);
  }

  final Portrait portrait;
  final Landscape landscape;
  final WindowSizeClass windowSizeClass;
}

enum Landscape {
  phone,
  smallTablet,
  largeTablet,
}

enum Portrait {
  handset,
  smallTablet,
  largeTablet,
}

enum WindowSizeClass {
  compact,
  medium,
  expanded,
}
