import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:pet_ni/theme/svgs.dart';

void main() {
  test('logo', () {
    final acutal = File(MySvgs.logo);
    expect(acutal.existsSync(), true);
  });
}
