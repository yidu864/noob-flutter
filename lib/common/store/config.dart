import 'dart:ui';

import 'package:get/get.dart';
import 'package:package_info_plus/package_info_plus.dart';

import 'package:flutter_template/common/index.dart';

class ConfigStore extends GetxController {
  static ConfigStore get to => Get.find();

  bool isFirstOpen = false;
  PackageInfo? _platform;

  String get version => _platform?.version ?? '-';
  bool get isRelease => const bool.fromEnvironment('dart.vm.product');
  Locale locale = const Locale('en', 'US');
  List<Locale> langs = [const Locale('en', 'US'), const Locale('zh', 'CN')];

  @override
  void onInit() {
    super.onInit();
    isFirstOpen = StorageService.to.getBool(STORAGE_DEVICE_FIRST_OPEN_KEY);
  }

  Future getPlatform() async {
    _platform = await PackageInfo.fromPlatform();
  }

  /// 标记用户已经打开app
  Future<bool> saveAlreadyOpen() {
    return StorageService.to.setBool(STORAGE_DEVICE_FIRST_OPEN_KEY, false);
  }

  void onInitLocale() {
    var langCode = StorageService.to.getString(STORAGE_LANGUAGE_CODE);
    if (langCode.isEmpty) return;
    // 找
    var index = langs.indexWhere((e) => e == langCode);
    if (index < 0) return;
    locale = langs[index];
  }

  void onLocaleUpdate(Locale val) {
    locale = val;
    Get.updateLocale(val);
    StorageService.to.setString(STORAGE_LANGUAGE_CODE, val.languageCode);
  }
}
