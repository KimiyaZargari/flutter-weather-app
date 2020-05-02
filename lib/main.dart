import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
      home: Home(),
    ));

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _autoValidate = false;
  bool hidePassword = true;
  String email, password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Container(
          child: Padding(
            padding: new EdgeInsets.fromLTRB(30.0, 60, 20, 30),
            child: Form(
              autovalidate: _autoValidate,
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
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
                      fontSize: 15,
                      letterSpacing: 1.0,
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Card(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.fromLTRB(3, 3, 3, 0),
                              child: Icon(
                                Icons.account_circle,
                                color: Colors.pinkAccent,
                              ),
                            ),
                            Text(
                              'Username',
                            ),
                          ],
                        ),
                        Padding(
                          padding: EdgeInsets.fromLTRB(30.0, 0, 0, 3),
                          child: TextFormField(
                            keyboardType: TextInputType.emailAddress,
                            validator: validateEmail,
                            onSaved: (String val) {
                              email = val;
                            },
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: 'enter your username',
                                hintStyle: TextStyle(
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
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.fromLTRB(3, 3, 3, 0),
                              child: Icon(
                                Icons.account_circle,
                                color: Colors.pinkAccent,
                              ),
                            ),
                            Text(
                              'Password',
                            ),
                          ],
                        ),
                        Row(children: <Widget>[
                          SizedBox(
                            width: 250,
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(30.0, 0, 3, 0),
                              child: TextFormField(
                                obscureText: hidePassword,
                                validator: validatePassword,
                                onSaved: (String val) {
                                  password = val;
                                },
                                decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: 'enter your password',
                                    hintStyle: TextStyle(
                                      fontSize: 12.0,
                                    )),
                              ),
                            ),
                          ),
                          IconButton(
                            icon: Icon(Icons.remove_red_eye,
                                size: 20, color: Colors.pinkAccent),
                            onPressed: () {
                              setState(() => hidePassword = !hidePassword);
                            },
                          ),
                        ]),
                      ],
                    ),
                  ),
                  Row(
                    children: <Widget>[
                      Checkbox(
                        value: false,
                        onChanged: (bool value) {},
                      ),
                      Text(
                        'Remember me?',
                        style: TextStyle(
                          color: Colors.grey[600],
                          fontSize: 12,
                        ),
                      ),
                      SizedBox(
                        width: 70,
                      ),
                      Text(
                        'Forgot Password?',
                        style: TextStyle(
                          color: Colors.pinkAccent,
                          fontSize: 12,
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  RaisedButton(
                    child: Text(
                      'Sign in',
                      style: TextStyle(color: Colors.white),
                    ),
                    color: Colors.pinkAccent,
                    onPressed: _validateInputs,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Center(
                    child: Text(
                      'Dont have an account yet?',
                      style: TextStyle(
                        color: Colors.grey,
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
                          color: Colors.pink[100],
                          blurRadius: 10,
                        )
                      ],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(5, 0, 5, 0),
                      child: RaisedButton(
                        child: Text(
                          'Create Account',
                          style: TextStyle(color: Colors.pinkAccent),
                        ),
                        color: Colors.white,
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
                        color: Colors.grey,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _validateInputs() {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();
    } else {
      setState(() => _autoValidate = true);
    }
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
