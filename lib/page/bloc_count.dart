import 'package:bloc_test/bloc/bloc_cubit.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class BlocDisplayPage extends StatefulWidget {

  @override
  _BlocDisplayPageState createState() => _BlocDisplayPageState();
}

class _BlocDisplayPageState extends State<BlocDisplayPage> {

  @override
  void initState() {
    /*
    * foreground
    * */
    FirebaseMessaging.instance.getToken().then((value) => print(value));

    FirebaseMessaging.onMessage.listen((RemoteMessage message) async {
      RemoteNotification? notification = message.notification;
      AndroidNotification? android = message.notification!.android;
      print(notification!.body);

      // Notification 선언
      FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

      // 앱 아이콘 세팅
      const AndroidInitializationSettings androidSetting = AndroidInitializationSettings('@mipmap/ic_launcher');

      // 세팅 값 적용
      final InitializationSettings initializationSettings = InitializationSettings(
          android: androidSetting, iOS: null);

      // Notification 클릭(선택)시 콜백 설정
      flutterLocalNotificationsPlugin.initialize(initializationSettings, onSelectNotification: null);

      // Notification 스펙 설정 (안드로이드)
      const AndroidNotificationDetails androidPlatformChannelSpecifics =
      AndroidNotificationDetails(
          'your channel id', 'your channel name', 'your channel description',
          importance: Importance.max,
          priority: Priority.high,
          ticker: 'ticker');

      // 각 설정 스펙 적용
      var platformChannelSpecifics = NotificationDetails(android: androidPlatformChannelSpecifics);

      // 알람 발송
      await flutterLocalNotificationsPlugin.show(0, '심플입니다', '이것은 노티피케이션!', platformChannelSpecifics, payload: 'Hello World');
    });

    super.initState();


  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => BlocCubit(),
      child: BlocBuilder<BlocCubit, int>(
        builder: (context, count) => Scaffold(
          appBar: AppBar(
            elevation: 0,
            title: Text('블록테스트'),
          ),
          body: Center(child: Text('$count')),
          floatingActionButton: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 5.0),
                child: FloatingActionButton(
                  heroTag: '5',
                  child: const Icon(Icons.add),
                  onPressed: () => context.read<BlocCubit>().increment(),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 5.0),
                child: FloatingActionButton(
                  heroTag: '6',
                  child: const Icon(Icons.remove),
                  onPressed: () =>context.read<BlocCubit>().decrement(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
