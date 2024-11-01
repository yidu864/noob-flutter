import 'package:get/get.dart';

class BackgroundController extends GetxController {
  Rx<bool> enabled = true.obs;
  Rx<int> status = 0.obs;
  RxList events = [].obs;

  BackgroundController();

  void onClickEnable(enabled) {}

  void onClickStatus() async {}

  // @override
  // void onInit() {
  //   super.onInit();
  // }

  // @override
  // void onReady() {
  //   super.onReady();
  // }

  // @override
  // void onClose() {
  //   super.onClose();
  // }
}
