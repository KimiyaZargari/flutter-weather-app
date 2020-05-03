import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoginModel extends ChangeNotifier {
  bool _hidePassword = true;

  bool get hidePassword => _hidePassword;

  set hidePassword(bool hidePassword) {
    _hidePassword = hidePassword;
    notifyListeners();
  }
  bool _autoValidate = false;

  bool get autoValidate => _autoValidate;

  set autoValidate(bool autoValidate) {
    _autoValidate = autoValidate;
    notifyListeners();
  }
  String _email;

  String get email => _email;

  set email(String email) {
    _email = email;
    notifyListeners();
  }

  String _password;

  String get password => _password;

  set password(String password) {
    _password = password;
    notifyListeners();
  }

}