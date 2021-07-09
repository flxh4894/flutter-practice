/*
* 인증 관련 Repository
* */
import 'dart:convert';
import 'dart:io';

import 'package:device_info/device_info.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthRepository {
  final DeviceInfoPlugin _deviceInfoPlugin = DeviceInfoPlugin(); // 토큰에 저장할 기기 정보
  static const TOKEN_INFO = 'loginToken';

  SharedPreferences? sp; // 따로 분리를 할까 말까...
  String? loginInfo; // 정보를 여기에 두는게 맞을까?

  /// 기기 정보 가져오기
  Future<Map<String, dynamic>> deviceInfo() async {
    // 나중에 Const 값으로 빼내기
    String os = Platform.isAndroid ? 'ANDROID' : Platform.isIOS ? 'IOS' : 'UNKNOWN';
    Map<String, dynamic> deviceInfo;


    if(Platform.isAndroid){
      AndroidDeviceInfo androidDeviceInfo = await _deviceInfoPlugin.androidInfo;
      deviceInfo = {
        'os': os,
        'model': androidDeviceInfo.model,
        'sdk': androidDeviceInfo.version.sdkInt
      };
    } else if(Platform.isIOS){
      IosDeviceInfo iosDeviceInfo = await _deviceInfoPlugin.iosInfo;
      deviceInfo = {
        'os': os,
        'model': iosDeviceInfo.model,
        'uuid': iosDeviceInfo.identifierForVendor
      };
    } else {
      deviceInfo = {
        'os': os
      };
    }

    return deviceInfo;
  }

  // 로그인 진행 (with Server)



  /// 인증 정보 (Token) 읽어오기
  loadLoginInfo() async {
    this.sp ??= await SharedPreferences.getInstance();
    String? loginInfo = sp!.getString(TOKEN_INFO);

    this.loginInfo = loginInfo;
  }

  /// 인증 정보 (Token) 저장하기
  saveLoginInfo(String loginInfo) async {
    this.sp ??= await SharedPreferences.getInstance();
    await sp!.setString(TOKEN_INFO, loginInfo);
  }
}