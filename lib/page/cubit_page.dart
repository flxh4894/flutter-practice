import 'package:bloc_test/bloc/bloc_cubit.dart';
import 'package:device_info/device_info.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CubitPage extends StatefulWidget {
  static String routePath = '/cubit';
  @override
  _CubitPageState createState() => _CubitPageState();
}

class _CubitPageState extends State<CubitPage> {
  final TextEditingController _text = TextEditingController();


  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => GiftCubit()..printUseUser(),
      child: BlocBuilder<GiftCubit, GiftCubitState>(
        builder: (context, state) {
          final _cubit = context.read<GiftCubit>();
          return Scaffold(
            appBar: AppBar(
              title: Text('Cubit Page'),
            ),
            body: Column(
              children: [
                TextFormField(
                  controller: _text,
                ),
                ElevatedButton(onPressed: (){
                  _cubit.changeUseUser(_text.text);
                }, child: Text('사용자 변경')),

                ElevatedButton(onPressed: () async {
                  final DeviceInfoPlugin _dip = DeviceInfoPlugin();
                  AndroidDeviceInfo androidInfo = await _dip.androidInfo;

                  print(androidInfo.device);
                  print(androidInfo.fingerprint);
                  _cubit.printUseUser();
                }, child: Text('쿠폰 사용자 확인'))
              ],
            ),
            floatingActionButton: FloatingActionButton(
              onPressed: (){
                _cubit.printGift();
              },
              child: Text('클릭'),
            ),
          );
        }
      ),
    );
  }
}
