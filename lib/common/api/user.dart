import 'dart:async';
import 'package:flutter_template/common/index.dart';

// 登录请求

class UserAPI {
  static Future<UserLoginResponseEntity> login(
      {required UserLoginRequestEntity params}) async {
    var resp =
        (await XHttp.getInstance().post('/user/login', params.toJson())).data;
    return UserLoginResponseEntity.fromJson(resp);
  }
}
