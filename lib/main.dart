import 'package:flutter/material.dart';
import 'package:loginapp/pages/home.dart';
import 'package:loginapp/pages/loading.dart';
import 'package:loginapp/loginPage/view.dart';

void main() => runApp(MaterialApp(
    initialRoute: '/',
    routes: {
      '/': (context) => Login(),
      '/loading': (context) => Loading(),
      '/home': (context) => Home(),
    }
));