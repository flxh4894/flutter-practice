import 'package:flutter/material.dart';

class IOSSplashPage extends StatefulWidget {
  @override
  _IOSSplashPageState createState() => _IOSSplashPageState();
}

class _IOSSplashPageState extends State<IOSSplashPage> {
  @override
  Widget build(BuildContext context) {
    return Material(
      type: MaterialType.transparency,
      child: Container(
        color: Colors.red,
      ),
    );
  }
}
