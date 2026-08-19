import 'dart:convert';

import 'package:http/http.dart';

class NetworkCaller {
  static Future<dynamic> getNetwork(
    String url, {
    Map<String, dynamic>? body,
  }) async {
    try {
      Uri uri = Uri.parse(url);
      Response response = await get(
        uri,
        headers: {
          'Content-Type': 'application/json',
          'token': 'token',
        },
      );

      ///
      final result = jsonDecode(response.body);

      ///
      if (response.statusCode == 200 && result['status'] == 'success') {
        return result;
      } else if (response.statusCode == 401) {
        return print(
          'Something is wrong ${response.statusCode} ${result['status']}',
        );
      }
    } catch (e) {
      print(e.toString());
    }
  }

  static Future<dynamic> postNetwork(
    String url, {
    Map<String, dynamic>? body,
  }) async {
    try {
      Uri uri = Uri.parse(url);
      Response response = await post(
        uri,
        headers: {
          'Content-Type': 'application/json',
          'token': 'token',
        },
        body: jsonEncode(body),
      );

      final jsonDecodeData = jsonDecode(response.body);

      if (response.statusCode == 200) {
        return jsonDecodeData;
      } else {
        return jsonDecodeData;
      }
    } catch (e) {
      print(e.toString());
    }
  }
}
