import 'package:flutter/material.dart';

import 'authform.dart';

class AuthScreen extends StatefulWidget {
  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Color.fromARGB(100, 219, 87, 30),
      body: SingleChildScrollView(
          child: Container(
              width: width, height: height, child: Center(child: AuthForme()))),
    );
  }
}
