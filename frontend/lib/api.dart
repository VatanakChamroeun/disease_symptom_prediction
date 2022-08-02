import 'dart:convert';
import 'package:http/http.dart' as http;

class Api {
  // static String host = 'reqbin.com';
  static String host = '';

  static Future<Map> post(String path, Map body) async {
    http.Response response = await http.post(
      Uri(
        host: host,
        path: path,
        scheme: 'https',
      ),
      headers: {
        'Content-type': 'application/json',
        'Accept': 'application/json',
      },
      body: jsonEncode(body),
    );

    var result = jsonDecode(response.body);

    if (response.statusCode == 200) {
      print(result["message"]);
      return result;
    } else {
      throw Exception('Failed to load data');
    }
  }
}
