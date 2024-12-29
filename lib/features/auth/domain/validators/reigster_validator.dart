class ReigsterValidator {
  String? validateName({required String fname, required String lname}) {
    if (fname.isEmpty || lname.isNotEmpty) {
      return "name is required";
    }
    if (fname.length > 15) {
      return "First name must be less than 15 characters";
    }
    if (lname.length > 15) {
      return "Last name must be less than 15 characters";
    }
    return null;
  }

  String? validateEmail({required String email}) {
    if (email.isEmpty) {
      return "Email can't be empty";
    }
    if (!email.contains('@')) {
      return "Invalid email format";
    }
    return null;
  }

  String? validatePassword({required String password}) {
    if (password.isEmpty) {
      return "Password can't be empty";
    }
    if (password.length < 6) {
      return "Password must be at least 6 characters";
    }
    return null;
  }

  String? validatePhone({required String phone}) {
    if (phone.isEmpty) {
      return "Phone field is required";
    }
    if (phone.length > 11) {
      return "Invalid phone number";
    }
    if (!phone.startsWith("0")) {
      return " Not available ";
    }
    return null;
  }
}
