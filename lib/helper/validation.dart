class Validation {
  static String validatePass(String pass) {
    if (pass == null) return "Password Invalid";
    if (pass.length < 6) return "Password require mininum 6 characters";
    return null;
  }

  static String validateEmail(String email) {
    if (email == null) return "Email Invalid";
    final bool isValid = RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(email);

    if (!isValid) return "Email Invalid";
    return null;
  }
}
