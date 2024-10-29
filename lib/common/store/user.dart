import 'dart:convert';

import 'package:flutter_template/common/api/user.dart';
import 'package:flutter_template/common/index.dart';
import 'package:get/get.dart';

class UserStore extends GetxController {
  static UserStore get to => Get.find();

  // 是否登录
  final _isLogin = false.obs;
  // 令牌
  String token = '';
  // 用户信息
  final _profile = UserLoginResponseEntity().obs;
  bool get isLogin => _isLogin.value;
  bool get hasToken => token.isEmpty;
  UserLoginResponseEntity get profile => _profile.value;

  @override
  void onInit() {
    super.onInit();
    // 取token
    token = StorageService.to.getString(STORAGE_USER_PROFILE_KEY);
    // 取profile
    var profileOffline =
        StorageService.to.getString((STORAGE_USER_PROFILE_KEY));
    if (profileOffline.isNotEmpty) {
      _profile(UserLoginResponseEntity.fromJson(jsonDecode(profileOffline)));
    }
  }

  // 保存token
  Future<void> setToekn(String value) async {
    await StorageService.to.setString(STORAGE_USER_TOKEN_KEY, value);
    token = value;
  }

  // 获取profile
  Future<void> getProfile() async {
    if (token.isEmpty) return;
    var result = await UserAPI.profile();
    _profile(result);
    _isLogin.value = true;
    StorageService.to.setString(STORAGE_USER_PROFILE_KEY, jsonEncode(result));
  }

  // 保存profile
  Future<void> saveProfile(UserLoginResponseEntity profile) async {
    _isLogin.value = true;
    StorageService.to.setString(STORAGE_USER_PROFILE_KEY, jsonEncode(profile));
  }

  // 注销
  Future<void> onLogout() async {
    if (_isLogin.value) await UserAPI.logout();
    await StorageService.to.remove(STORAGE_USER_PROFILE_KEY);
    _isLogin.value = false;
    token = '';
  }
}
