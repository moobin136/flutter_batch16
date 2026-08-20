import 'package:shared_preferences/shared_preferences.dart';

class AuthController {
  AuthController._();

  static final AuthController authObject = AuthController._();
  String? email0, firstName0, lastName0, mobile0, token0;


  Future<void> saveDataUser({
    required String email,
    required String firstName,
    required String lastName,
    required String mobile,
    required String token,
  }) async {
    final SharedPreferences sharedPreferences =
    await SharedPreferences.getInstance();

    await sharedPreferences.setString('email', email);
    await sharedPreferences.setString('firstName', firstName);
    await sharedPreferences.setString('lastName', lastName);
    await sharedPreferences.setString('mobile', mobile);
    await sharedPreferences.setString('token', token);

    email0 = email;
    firstName0 = firstName;
    lastName0 = lastName;
    mobile0 = mobile;
    token0 = token;
  }

  // ২. ডাটা রিড করার মেথড (প্যারামিটার তুলে দিয়ে সরাসরি Key বসানো হয়েছে)
  Future<void> getUserData() async {
    final SharedPreferences sharedPreferences =
    await SharedPreferences.getInstance();

    email0 = sharedPreferences.getString('email');
    firstName0 = sharedPreferences.getString('firstName');
    lastName0 = sharedPreferences.getString('lastName');
    mobile0 = sharedPreferences.getString('mobile');
    token0 = sharedPreferences.getString('token');
  }

  // ৩. ডাটা ক্লিয়ার করার মেথড
  Future<void> clearUserData() async {
    final SharedPreferences sharedPreferences =
    await SharedPreferences.getInstance();

    await sharedPreferences.clear();

    email0 = null;
    firstName0 = null;
    lastName0 = null;
    mobile0 = null;
    token0 = null;
  }

  // ৪. লগইন স্ট্যাটাস চেক (আগে getUserData কল করা হচ্ছে)
  Future<bool> isLogin() async {
    await getUserData(); // Local Storage থেকে ডাটা মেমোরিতে লোড করে নেবে
    return token0 != null && token0!.isNotEmpty;
  }
}