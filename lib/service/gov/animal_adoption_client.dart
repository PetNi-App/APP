import 'dart:convert';
import 'package:http/http.dart';

import 'animal_adoption.dart';

class AnimalAdoptionClient {
  static final url = Uri.https(
    'data.coa.gov.tw',
    '/Service/OpenData/TransService.aspx',
    {'UnitId': 'QcbUEzN6E6DL'},
  );

  AnimalAdoptionClient(this.client);

  final Client client;

  Future<Iterable<AnimalAdoption>> get() async {
    final response = await _get();
    final iterable = jsonDecode(response.body) as List;
    return iterable.map((e) => AnimalAdoption.fromJson(e));
  }

  Future<String> getJson() => _get().then((value) => value.body);

  Future<Response> _get() => client.get(url);
}
