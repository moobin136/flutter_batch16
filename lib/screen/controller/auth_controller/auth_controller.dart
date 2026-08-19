





import '../../../core/network/shared_pref_service.dart';

class AuthController {
  // Private Constructor (Prevent Instantiation)
  AuthController._();

  // In-Memory Cached Variables
  static String? firstName;
  static String? lastName;
  static String? email;
  static String? mobile;
  static String? token;

  /// Check if user has a valid active session
  static Future<bool> isLoggedIn() async {
    await loadAuthData();
    return token != null && token!.isNotEmpty;
  }

  /// Save session data to both Local Storage & In-Memory State
  static Future<void> saveAuthData({
    required String? userFirstName,
    required String? userLastName,
    required String? userEmail,
    required String? userMobile,
    required String? userToken,
  }) async {
    // 1. Assign to In-Memory Variables
    firstName = userFirstName ?? '';
    lastName = userLastName ?? '';
    email = userEmail ?? '';
    mobile = userMobile ?? '';
    token = userToken ?? '';

    // 2. Persist to Local Storage
    await SharedPrefService.saveUserData(
      firstName: firstName!,
      lastName: lastName!,
      email: email!,
      mobile: mobile!,
      token: token!,
    );
  }

  /// Read stored data from Local Storage into In-Memory State
  static Future<void> loadAuthData() async {
    final data = await SharedPrefService.getUserData();

    firstName = data['firstName'];
    lastName = data['lastName'];
    email = data['email'];
    mobile = data['mobile'];
    token = data['token'];
  }

  /// Clear session state from Memory and Storage (Logout)
  static Future<void> clearAuthData() async {
    await SharedPrefService.clearAllData();

    firstName = null;
    lastName = null;
    email = null;
    mobile = null;
    token = null;
  }
}
