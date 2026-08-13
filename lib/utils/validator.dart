class Validator {
  static String? validator(String? errorMeg, String? value) {
    if (value == null || value.trim().isEmpty) {
      return errorMeg;
    } else {
      return null;
    }
  }
}
