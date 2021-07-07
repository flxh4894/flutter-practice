import 'package:bloc/bloc.dart';

/*
* cubit
* */
class AuthBloc extends Cubit<AuthState>{
  AuthBloc() : super(AuthState()) {
    print('???');
  }

  void userLoginStatus() async {
    print('유저 로그인 확인중 ... ');
    await Future.delayed(Duration(seconds: 2));
    print('유저 로그인 확인되었습니다!');
    emit(state);
  }

}

/*
* state
* */
class AuthState{}


