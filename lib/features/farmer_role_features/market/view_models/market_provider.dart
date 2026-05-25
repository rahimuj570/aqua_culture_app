import 'package:flutter/cupertino.dart';

class MarketProvider extends ChangeNotifier {
  bool _isActiveTabSelected = true;

  bool get getIsActiveTabSelected => _isActiveTabSelected;

  set setIsActiveTabSelected(bool value) {
    _isActiveTabSelected = value;
    notifyListeners();
  }
}
