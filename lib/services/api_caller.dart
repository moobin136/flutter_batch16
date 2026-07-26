import 'package:flutter_batch16/model/api_response/api_response.dart';
import 'package:http/http.dart' as http;

class ApiCaller {
  Future<void> getData(String URL) async {
    try {
      Uri url = Uri.parse(URL);
      http.Response response = await http.get(url, headers: {
        'Content-Type': 'application/json',
      });

      print('Response status: ${response.statusCode}');

      if (response.statusCode == 200) {
        ApiResponse apiResponse = ApiResponse(
            responseCode: response.statusCode,
            responseData: response.body,
            isSuccess: true,
            errorMessage: null);
      } else {
        ApiResponse apiResponse = ApiResponse(
            responseCode: response.statusCode,
            responseData: null,
            isSuccess: false,
            errorMessage:
                'Error occurred with status code: ${response.statusCode}');
        print('Error occurred with status code: ${response.statusCode}');
      }
    } catch (e) {
      print(e.toString());
    }
  }
}
