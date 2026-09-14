class AppUrl {
  static const String _baseUrl = 'https://task-manager-api.ostad.live/api/v1';
  static const String login = '$_baseUrl/Login';
  static const String register = '$_baseUrl/Registration';
  static const String profileUpdate = '$_baseUrl/ProfileUpdate';
  static const String profileDetails = '$_baseUrl/ProfileDetails';

  static String recoverVerifyEmail(String email) =>
      '$_baseUrl/RecoverVerifyEmail/$email';

  static String recoverVerifyOtp(String email, int otp) =>
      '$_baseUrl/RecoverVerifyEmail/$email/$otp';
  static const String recoverResetPassword = '$_baseUrl/RecoverResetPassword';
  static const String createTask = '$_baseUrl/createTask';
  static  String deleteTask (String id)=> '$_baseUrl/deleteTask/$id';
}
