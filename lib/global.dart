import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';

import 'package:flutter_template/common/index.dart';
import 'package:package_info_plus/package_info_plus.dart';

class Global {
  static UserLoginResponseEntity profile =
      UserLoginResponseEntity(accessToken: '', displayName: '', channels: []);

  // 是否正式环境
  static bool get isRelease => const bool.fromEnvironment('dart.vm.product');

  /// 初始化
  static Future init() async {
    WidgetsFlutterBinding.ensureInitialized();

    // 插件
    await ScreenUtil.ensureScreenSize();
    await PackageInfo.fromPlatform();

    // 固定应用朝向, 禁止横屏
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

    setSystemUi();
  }

  /// 设置状态栏与导航样式
  static void setSystemUi() {
    if (GetPlatform.isAndroid) {
      SystemUiOverlayStyle suos = const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarBrightness: Brightness.light,
        statusBarIconBrightness: Brightness.dark,
        systemNavigationBarDividerColor: Colors.transparent,
        systemNavigationBarColor: Colors.white,
        systemNavigationBarIconBrightness: Brightness.dark,
      );
      SystemChrome.setSystemUIOverlayStyle(suos);
    }
  }
}
