import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;

class HomeServiceAPI {
  Future<dynamic> getFilm(String title) async {
     log("GET FILM SERVICE START");
    final response = await http
        .get(Uri.parse('http://www.omdbapi.com/?apikey=228b23fc&s=$title'));

    if (response.statusCode == 200 && response.body.isNotEmpty) {
      dynamic result = json.decode(response.body);
      log("result => $result");
      return result;

    } else {

      throw Exception('Gagal mengambil data film');
    }
  }
}
