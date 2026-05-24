import 'package:flutter/foundation.dart';

class SetPasswordProvider extends ChangeNotifier {
  bool _isPasswordObsecure = false;
  bool _isConfirmPasswordObsecure = false;

  bool get isPasswordObsecure => _isPasswordObsecure;

  bool get isConfirmPasswordObsecure => _isConfirmPasswordObsecure;

  set setIsPasswordObsecure(bool value) {
    _isPasswordObsecure = value;
    notifyListeners();
  }

  set setIsConfirmPasswordObsecure(bool value) {
    _isConfirmPasswordObsecure = value;
    notifyListeners();
  }
}
