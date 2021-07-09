import 'package:bloc_test/page/cubit_page.dart';
import 'package:bloc_test/page/home_page.dart';
import 'package:bloc_test/page/login_page.dart';
import 'package:bloc_test/page/tab/tab_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/*
* RoutePath 관리
* 모든 페이지에 대한 RoutePath 가 있음
* */
class Routes {
  Map<String, Widget Function(BuildContext)> get list => {
    HomePage.routePath: (_) => HomePage(),
    CubitPage.routePath: (_) => CubitPage(),
    LoginPage.routePath: (_) => LoginPage(),
    TabControllerPage.routePath: (_) => TabControllerPage(),
  };
}
