import 'package:flutter/cupertino.dart';

class RegisterProvider extends ChangeNotifier {
  bool _isPasswordObscure = true;
  bool _isConfirmPasswordObscure = true;
  bool _isTermsAccepted = false;

  bool get isPasswordObscure => _isPasswordObscure;

  bool get isConfirmPasswordObscure => _isConfirmPasswordObscure;

  bool get isTermsAccepted => _isTermsAccepted;

  void togglePasswordObscure() {
    _isPasswordObscure = !_isPasswordObscure;
    notifyListeners();
  }

  void toggleConfirmPasswordObscure() {
    _isConfirmPasswordObscure = !_isConfirmPasswordObscure;
    notifyListeners();
  }

  void toggleTermsAccepted() {
    _isTermsAccepted = !_isTermsAccepted;
    notifyListeners();
  }
}
