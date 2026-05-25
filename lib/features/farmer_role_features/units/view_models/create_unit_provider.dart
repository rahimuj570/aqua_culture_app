import 'package:flutter/cupertino.dart';

class CreateUnitProvider extends ChangeNotifier {
  String? _unitName;
  String? get unitName => _unitName;

  set setUnitName(String? value) {
    _unitName = value;
    notifyListeners();
  }

  String? _unitType;
  String? get unitType => _unitType;

  set setUnitType(String? value) {
    _unitType = value;
    notifyListeners();
  }

  String? _unitStatus;
  String? get unitSize => _unitStatus;

  set setUnitStatus(String? value) {
    _unitStatus = value;
    notifyListeners();
  }
}
