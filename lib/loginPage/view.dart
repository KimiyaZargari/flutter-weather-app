import 'package:flutter/material.dart';
import 'package:loginapp/loginPage/controller.dart';
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


  @override
  Widget build(BuildContext context) {
    data = ModalRoute.of(context).settings.arguments;
    bool _isDark = data != null ? data['isDark'] : false;
    LoginPageController controller = LoginPageController(_isDark);



    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => controller),
        ChangeNotifierProvider(create: (context) => AppTheme(controller.loginPageModel.isDark)),
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
                    Consumer<LoginPageController>(
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
                                        validator: controller.validateEmail(),
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
                                            validator: controller.validatePassword(),
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
                    Consumer<LoginPageController>(
                      builder: (context, loginInfo, child) => RaisedButton(
                        child: Text(
                          'Sign in',
                          style: TextStyle(color: Colors.white),
                        ),
                        color: appTheme.mainColor,
                        onPressed: () {
                          if (_formKey.currentState.validate()) {
                            _formKey.currentState.save();
                            controller.navigateToLoading(context, loginInfo.email,  loginInfo.password);

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

}
