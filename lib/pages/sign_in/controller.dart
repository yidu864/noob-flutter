import 'package:get/get.dart';

class SignInController extends GetxController {
  SignInController();

  _initData() {
    update(["sign_in"]);
  }

  void onTap() {}

  // @override
  // void onInit() {
  //   super.onInit();
  // }

  @override
  void onReady() {
    super.onReady();
    _initData();
  }

  // @override
  // void onClose() {
  //   super.onClose();
  // }
}
