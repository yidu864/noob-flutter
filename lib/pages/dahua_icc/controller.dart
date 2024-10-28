import 'package:get/get.dart';

class DahuaIccController extends GetxController {
  DahuaIccController();

  _initData() {
    update(["dahua_icc"]);
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
