import 'package:dio/dio.dart';

import '../model/Catfacts.dart';

class Services {
  Future<Catfacts?> getCatfacts() async {
    try {
      var response = await Dio().get('https://catfact.ninja/fact');
      var body = response.data;
      // print(Catfacts.fromJson(body));
      if (response.statusCode == 200) return Catfacts.fromJson(body);

      // return body;
    } catch (e) {
      print(e);
      throw Exception(e);
    }
    return null;
  }
}
