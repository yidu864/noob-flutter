import 'package:get/get.dart';

class SignUpController extends GetxController {
  SignUpController();

  _initData() {
    update(["sign_up"]);
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
