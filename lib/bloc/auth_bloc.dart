import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:bloc_test/page/home_page.dart';
import 'package:bloc_test/page/login_page.dart';
import 'package:bloc_test/repository/auth_repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

/*
* cubit
* */
class AuthBloc extends Cubit<AuthState> {
  AuthBloc({required AuthRepository authRepository, required GlobalKey<NavigatorState> rootNavigatorKey})
      : _authRepository = authRepository,
        _rootNavigatorKey = rootNavigatorKey,
        super(AuthState(deviceInfo: null));

  final AuthRepository _authRepository;
  final GlobalKey<NavigatorState> _rootNavigatorKey;

  // 앱 초기화 이벤트
  void appInit() {}

  // 유저 로그인 상태 확인
  void userLoginStatus(BuildContext context) async {
    print('디바이스 정보 확인중...');
    var deviceInfo = await _authRepository.deviceInfo();
    this.state.deviceInfo = deviceInfo.toString();
    emit(state);

    print('디바이스 정보 >>> $deviceInfo');

    print('유저 정보 확인중...');
    await _authRepository.loadLoginInfo();
    print('유저 정보 >>> ${_authRepository.loginInfo}');

    // 토큰에 따른 로그인 분기
    if (_authRepository.loginInfo == null) {
      print('유저 로그인 정보가 없습니다.');
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('유저 로그인 정보가 없습니다.')));
      Navigator.pushNamedAndRemoveUntil(context, LoginPage.routePath, (route) => false);
    } else {
      Map<String, dynamic> user = JsonDecoder().convert(_authRepository.loginInfo!);
      print('환영합니다! ${user['id']} 님!');
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('환영합니다! ${user['id']}님!')));
      _rootNavigatorKey.currentState!.pushNamedAndRemoveUntil(HomePage.routePath, (route) => false);
    }
  }

  // 아이디, 비밀번호 로그인
  void userDoLogin(BuildContext context, String id, String pw, bool status) async {
    print('로그인 진행중...');
    await Future.delayed(Duration(seconds: 1)); // 서버 통신 시간

    if(status){
      String token = JsonEncoder().convert({'id':id, 'pw':pw, 'device': state.deviceInfo});
      print('서버에서 넘어온 유저 토큰 >>> $token');
      await _authRepository.saveLoginInfo(token);

      print('토큰 저장 성공!');
      Navigator.pushNamedAndRemoveUntil(context, HomePage.routePath, (route) => false);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('아이디 혹은 비밀번호를 확인해 주세요.')));
    }


  }
}

/*
* state
* */
class AuthState {
  String? deviceInfo;

  AuthState({required this.deviceInfo});
}
