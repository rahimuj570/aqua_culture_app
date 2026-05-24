import 'package:aqua_culture_app/features/farmer_role_features/home/views/screens/farmer_home_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class FarmerMainNavHolderProvider extends ChangeNotifier {
  int _currentIndex = 0;
  int get currentIndex => _currentIndex;

  set currentIndex(int index) {
    _currentIndex = index;
    notifyListeners();
  }

  final List<Widget> _screens = <Widget>[
    FarmerHomeScreen(),
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
