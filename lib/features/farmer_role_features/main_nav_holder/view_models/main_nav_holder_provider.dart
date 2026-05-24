import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class MainNavHolderProvider extends ChangeNotifier {
  int _currentIndex = 0;
  int get currentIndex => _currentIndex;

  set currentIndex(int index) {
    _currentIndex = index;
    notifyListeners();
  }

  final List<Widget> _screens = <Widget>[
    Center(child: Text("Home")),
    Center(child: Text("Unit")),
    Center(child: Text("Market")),
    Center(child: Text("Profile")),
    Container(color: Colors.red),
    Container(color: Colors.red),
    Container(color: Colors.red),
    Container(color: Colors.red),
  ];
  List<Widget> get screens => _screens;
}
