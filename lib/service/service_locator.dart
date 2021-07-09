import 'package:bloc_test/routes/routes.dart';
import 'package:flutter/cupertino.dart';
import 'package:get_it/get_it.dart';

/*
* 싱글톤으로 사용할 항목들 등록
* */
final getIt = GetIt.instance;

void singletonSetup() {
  getIt.registerSingleton<Routes>(Routes());
  getIt.registerSingleton<GlobalKey<NavigatorState>>(GlobalKey<NavigatorState>());
}