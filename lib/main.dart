import 'package:flutter/material.dart';
import 'home/homeView.dart';
import 'login/loginView.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LoginView(),
      // home: HomeView(),
    );
  }
}
