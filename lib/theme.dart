import 'package:flutter/material.dart';

class AppTheme extends ChangeNotifier{
bool isDark = false;
  Color backgroundColor = Colors.white;
  Color mainColor = Colors.pinkAccent;
  Color cardColor = Colors.pink[100];
  Color mainText = Colors.black;
  Color greyText = Colors.grey;

  void setDarkTheme(){
    backgroundColor = Colors.deepOrange[900];
    mainColor = Colors.orange[300];
    cardColor = Colors.orange[700];
    mainText = Colors.white;
    greyText = Colors.grey[300];
    isDark = true;
    notifyListeners();
  }
  void setLightTheme(){
    backgroundColor = Colors.white;
    mainText = Colors.black;
     mainColor = Colors.pinkAccent;
     cardColor = Colors.pink[100];
    greyText = Colors.grey;
     isDark = false;
     notifyListeners();

  }
}