import 'package:flutter/foundation.dart';

class OtpVerificationProvider extends ChangeNotifier {
  int timer = 120;

  void startTimer() {
    timer = 120;
    notifyListeners();
  }

  void decrementTimer() {
    timer -= 1;
    notifyListeners();
  }

  void resetTimer() {
    timer = 120;
  }
}
