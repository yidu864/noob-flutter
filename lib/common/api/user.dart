import 'dart:async';
import 'package:flutter_template/common/index.dart';

// 登录请求

class UserAPI {
  // 登录
  static Future<UserLoginResponseEntity> login(
      {required UserLoginRequestEntity? params}) async {
    var resp =
        (await XHttp.getInstance().post('/user/login', params?.toJson())).data;
    return UserLoginResponseEntity.fromJson(resp);
  }

  // 注册
  static Future<UserRegisterRequestEntity> register(
      {required UserRegisterRequestEntity? params}) async {
    var resp =
        (await XHttp.getInstance().post('/user/register', params?.toJson()))
            .data;
    return UserRegisterRequestEntity.fromJson(resp);
  }

  // profile
  static Future<UserLoginResponseEntity> profile() async {
    var resp = (await XHttp.getInstance().post('/user/register')).data;
    return UserLoginResponseEntity.fromJson(resp);
  }

  // logout
  static Future logout() async {
    return (await XHttp.getInstance().post(
      '/user/logout',
    ))
        .data;
  }
}
