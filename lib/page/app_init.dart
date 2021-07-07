import 'package:bloc_test/bloc/auth_bloc.dart';
import 'package:bloc_test/bloc/gift_bloc.dart';
import 'package:bloc_test/bloc/loading_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/*
* 해당 파일에서는 전체적으로 사용할 파일들을 선언해주고 등록한다.
* 모든 Bloc 등록 후 Splash Widget 에서 나머지 필요한 부분들 (로그인 등)을 설정한다.
* */

class AppInitializer extends StatefulWidget {

  final Widget childWidget;
  AppInitializer({required this.childWidget});

  @override
  _AppInitializerState createState() => _AppInitializerState();
}

class _AppInitializerState extends State<AppInitializer> {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => LoadingBloc()),
        BlocProvider(create: (_) => AuthBloc()),
      ],
      child: widget.childWidget,
    );
  }
}
