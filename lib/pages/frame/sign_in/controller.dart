import 'package:flutter/widgets.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_template/common/api/user.dart';
import 'package:flutter_template/common/store/user.dart';
import 'package:get/get.dart';

import 'package:flutter_template/common/index.dart';

import 'index.dart';

class SignInController extends GetxController {
  SignInController();

  final state = SignInState();

  // email的控制器
  final TextEditingController emailController = TextEditingController();
  // 密码的控制器
  final TextEditingController passController = TextEditingController();

  // 跳转 注册界面
  handleNavSignUp() {
    Get.toNamed(RouteNames.signUp);
  }

  // 执行登录操作
  handleSignIn() async {
    UserLoginRequestEntity params = UserLoginRequestEntity(
      email: emailController.value.text,
      password: duSHA256(passController.value.text),
    );

    UserLoginResponseEntity userProfile = await UserAPI.login(
      params: params,
    );
    UserStore.to.saveProfile(userProfile);

    Get.offAndToNamed(RouteNames.application);
  }

  // 忘记密码
  handleFogotPassword() {
    EasyLoading.showToast('忘记密码');
  }

  /// 在 widget 内存中分配后立即调用。
  @override
  void onInit() {
    super.onInit();
  }

  /// 在 onInit() 之后调用 1 帧。这是进入的理想场所
  @override
  void onReady() {
    super.onReady();
  }

  /// 在 [onDelete] 方法之前调用。
  @override
  void onClose() {
    super.onClose();
  }

  /// dispose 释放内存
  @override
  void dispose() {
    super.dispose();
  }
}
