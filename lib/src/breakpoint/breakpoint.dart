import 'package:flutter/widgets.dart';

import 'landscape.dart';
import 'portrait.dart';
import 'window_size_class.dart';

export 'landscape.dart';
export 'portrait.dart';
export 'window_size_class.dart';

/// Following Material Design [https://m3.material.io/foundations/adaptive-design/large-screens/overview]
class Breakpoint {
  Breakpoint._(this.portrait, this.landscape, this.windowSizeClass);

  factory Breakpoint.fromContext(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    if (width < 600) {
      return Breakpoint._(
          Portrait.Handset, Landscape.Phone, WindowSizeClass.Compact);
    }

    if (width < 840) {
      return Breakpoint._(
          Portrait.SmallTablet, Landscape.SmallTablet, WindowSizeClass.Medium);
    }

    return Breakpoint._(
        Portrait.LargeTablet, Landscape.LargeTablet, WindowSizeClass.Expanded);
  }

  final Portrait portrait;
  final Landscape landscape;
  final WindowSizeClass windowSizeClass;
}
