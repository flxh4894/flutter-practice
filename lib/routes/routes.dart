import 'package:bloc_test/page/cubit_page.dart';
import 'package:bloc_test/page/home_page.dart';
import 'package:flutter/cupertino.dart';

/*
* RoutePath 관리
* 모든 페이지에 대한 RoutePath 가 있음
* */
class Routes{
  static Map<String, Widget Function(BuildContext)> get list => {
    HomePage.routePath: (_) => HomePage(),
    CubitPage.routePath: (_) => CubitPage()
  };
}