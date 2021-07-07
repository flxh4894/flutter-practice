import 'package:bloc/bloc.dart';
import 'package:bloc_test/page/home_page.dart';
import 'package:flutter/cupertino.dart';

/*
* cubit
* */
class AuthBloc extends Cubit<AuthState>{
  AuthBloc() : super(AuthState()) {
    print('???');
  }

  void userLoginStatus(BuildContext context) async {
    print('유저 로그인 확인중 ... ');
    await Future.delayed(Duration(seconds: 2));
    print('유저 로그인 확인되었습니다!');
    emit(state);
    Navigator.pushNamedAndRemoveUntil(context, HomePage.routePath, (route) => false);
  }

}

/*
* state
* */
class AuthState{}


