import 'package:flutter_vlc_player/flutter_vlc_player.dart';
import 'package:get/get.dart';

class DahuaIccController extends GetxController {
  DahuaIccController();

  Rx<String> videoUrl = ''.obs;
  late VlcPlayerController vlcc;

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
