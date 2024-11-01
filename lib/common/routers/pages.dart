// ignore_for_file: constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter_template/common/routers/guard/application.dart';
import 'package:flutter_template/common/routers/guard/welcome.dart';
import 'package:get/get.dart';

import 'package:flutter_template/common/index.dart';
import 'package:flutter_template/pages/index.dart';

abstract class AppPages {
  static const SPLASH = RouteNames.notice;
  static List<String> history = [];
  static final RouteObserver<Route> obs = RouteObservers();

  static final pages = [
    GetPage(
      name: RouteNames.dahuaIcc,
      page: () => const DahuaIccPage(),
    ),
    GetPage(
        name: RouteNames.welcome,
        binding: WelcomeBinding(),
        page: () => const WelcomePage(),
        middlewares: [WelcomeGuard()]),
    GetPage(
      name: RouteNames.signIn,
      page: () => const SignInPage(),
      binding: SignInBinding(),
    ),
    GetPage(
      name: RouteNames.signUp,
      binding: SignUpBinding(),
      page: () => const SignUpPage(),
    ),
    //  =========以下页面需要登录
    GetPage(
        name: RouteNames.application,
        binding: ApplicationBinding(),
        page: () => const ApplicationPage(),
        middlewares: [ApplicationGuard()]),
    GetPage(
      name: RouteNames.category,
      page: () => const CategoryPage(),
    ),
    // ======== 测试用
    GetPage(
      name: RouteNames.notice,
      page: () => const NotificationPage(),
    ),
    GetPage(
      name: RouteNames.background,
      page: () => const BackgroundPage(),
    ),
  ];
}
