import 'package:flutter/material.dart';
import 'package:flutter_template/pages/category/index.dart';
import 'package:flutter_template/pages/main/index.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:flutter_template/common/index.dart';

import 'index.dart';

class ApplicationPage extends GetView<ApplicationController> {
  const ApplicationPage({super.key});

  // 顶部导航
  AppBar _buildAppBar() {
    return transparentAppBar(
        title: Obx(() => Text(
              controller.tabTitles[controller.state.page],
              style: TextStyle(
                color: AppColors.primaryText,
                fontFamily: 'Montserrat',
                fontSize: 18.sp,
                fontWeight: FontWeight.w600,
              ),
            )),
        actions: <Widget>[
          IconButton(
            icon: const Icon(
              Icons.search,
              color: AppColors.primaryText,
            ),
            onPressed: () {},
          )
        ]);
  }

  // 内容页
  Widget _buildPageView() {
    return PageView(
      physics: const NeverScrollableScrollPhysics(),
      controller: controller.pageController,
      onPageChanged: controller.handlePageChanged,
      children: <Widget>[
        const MainPage(),
        const CategoryPage(),
        const Text('BookmarksPage'),
        SizedBox(
          width: double.maxFinite,
          height: double.maxFinite,
          child: Center(
            child: TextButton(
                onPressed: controller.onLogout, child: const Text('退出登录')),
          ),
        ),
      ],
    );
  }

  // // 底部导航
  Widget _buildBottomNavigationBar() {
    return Obx(() => BottomNavigationBar(
          items: controller.bottomTabs,
          currentIndex: controller.state.page,
          // fixedColor: AppColors.primaryElement,
          type: BottomNavigationBarType.fixed,
          onTap: controller.handleNavBarTap,
          showSelectedLabels: false,
          showUnselectedLabels: false,
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: _buildPageView(),
      bottomNavigationBar: _buildBottomNavigationBar(),
    );
  }
}
