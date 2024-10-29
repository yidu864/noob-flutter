import 'package:flutter_template/common/index.dart';
import 'package:flutter_template/common/store/config.dart';
import 'package:get/get.dart';

class WelcomeController extends GetxController {
  WelcomeController();

  _initData() {
    update(["welcome"]);
  }

  /// 跳转去注册页面
  void onTapStart() async {
    // 标记已经打开过应用了
    await ConfigStore.to.saveAlreadyOpen();
    Get.offAndToNamed(RouteNames.signIn);
    // Get.toNamed(RouteNames.signIn);
  }

  @override
  void onReady() {
    super.onReady();
    _initData();
  }
}
