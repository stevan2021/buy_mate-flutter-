import 'package:flutter/material.dart';

class BottomNavigationProvider with ChangeNotifier{
  int bottomIndex = 3;
  void changeIndex({int index}){
    bottomIndex = index;
    notifyListeners();
  }

}