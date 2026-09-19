import 'dart:convert';

import 'package:flutter_batch16/data/api_response/api_response.dart';
import 'package:flutter_batch16/export.dart';

class ApiCaller {
  static final Logger _logger = Logger();

  // ============================================================
  // GET
  // ============================================================

  static Future<ApiResponse> getRequest(String appUrl, String? token) async {
    try {
      final Uri url = Uri.parse(appUrl);

      final Map<String, String> headers = {
        'Accept': 'application/json',
      };

      if (token != null && token.isNotEmpty) {
        headers['token'] = token;
      }

      final Response response = await get(
        url,
        headers: headers,
      );

      _logger.i('GET: $appUrl');
      _logger.i('Status: ${response.statusCode}');
      _logger.i('Response: ${response.body}');

      final responseData = _decodeResponse(response.body);

      if (response.statusCode >= 200 && response.statusCode < 300) {
        return ApiResponse(
          responseCode: response.statusCode,
          responseData: responseData,
          isSuccess: true,
        );
      }

      return ApiResponse(
        responseCode: response.statusCode,
        responseData: responseData,
        isSuccess: false,
        errorMessage: response.body,
      );
    } catch (e, stackTrace) {
      _logger.e(
        'GET Error: $e',
        error: e,
        stackTrace: stackTrace,
      );

      return ApiResponse(
        responseCode: -1,
        responseData: null,
        isSuccess: false,
        errorMessage: e.toString(),
      );
    }
  }

  // ============================================================
  // POST
  // ============================================================

  static Future<ApiResponse> postRequest(
      String appUrl, Map<String, dynamic> body,
      {String? token}) async {
    try {
      final Uri url = Uri.parse(appUrl);

      final Map<String, String> headers = {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      };

      if (token != null && token.isNotEmpty) {
        headers['token'] = token;
      }

      final Response response = await post(
        url,
        headers: headers,
        body: jsonEncode(body),
      );

      _logger.i('POST: $appUrl');
      _logger.i('Body: $body');
      _logger.i('Status: ${response.statusCode}');
      _logger.i('Response: ${response.body}');

      final responseData = _decodeResponse(response.body);

      if (response.statusCode >= 200 && response.statusCode < 300) {
        return ApiResponse(
          responseCode: response.statusCode,
          responseData: responseData,
          isSuccess: true,
        );
      }

      return ApiResponse(
        responseCode: response.statusCode,
        responseData: responseData,
        isSuccess: false,
        errorMessage: response.body,
      );
    } catch (e, stackTrace) {
      _logger.e(
        'POST Error: $e',
        error: e,
        stackTrace: stackTrace,
      );

      return ApiResponse(
        responseCode: -1,
        responseData: null,
        isSuccess: false,
        errorMessage: e.toString(),
      );
    }
  }

  // ============================================================
  // PUT / UPDATE
  // ============================================================

  static Future<ApiResponse> putRequest(
      String appUrl, Map<String, dynamic> body, String? token) async {
    try {
      final Uri url = Uri.parse(appUrl);

      final Map<String, String> headers = {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      };

      if (token != null && token.isNotEmpty) {
        headers['token'] = token;
      }

      final Response response = await put(
        url,
        headers: headers,
        body: jsonEncode(body),
      );

      _logger.i('PUT: $appUrl');
      _logger.i('Body: $body');
      _logger.i('Status: ${response.statusCode}');
      _logger.i('Response: ${response.body}');

      final responseData = _decodeResponse(response.body);

      if (response.statusCode >= 200 && response.statusCode < 300) {
        return ApiResponse(
          responseCode: response.statusCode,
          responseData: responseData,
          isSuccess: true,
        );
      }

      return ApiResponse(
        responseCode: response.statusCode,
        responseData: responseData,
        isSuccess: false,
        errorMessage: response.body,
      );
    } catch (e, stackTrace) {
      _logger.e(
        'PUT Error: $e',
        error: e,
        stackTrace: stackTrace,
      );

      return ApiResponse(
        responseCode: 500,
        responseData: null,
        isSuccess: false,
        errorMessage: e.toString(),
      );
    }
  }

  // ============================================================
  // DELETE
  // ============================================================

  static Future<ApiResponse> deleteRequest(String appUrl, String? token) async {
    try {
      final Uri url = Uri.parse(appUrl);

      final Map<String, String> headers = {
        'Accept': 'application/json',
      };

      if (token != null && token.isNotEmpty) {
        headers['token'] = token;
      }

      final Response response = await delete(
        url,
        headers: headers,
      );

      _logger.i('DELETE: $appUrl');
      _logger.i('Status: ${response.statusCode}');
      _logger.i('Response: ${response.body}');

      final responseData = _decodeResponse(response.body);

      if (response.statusCode >= 200 && response.statusCode < 300) {
        return ApiResponse(
          responseCode: response.statusCode,
          responseData: responseData,
          isSuccess: true,
        );
      }

      return ApiResponse(
        responseCode: response.statusCode,
        responseData: responseData,
        isSuccess: false,
        errorMessage: response.body,
      );
    } catch (e, stackTrace) {
      _logger.e(
        'DELETE Error: $e',
        error: e,
        stackTrace: stackTrace,
      );

      return ApiResponse(
        responseCode: 500,
        responseData: null,
        isSuccess: false,
        errorMessage: e.toString(),
      );
    }
  }

  // ============================================================
  // JSON Decode Helper
  // ============================================================

  static dynamic _decodeResponse(String body) {
    if (body.isEmpty) {
      return null;
    }

    try {
      return jsonDecode(body);
    } catch (_) {
      return body;
    }
  }
}
