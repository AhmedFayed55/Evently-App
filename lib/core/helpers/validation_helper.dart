class ValidationHelper {
  ValidationHelper._();

  static String? validateEmail(String? val) {
    if (val == null || val.trim().isEmpty) {
      return 'This field is required';
    }
    RegExp emailRegex = RegExp(
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+",
    );
    if (!emailRegex.hasMatch(val)) {
      return 'Please enter a valid email';
    }
    return null;
  }

  static String? validatePassword(String? val) {
    if (val == null || val.trim().isEmpty) {
      return 'This field is required';
    }
    RegExp passwordRegex = RegExp(
      r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$',
    );
    if (val.length < 8 || !passwordRegex.hasMatch(val)) {
      return "Please enter a strong password";
    }
    return null;
  }

  static String? validateConfirmPassword(String? val, String password) {
    if (val == null || val.trim().isEmpty) {
      return 'Confirm Password cannot be empty';
    }
    if (val != password) {
      return 'Passwords do not match';
    }
    return null;
  }
}
