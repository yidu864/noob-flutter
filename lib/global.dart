import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_template/common/index.dart';

class Global {
  static UserLoginResponseEntity profile =
      UserLoginResponseEntity(accessToken: '', displayName: '', channels: []);

  // 是否正式环境
  static bool get isRelease => const bool.fromEnvironment('dart.vm.product');

  /// 初始化
  static Future init() async {
    WidgetsFlutterBinding.ensureInitialized();

    // 工具初始化
    await StorageUtil.init();

    // 离线用户信息
    var profileJson = StorageUtil().getJSON(STORAGE_USER_PROFILE_KEY);
    if (profileJson != null) {
      profile = UserLoginResponseEntity.fromJson(profileJson);
    }

    // http缓存

    // 安卓状态栏设置为透明
    if (Platform.isAndroid) {
      SystemUiOverlayStyle suos =
          const SystemUiOverlayStyle(statusBarColor: Colors.transparent);
      SystemChrome.setSystemUIOverlayStyle(suos);
    }
  }

  // 持久化 用户信息
  static Future<bool> saveProfile(UserLoginResponseEntity ur) {
    profile = ur;
    return StorageUtil().setJSON(STORAGE_USER_PROFILE_KEY, ur.toJson());
  }
}
