import 'package:bloc_test/bloc/bloc_cubit.dart';
import 'package:bloc_test/bloc/user_bloc.dart';
import 'package:bloc_test/model/user.dart';
import 'package:bloc_test/page/cubit_page.dart';
import 'package:bloc_test/page/firebase_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  static String routePath = '/home';

  final TextEditingController _name = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => UserBloc(),
      child: Scaffold(
        appBar: AppBar(
          title: Text('Samsung Health'),
          elevation: 0,
          centerTitle: true,
        ),
        body: BlocBuilder<UserBloc, UserState>(
          builder: (context, state) {
            return Container(
              alignment: Alignment.center,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  _infoText('Firebase FCM'),
                  ElevatedButton(onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => FirebasePage()));
                  }, child: Text('Firebase 페이지')),

                  _infoText('Bloc Test'),
                  ElevatedButton(onPressed: () {

                  }, child: Text('Bloc 페이지')),

                  _infoText('Cubit Test'),
                  ElevatedButton(onPressed: () {
                    Navigator.pushNamed(context, '/cubit', arguments: '안녕하세용?');
                  }, child: Text('Cubit 페이지')),

                  _infoText('Samsung Health'),
                  ElevatedButton(onPressed: () {
                    Navigator.pushNamed(context, '/cubit' , arguments: BlocProvider(create: (_) => GiftCubit()));
                  }, child: Text('삼성헬스 페이지')),

                  _infoText('라우트 테스트'),
                  ElevatedButton(onPressed: () {
                  }, child: Text('삼성헬스 페이지')),

                  _infoText('탭컨트롤러 테스트'),
                  ElevatedButton(onPressed: () {
                    Navigator.pushNamed(context, '/tab');
                  }, child: Text('탭컨트롤러 페이지'))
                  


                ],
              ),
            );
          }
        ),
        floatingActionButton: BlocBuilder<UserBloc, UserState>(
          builder: (context, state) => Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              FloatingActionButton(
                heroTag: '1',
                child: const Icon(Icons.add),
                onPressed: () => ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('...??'),duration: Duration(seconds: 1),))
                // onPressed: () => context.read<UserBloc>().add(AddUser(user: new User(name: _name.text, age: 30))),
              ),
              FloatingActionButton(
                heroTag: '2',
                child: const Icon(Icons.remove),
                onPressed: () => context.read<UserBloc>().add(RemoveUser(user: new User(name: _name.text, age: 30))),
              ),
            ],
          )
        ),
      ),
    );
  }

  Container _infoText(String text) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Text(text, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold) ),
    );
  }
}
