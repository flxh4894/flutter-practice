import 'package:bloc_test/bloc/bloc_observer.dart';
import 'package:bloc_test/page/app.dart';
import 'package:bloc_test/page/app_init.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  print("Handling a background message: ${message.messageId}");
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  /// Background FCM 설정
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  await FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
    alert: true,
    badge: true,
    sound: true
  );

  /// Bloc Observer 등록
  Bloc.observer = LoadBlocObserver();
  runApp(AppInitializer(childWidget: MyApp()));
}

