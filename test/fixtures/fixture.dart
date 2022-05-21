import 'dart:io';

class Fixture {
  static String get govData => fixture('gov.json');

  static String fixture(String name) =>
      File('test/fixtures/$name').readAsStringSync();
}
