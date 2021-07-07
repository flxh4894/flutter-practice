import 'dart:io';

import 'package:bloc_test/bloc/bloc_cubit.dart';
import 'package:bloc_test/page/splash/android_spalsh.dart';
import 'package:bloc_test/page/splash/ios_spalsh.dart';
import 'package:bloc_test/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'cubit_page.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Platform.isAndroid ? AndroidSplashPage() : IOSSplashPage(),
      routes: Routes.list,
    );
  }
}