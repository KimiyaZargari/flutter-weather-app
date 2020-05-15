import 'package:flutter/cupertino.dart';

import 'model.dart';

class LoginPageController  extends ChangeNotifier{
  LoginPageModel loginPageModel;

  LoginPageController(bool isDark) {
    loginPageModel = LoginPageModel();
    loginPageModel.isDark = isDark;
  }

  Function validatePassword() {
    return (String value) {
      if (value.length <= 6) return 'Password must be at least 7 characters';
      return null;
    };
  }

  Function validateEmail() {
    return (String value) {
      Pattern pattern =
          r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
      RegExp regex = new RegExp(pattern);
      if (!regex.hasMatch(value)) return 'Enter Valid Email';
      return null;
    };
  }

  void navigateToLoading(context, String email, String password) {
    Navigator.pushReplacementNamed(context, '/loading',
        arguments: {
          'email': email,
          'password': password,
          'isDark': loginPageModel.isDark,
        });
  }

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
