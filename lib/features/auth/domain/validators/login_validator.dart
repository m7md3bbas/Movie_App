class LoginValidator {
  String? validateEmail({required String email}) {
    if (email.isEmpty) {
      return "email can't be empty";
    }
    if (!email.contains('@')) {
      return "Invalid email format";
    }
    return null;
  }

  String? validatePassword({required String password}) {
    if (password.isEmpty) {
      return "password can't be empty";
    }
    if (password.length < 6) {
      return "password must be at least 6 characters";
    }
    return null;
  }
}
