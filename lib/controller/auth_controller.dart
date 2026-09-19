import 'package:flutter_batch16/export.dart';

class AuthController {
  Logger logger = Logger();

  static String? token;
  static UserModel? userData;

  /// Save token and user data

  static Future<void> saveData(
    UserModel model,
    String tokenValue,
  ) async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    Logger logger = Logger();

    await sharedPreferences.setString('token', tokenValue);

    await sharedPreferences.setString('user-data', jsonEncode(model.toJson()));

    token = tokenValue;
    logger.i(token);
    userData = model;
    logger.i(userData.toString());
  }

  /// Get saved token and user data
  static Future<void> getData() async {
    Logger logger = Logger();
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();

    final String? savedToken = sharedPreferences.getString('token');

    if (savedToken != null && savedToken.isNotEmpty) {
      token = savedToken;
      logger.i(token);
    }

    final String? savedUserData = sharedPreferences.getString('user-data');

    if (savedUserData != null && savedUserData.isNotEmpty) {
      userData = UserModel.fromJson(
        jsonDecode(savedUserData),
      );
      logger.i(userData.toString());
    }
  }

  /// Check user login status
  static Future<bool> isUserLogin() async {
    Logger logger = Logger();
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();

    final String? savedToken = sharedPreferences.getString('token');
    logger.i(savedToken.toString());
    return savedToken != null && savedToken.isNotEmpty;
  }

  static Future clearTokenAndData() async {
    Logger logger = Logger();
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    await sharedPreferences.remove('token');
    await sharedPreferences.remove('user-data');
    token = null;
    userData = null;
    logger.i(token);
    logger.i(userData);
  }
}
