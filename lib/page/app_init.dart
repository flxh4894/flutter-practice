import 'package:bloc_test/bloc/auth_bloc.dart';
import 'package:bloc_test/service/service_locator.dart';
import 'package:provider/provider.dart';
import 'package:bloc_test/bloc/loading_bloc.dart';
import 'package:bloc_test/repository/auth_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/*
* 해당 파일에서는 전체적으로 사용할 설정들을 선언해주고 등록한다.
* 설정 후 Splash Widget 에서 나머지 필요한 부분들 (로그인 등)을 설정한다.
* */
class AppInitializer extends StatefulWidget {

  final Widget childWidget;
  AppInitializer({required this.childWidget});

  @override
  _AppInitializerState createState() => _AppInitializerState();
}

class _AppInitializerState extends State<AppInitializer> {
  final GlobalKey<NavigatorState> rootNavigatorKey = getIt<GlobalKey<NavigatorState>>();
  final AuthRepository authRepository = AuthRepository();

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider<AuthRepository>.value(value: authRepository),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(create: (_) => LoadingBloc()),
          BlocProvider(create: (_) => AuthBloc(authRepository: authRepository, rootNavigatorKey: rootNavigatorKey)),
        ],
        child: Provider<GlobalKey<NavigatorState>>.value(
          value: rootNavigatorKey,
          child: widget.childWidget,
        ),
      ),
    );
  }
}
