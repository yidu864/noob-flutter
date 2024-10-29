import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_template/common/api/user.dart';
import 'package:get/get.dart';

import 'package:flutter_template/common/index.dart';

import 'index.dart';

class SignUpController extends GetxController {
  SignUpController();

  final state = SignUpState();

  final TextEditingController fullnameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passController = TextEditingController();

  // 返回上一页
  handleNavPop() {
    Get.back();
  }

  // 提示信息
  handleTip() {
    EasyLoading.showToast('这是注册界面');
  }

  // 执行注册操作
  handleSignUp() async {
    // if (!duCheckStringLength(fullnameController.value.text, 5)) {
    //   toastInfo(msg: '用户名不能小于5位');
    //   return;
    // }
    // if (!duIsEmail(emailController.value.text)) {
    //   toastInfo(msg: '请正确输入邮件');
    //   return;
    // }
    // if (!duCheckStringLength(passController.value.text, 6)) {
    //   toastInfo(msg: '密码不能小于6位');
    //   return;
    // }

    UserRegisterRequestEntity params = UserRegisterRequestEntity(
      email: emailController.value.text,
      password: duSHA256(passController.value.text),
    );

    await UserAPI.register(
      params: params,
    );

    Get.back();
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
