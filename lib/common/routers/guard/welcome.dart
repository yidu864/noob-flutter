import 'package:flutter/widgets.dart';
import 'package:flutter_template/common/index.dart';
import 'package:flutter_template/common/store/config.dart';
import 'package:flutter_template/common/store/user.dart';
import 'package:get/get.dart';

class WelcomeGuard extends GetMiddleware {
  @override
  RouteSettings? redirect(String? route) {
    if (ConfigStore.to.isFirstOpen) {
      return null;
    } else if (UserStore.to.isLogin) {
      return const RouteSettings(name: RouteNames.application);
    } else {
      return const RouteSettings(name: RouteNames.signIn);
    }
  }
}
