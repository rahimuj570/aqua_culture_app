import 'package:flutter/foundation.dart';

class AuthProvider extends ChangeNotifier {
  bool _isFarmer = true;

  bool get getIsFarmer => _isFarmer;

  set setIsFarmer(bool value) {
    _isFarmer = value;
    notifyListeners();
  }
}
