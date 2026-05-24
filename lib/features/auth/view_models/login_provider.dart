import 'package:flutter/foundation.dart';

class LoginProvider extends ChangeNotifier {
  bool _isPasswordObscure = true;

  bool get isPasswordObscure => _isPasswordObscure;

  void togglePasswordObscure() {
    _isPasswordObscure = !_isPasswordObscure;
    notifyListeners();
  }
}
