import 'package:flutter/material.dart';
import 'package:flutter_template/common/api/user.dart';
import 'package:flutter_template/common/index.dart';
import 'package:flutter_template/common/store/user.dart';
import 'package:get/get.dart';

import 'index.dart';

class ApplicationController extends GetxController {
  ApplicationController();

  final state = ApplicationState();

  // tab 页标题
  late final List<String> tabTitles;
  // 页控制器
  late final PageController pageController;

  // 底部导航项目
  late final List<BottomNavigationBarItem> bottomTabs;

  // tab栏页码切换
  void handlePageChanged(int page) {
    state.page = page;
  }

  // tab栏动画
  void handleNavBarTap(int index) {
    pageController.animateToPage(index,
        duration: const Duration(milliseconds: 200), curve: Curves.ease);
  }

  Future onLogout() async {
    await UserStore.to.onLogout();
    Get.offAndToNamed(RouteNames.welcome);
  }

  /// 在 widget 内存中分配后立即调用。
  @override
  void onInit() {
    super.onInit();

    tabTitles = ['Welcome', 'Cagegory', 'Bookmarks', 'Account'];
    bottomTabs = <BottomNavigationBarItem>[
      const BottomNavigationBarItem(
        icon: Icon(
          Iconfont.home,
          color: AppColor.tabBarElement,
        ),
        activeIcon: Icon(
          Iconfont.home,
          color: AppColor.secondaryElementText,
        ),
        label: 'main',
        backgroundColor: AppColor.primaryBackground,
      ),
      const BottomNavigationBarItem(
        icon: Icon(
          Iconfont.grid,
          color: AppColor.tabBarElement,
        ),
        activeIcon: Icon(
          Iconfont.grid,
          color: AppColor.secondaryElementText,
        ),
        label: 'category',
        backgroundColor: AppColor.primaryBackground,
      ),
      const BottomNavigationBarItem(
        icon: Icon(
          Iconfont.tag,
          color: AppColor.tabBarElement,
        ),
        activeIcon: Icon(
          Iconfont.tag,
          color: AppColor.secondaryElementText,
        ),
        label: 'tag',
        backgroundColor: AppColor.primaryBackground,
      ),
      const BottomNavigationBarItem(
        icon: Icon(
          Iconfont.me,
          color: AppColor.tabBarElement,
        ),
        activeIcon: Icon(
          Iconfont.me,
          color: AppColor.secondaryElementText,
        ),
        label: 'my',
        backgroundColor: AppColor.primaryBackground,
      ),
    ];

    pageController = PageController(initialPage: state.page);
  }

  /// 在 onInit() 之后调用 1 帧。这是进入的理想场所
  @override
  void onReady() {
    super.onReady();
  }

  /// 在 [onDelete] 方法之前调用。
  @override
  void onClose() {
    super.onClose();
  }

  /// dispose 释放内存
  @override
  void dispose() {
    super.dispose();
  }
}
