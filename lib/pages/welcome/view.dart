import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_template/common/index.dart';
import 'package:get/get.dart';

import './controller.dart';

class WelcomePage extends GetView<WelcomeController> {
  const WelcomePage({super.key});

  ///  头标题
  Widget _buildPageHeadTitle() {
    return Container(
      margin: EdgeInsets.only(top: 65.w),
      child: Text(
        "Features",
        textAlign: TextAlign.center,
        style: TextStyle(
          color: AppColor.primaryText,
          fontFamily: "Montserrat",
          fontWeight: FontWeight.w600,
          fontSize: 24.sp,
        ),
      ),
    );
  }

  /// 页头说明
  Widget _buildPageHeaderDetail() {
    return Container(
      width: 242.w,
      height: 70.h,
      margin: EdgeInsets.only(top: 14.h),
      child: Text(
        "The best of news channels all in one place. Trusted sources and personalized news for you.",
        textAlign: TextAlign.center,
        style: TextStyle(
          color: AppColor.primaryText,
          fontFamily: "Avenir",
          fontWeight: FontWeight.normal,
          fontSize: 16.sp,
          height: 1.3,
        ),
      ),
    );
  }

  /// 特性说明
  /// 宽度 80 + 20 + 195 = 295
  Widget _buildFeatureItem(String imageName, String intro, double marginTop) {
    return Container(
      width: 295.w,
      height: 80.h,
      margin: EdgeInsets.only(top: marginTop.h),
      child: Row(
        children: [
          SizedBox(
            width: 80.w,
            height: 80.w,
            child: Image.asset(
              "assets/images/$imageName.png",
              fit: BoxFit.none,
            ),
          ),
          const Spacer(),
          SizedBox(
            width: 195.w,
            child: Text(
              intro,
              textAlign: TextAlign.left,
              style: TextStyle(
                color: AppColor.primaryText,
                fontFamily: "Avenir",
                fontWeight: FontWeight.normal,
                fontSize: 16.sp,
              ),
            ),
          ),
        ],
      ),
    );
  }

  /// 开始按钮
  Widget _buildStartButton() {
    return Container(
      width: 295.w,
      height: 44.h,
      margin: EdgeInsets.only(bottom: 20.h),
      child: TextButton(
        style: TextButton.styleFrom(
          backgroundColor: AppColor.primaryElement,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(6.w)),
          ),
        ),
        onPressed: controller.onTapStart,
        child: const Text(
          "Get started",
          style: TextStyle(color: AppColor.primaryElementText),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context,
        designSize: const Size(375, 812 - 44 - 34), minTextAdapt: true);

    return GetBuilder<WelcomeController>(
      init: WelcomeController(),
      id: "welcome",
      builder: (_) {
        return Scaffold(
          body: Center(
            child: Column(
              children: <Widget>[
                _buildPageHeadTitle(),
                _buildPageHeaderDetail(),
                _buildFeatureItem(
                  "feature-1",
                  "Compelling photography and typography provide a beautiful reading",
                  86,
                ),
                _buildFeatureItem(
                  "feature-2",
                  "Sector news never shares your personal data with advertisers or publishers",
                  40,
                ),
                _buildFeatureItem(
                  "feature-3",
                  "You can get Premium to unlock hundreds of publications",
                  40,
                ),
                const Spacer(),
                _buildStartButton(),
              ],
            ),
          ),
        );
      },
    );
  }
}
