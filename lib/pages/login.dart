import 'package:flutter/material.dart';
import 'package:loginapp/loginModel.dart';
import 'package:loginapp/theme.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());
Map data = {};

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Login(),
    );
  }
}


class Login extends StatelessWidget {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool isDark;
  bool switchOn = false;

  @override
  Widget build(BuildContext context) {
    data = ModalRoute.of(context).settings.arguments;
    isDark = data != null ? data['isDark'] : false;
    print("log $isDark");


    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => LoginModel()),
        ChangeNotifierProvider(create: (context) => AppTheme(isDark)),
      ],
      child: Consumer<AppTheme>(
        builder: (_, appTheme, __) => Scaffold(
          backgroundColor: appTheme.backgroundColor,
          body: SingleChildScrollView(
            child: Container(
              child: Padding(
                padding: new EdgeInsets.fromLTRB(30.0, 30, 20, 30),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Align(
                     alignment: Alignment.centerRight,
                      child: Switch(
                          value: appTheme.isDark,
                          activeColor: Colors.deepOrange,
                          onChanged: (bool value) {
                            if (!appTheme.isDark)
                              appTheme.setDarkTheme();
                            else
                              appTheme.setLightTheme();
                          }),
                    ),
                    Image.asset(
                      'assets/logo.png',
                      width: 30,
                      height: 30,
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Text(
                      'Welcome back,',
                      style: TextStyle(
                        color: appTheme.mainText,
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 2.0,
                      ),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Text(
                      'sign in to continue,',
                      style: TextStyle(
                        color: appTheme.mainText,
                        fontSize: 15,
                        letterSpacing: 1.0,
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Consumer<LoginModel>(
                      builder: (context, loginInfo, child) => Form(
                          autovalidate: loginInfo.autoValidate,
                          key: _formKey,
                          child: Column(
                            children: <Widget>[
                              Card(
                                color: appTheme.cardColor,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment:
                                      CrossAxisAlignment.stretch,
                                  children: <Widget>[
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: <Widget>[
                                        Padding(
                                          padding: const EdgeInsets.fromLTRB(
                                              3, 3, 3, 0),
                                          child: Icon(
                                            Icons.account_circle,
                                            color: appTheme.mainColor,
                                          ),
                                        ),
                                        Text(
                                          'Username',
                                          style: TextStyle(
                                            color: appTheme.mainText
                                          ),
                                        ),
                                      ],
                                    ),
                                    Padding(
                                      padding:
                                          EdgeInsets.fromLTRB(30.0, 0, 0, 3),
                                      child: TextFormField(
                                        keyboardType: TextInputType.emailAddress,
                                        validator: validateEmail,
                                        onSaved: (String val) {
                                          loginInfo.email = val;
                                        },
                                        decoration: InputDecoration(
                                            border: InputBorder.none,
                                            hintText: 'enter your username',
                                            hintStyle: TextStyle(
                                              color: appTheme.greyText,
                                              fontSize: 12.0,
                                            )),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 18.0,
                              ),
                              Card(
                                color: appTheme.cardColor,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment:
                                      CrossAxisAlignment.stretch,
                                  children: <Widget>[
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: <Widget>[
                                        Padding(
                                          padding: const EdgeInsets.fromLTRB(
                                              3, 3, 3, 0),
                                          child: Icon(
                                            Icons.account_circle,
                                            color: appTheme.mainColor,
                                          ),
                                        ),
                                        Text(
                                          'Password',
                                          style: TextStyle(
                                              color: appTheme.mainText
                                          ),
                                        ),
                                      ],
                                    ),
                                    Row(children: <Widget>[
                                      SizedBox(
                                        width: 250,
                                        child: Padding(
                                          padding: const EdgeInsets.fromLTRB(
                                              30.0, 0, 3, 0),
                                          child: TextFormField(
                                            obscureText: loginInfo.hidePassword,
                                            validator: validatePassword,
                                            onSaved: (String val) {
                                              loginInfo.password = val;
                                            },
                                            decoration: InputDecoration(
                                                border: InputBorder.none,
                                                hintText: 'enter your password',
                                                hintStyle: TextStyle(
                                                  color: appTheme.greyText,
                                                  fontSize: 12.0,
                                                )),
                                          ),
                                        ),
                                      ),
                                      IconButton(
                                        icon: Icon(Icons.remove_red_eye,
                                            size: 20,
                                            color: appTheme.mainColor),
                                        onPressed: () {
                                          loginInfo.hidePassword =
                                              !loginInfo.hidePassword;
                                        },
                                      ),
                                    ]),
                                  ],
                                ),
                              ),
                            ],
                          )),
                    ),
                    Row(
                      children: <Widget>[
                        Expanded(
                          flex: 1,
                          child: Checkbox(
                            value: false,
                            onChanged: (bool value) {},
                          ),
                        ),
                        Expanded(
                          flex: 5,
                          child: Text(
                            'Remember me?',
                            style: TextStyle(
                              color: appTheme.greyText,
                              fontSize: 12,
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 3,
                          child: Text(
                            'Forgot Password?',
                            style: TextStyle(
                              color: appTheme.mainColor,
                              fontSize: 12,
                            ),
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Consumer<LoginModel>(
                      builder: (context, loginInfo, child) => RaisedButton(
                        child: Text(
                          'Sign in',
                          style: TextStyle(color: Colors.white),
                        ),
                        color: appTheme.mainColor,
                        onPressed: () {
                          if (_formKey.currentState.validate()) {
                            _formKey.currentState.save();
                            Navigator.pushReplacementNamed(context, '/loading',
                                arguments: {
                                  'email': loginInfo.email,
                                  'password': loginInfo.password,
                                  'isDark': appTheme.isDark
                                });
                          } else {
                            loginInfo.autoValidate = true;
                          }
                        },
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Center(
                      child: Text(
                        'Dont have an account yet?',
                        style: TextStyle(
                          color: appTheme.greyText,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 7,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        boxShadow: <BoxShadow>[
                          BoxShadow(
                            color: appTheme.cardColor,
                            blurRadius: 10,
                          )
                        ],
                      ),
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(5, 0, 5, 0),
                        child: RaisedButton(
                          color: appTheme.backgroundColor,
                          child: Text(
                            'Create Account',
                            style: TextStyle(color: appTheme.mainColor),
                          ),
                          onPressed: () {},
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Center(
                      child: Text(
                        'Terms and conditions',
                        style: TextStyle(
                          fontSize: 12,
                          color: appTheme.greyText,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  String validatePassword(String value) {
    if (value.length <= 6) return 'Password must be at least 7 characters';
    return null;
  }

  String validateEmail(String value) {
    Pattern pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = new RegExp(pattern);
    if (!regex.hasMatch(value)) return 'Enter Valid Email';
    return null;
  }
}
