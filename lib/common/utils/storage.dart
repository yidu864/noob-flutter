import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

/// 本地存储
class StorageUtil {
  static final StorageUtil _instance = StorageUtil._();
  factory StorageUtil() => _instance;
  static late SharedPreferences _prefs;

  StorageUtil._();

  static Future<void> init() async {
    _prefs = (await SharedPreferences.getInstance());
  }

  static SharedPreferences getInstance() {
    return _prefs;
  }

  /// 设置 json 对象
  Future<bool> setJSON(String key, dynamic jsonVal) {
    String jsonString = jsonEncode(jsonVal);
    return _prefs.setString(key, jsonString);
  }

  /// 获取 json 对象
  dynamic getJSON(String key) {
    String jsonString = _prefs.getString(key) ?? '';
    return jsonString.isEmpty ? null : jsonDecode(jsonString);
  }
}

/// 本地存储
/// 单例 StorageUtil().getItem('key')
// Future<LocalStorage> getStorage() async {
//   await initLocalStorage();
//   return localStorage;
// }
