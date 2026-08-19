// lib/core/services/shared_pref_service.dart

import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefService {
  SharedPrefService._();

  static const String _firstNameKey = 'user_first_name';
  static const String _lastNameKey = 'user_last_name';
  static const String _emailKey = 'user_email';
  static const String _mobileKey = 'user_mobile';
  static const String _tokenKey = 'user_token';

  static Future<bool> saveUserData({
    required String firstName,
    required String lastName,
    required String email,
    required String mobile,
    required String token,
    //
  }) async {
    final prefs = await SharedPreferences.getInstance();
    final results = await Future.wait([
      prefs.setString(_firstNameKey, firstName),
      prefs.setString(_lastNameKey, lastName),
      prefs.setString(_emailKey, email),
      prefs.setString(_mobileKey, mobile),
      prefs.setString(_tokenKey, token),
    ]);

    return results.every((element) => element == true);
  }

  static Future<Map<String, String?>> getUserData() async {
    final prefs = await SharedPreferences.getInstance();
    return {
      'firstName': prefs.getString(_firstNameKey),
      'lastName': prefs.getString(_lastNameKey),
      'email': prefs.getString(_emailKey),
      'mobile': prefs.getString(_mobileKey),
      'token': prefs.getString(_tokenKey),
    };
  }

  static Future<bool> clearAllData() async {
    final prefs = await SharedPreferences.getInstance();
    return await prefs.clear();
  }
}
