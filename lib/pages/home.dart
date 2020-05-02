import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  Map data = {};

  @override
  Widget build(BuildContext context) {
    data = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      appBar: AppBar(
        title: Text("Your Account"),
        backgroundColor: Colors.pinkAccent,
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Center(
                child: Text(
              'email:',
              style: TextStyle(fontSize: 20),
            )),
            SizedBox(
              height: 20,
            ),
            Center(
                child: Text(
              data['email'],
              style: TextStyle(fontSize: 40),
            )),
            SizedBox(
              height: 50,
            ),
            Center(
                child: Text(
              'password:',
              style: TextStyle(fontSize: 20),
            )),
            SizedBox(
              height: 20,
            ),
            Center(
                child: Text(data['password'], style: TextStyle(fontSize: 40)))
          ],
        ),
      ),
    );
  }
}
