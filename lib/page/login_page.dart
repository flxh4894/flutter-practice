import 'package:bloc_test/bloc/auth_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginPage extends StatefulWidget {

  static String routePath = '/login';

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  String id = '';
  String pw = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('로그인'),
      ),
      body: Form(
        key: _formKey,
        child: Column(
          children: [
            TextFormField(
              decoration: InputDecoration(
                hintText: '아이디'
              ),
              validator: (value){ return null; },
              onSaved: (val){
                if(val != null && val != '')
                  this.id = val;
              },
            ),
            TextFormField(
              decoration: InputDecoration(
                  hintText: '비밀번호'
              ),
              validator: (value){ return null; },
              onSaved: (val){
                if(val != null && val != '')
                  this.pw = val;
              },
            ),
            ElevatedButton(onPressed: () {
              if(this._formKey.currentState!.validate()){
                this._formKey.currentState!.save();
              }
              BlocProvider.of<AuthBloc>(context).userDoLogin(context, id, pw, false);
            }, child: Text('로그인'))
          ],
        ),
      ),
    );
  }
}
