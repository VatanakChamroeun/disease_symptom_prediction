import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;

class Api {
  // static String host = 'reqbin.com';
  static String host = 'ml-term9-disease-prediction.herokuapp.com';

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
        'Access-Control-Allow-Methods': 'POST, GET, OPTIONS, PUT, DELETE, HEAD',
      },
      body: jsonEncode(body),
    );

    var result = jsonDecode(response.body);

    if (response.statusCode == 200) {
      print(result['message']);
      return result;
    } else {
      throw Exception('Failed to load data');
    }
  }

  static Future get(String path, [Map? body]) async {
    http.Response response = await http.get(
      Uri(
        host: host,
        path: path,
        scheme: 'https',
      ),
    );

    var result = response.body;

    inspect(result);
    print('result $result');

    return result;
  }
}
