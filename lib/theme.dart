import 'package:flutter/material.dart';

class AppTheme extends ChangeNotifier{
  AppTheme(bool isDark){
    this.isDark = isDark;
    isDark ? setDarkTheme() : setLightTheme();
  }
  bool isDark;
  Color backgroundColor;
  Color mainColor;
  Color cardColor;
  Color mainText;
  Color greyText;
  Color appBarTitle;
  Color appBarColor;


  void setDarkTheme(){
    backgroundColor = Colors.deepOrange[900];
    mainColor = Colors.orange[100];
    cardColor = Colors.orange[700];
    mainText = Colors.white;
    greyText = Colors.grey[300];
    isDark = true;
    appBarTitle = Colors.orange[100];
    appBarColor = Colors.deepOrange[700];
    notifyListeners();
  }
  void setLightTheme(){
    appBarTitle = Colors.white;
    backgroundColor = Colors.white;
    mainText = Colors.black;
     mainColor = Colors.pinkAccent;
     cardColor = Colors.pink[100];
    greyText = Colors.grey;
    appBarColor = Colors.pink[900];
     isDark = false;
     notifyListeners();

  }
}