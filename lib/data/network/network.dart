import 'dart:convert';

import 'package:http/http.dart';

class Network {
  Future<void> getNetwork(String url, {Map<String, dynamic>? body}) async {
    try {
      Uri uri = Uri.parse(url);
      Response response = await get(
        uri,
        headers: {'Content-Type': 'application-json'},
      );

      ///
      final result = jsonDecode(response.body);

      ///
      if (response.statusCode == 200 && result['status'] == 'success') {}
    } catch (e) {
      print(e.toString());
    }
  }
}
