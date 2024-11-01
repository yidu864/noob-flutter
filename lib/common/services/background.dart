import 'package:get/get.dart';

class BackgroundService extends GetxService {
  static BackgroundService get to => Get.find();

  Future<BackgroundService> init() async {
    return this;
  }

  static onPushNotice() async {}
}
