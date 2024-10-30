import 'package:flutter/widgets.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_template/common/index.dart';
import 'package:flutter_template/common/store/user.dart';
import 'package:get/get.dart';

class ApplicationGuard extends GetMiddleware {
  @override
  RouteSettings? redirect(String? route) {
    if (UserStore.to.isLogin) {
      return null;
    } else {
      EasyLoading.showError('未登录');
      return const RouteSettings(name: RouteNames.signIn);
    }
  }
}
