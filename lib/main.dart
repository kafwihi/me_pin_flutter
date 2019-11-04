import 'package:flutter/material.dart';

import 'Register.dart';
//register form
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Color(0xFFFB415B),

      ),
      home: new RegisterPage(),
    );
  }
}
