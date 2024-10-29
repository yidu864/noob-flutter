// ignore_for_file: constant_identifier_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:flutter_template/common/index.dart';
import 'package:flutter_template/pages/index.dart';

abstract class AppPages {
  static const SPLASH = RouteNames.signIn;
  static List<String> history = [];
  static final RouteObserver<Route> obs = RouteObservers();

  static final pages = [
    // GetPage(
    //   name: RouteNames.account,
    //   page: () => const AccountPage(),
    // ),
    GetPage(
      name: RouteNames.application,
      page: () => const ApplicationPage(),
    ),
    GetPage(
      name: RouteNames.category,
      page: () => const CategoryPage(),
    ),
    GetPage(
      name: RouteNames.dahuaIcc,
      page: () => DahuaIccPage(),
    ),
    GetPage(
      name: RouteNames.signIn,
      page: () => const SignInPage(),
      binding: SignInBinding(),
    ),
    GetPage(
      name: RouteNames.signUp,
      page: () => const SignUpPage(),
    ),
    GetPage(
      name: RouteNames.main,
      page: () => const MainPage(),
    ),
    // GetPage(
    //   name: RouteNames.f,
    //   page: () => const SignInPage(),
    // ),
    // GetPage(
    //   name: RouteNames.signUp,
    //   page: () => const SignUpPage(),
    // ),
    GetPage(
      name: RouteNames.welcome,
      binding: WelcomeBinding(),
      page: () => const WelcomePage(),
    ),
  ];
}
