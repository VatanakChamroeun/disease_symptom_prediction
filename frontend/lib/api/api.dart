import 'dart:convert';
import 'package:frontend/model/predict_model.dart';
import 'package:http/http.dart' as http;

class Api {
  // static String host = 'reqbin.com';
  static String host = 'ml-term9-disease-prediction.herokuapp.com';
  static String hostHeartDisease = 'heart-disease-ml-term-9.herokuapp.com';

  static Future<PredictModel> post(String path, Map body) async {
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
    var result = PredictModel.fromJson(jsonDecode(response.body));
    // var result = jsonDecode(response.body);

    if (response.statusCode == 200) {
      return result;
    } else {
      throw Exception('Failed to load data');
    }
  }

  static Future<PredictModel> postHeartDisease(String path, Map body) async {
    http.Response response = await http.post(
      Uri(
        host: hostHeartDisease,
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
    var result = PredictModel.fromJson(jsonDecode(response.body));
    // var result = jsonDecode(response.body);

    if (response.statusCode == 200) {
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

    print('result $result');

    return result;
  }
}
