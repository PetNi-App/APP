import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart';
import 'package:http/testing.dart';
import 'package:pet_ni/service/gov/animal_adoption_client.dart';

import '../fixtures/fixture.dart';

void main() {
  final header = {
    HttpHeaders.contentTypeHeader: 'application/json; charset=utf-8'
  };
  group('get', () {
    test('should get a list of data', () async {
      final client = MockClient(
        (_) async => Response(Fixture.govData, HttpStatus.ok, headers: header),
      );

      final actual = await AnimalAdoptionClient(client).get();
      expect(actual.isNotEmpty, isTrue);
    });
  });

  group('get', () {
    test('should get a JSON string', () async {
      final client = MockClient(
        (_) async => Response(Fixture.govData, HttpStatus.ok, headers: header),
      );

      final actual = await AnimalAdoptionClient(client).getJson();
      expect(actual.isNotEmpty, isTrue);
    });
  });
}
