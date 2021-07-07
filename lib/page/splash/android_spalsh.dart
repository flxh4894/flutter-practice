import 'package:bloc_test/bloc/auth_bloc.dart';
import 'package:bloc_test/page/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AndroidSplashPage extends StatefulWidget {
  @override
  _AndroidSplashPageState createState() => _AndroidSplashPageState();
}

class _AndroidSplashPageState extends State<AndroidSplashPage> {

  @override
  void initState() {
    super.initState();
    init();
  }

  init() async {
    await Future.delayed(Duration(seconds: 1));
    final _authBloc = BlocProvider.of<AuthBloc>(context);
    _authBloc.userLoginStatus();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      type: MaterialType.transparency,
      child: Container(
        alignment: Alignment.center,
        color: Colors.blue,
        child: Text('Android Splash Screen : 1second'),
      ),
    );
  }
}
