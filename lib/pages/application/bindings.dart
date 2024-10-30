import 'package:get/get.dart';
import 'package:flutter_template/pages/main/controller.dart';
import 'package:flutter_template/pages/category/controller.dart';

import './controller.dart';

class ApplicationBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ApplicationController>(() => ApplicationController());
    Get.lazyPut(() => MainController());
    Get.lazyPut(() => CategoryController());
  }
}
