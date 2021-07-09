import 'dart:io';

import 'package:bloc_test/bloc/bloc_cubit.dart';
import 'package:bloc_test/page/home_page.dart';
import 'package:bloc_test/page/splash/android_spalsh.dart';
import 'package:bloc_test/page/splash/ios_spalsh.dart';
import 'package:bloc_test/routes/routes.dart';
import 'package:bloc_test/service/service_locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'cubit_page.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    GlobalKey<NavigatorState> navigatorKey = context.read<GlobalKey<NavigatorState>>();
    return MaterialApp(
      theme: ThemeData(

        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      builder: (context, child){
        return ScrollConfiguration(
            behavior: MyBehavior(),
            child: child!
        );
      },
      navigatorKey: navigatorKey,
      home: Platform.isAndroid ? AndroidSplashPage() : IOSSplashPage(),
      routes: getIt<Routes>().list
    );
  }
}

class MyBehavior extends ScrollBehavior {
  @override
  Widget buildViewportChrome(
      BuildContext context, Widget child, AxisDirection axisDirection) {
    return child;
  }
}