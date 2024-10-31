import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:flutter_template/common/index.dart';
import '../controller.dart';

class NewsCateWidget extends GetView<MainController> {
  const NewsCateWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => controller.state.categories == null
          ? Container()
          : SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: controller.state.categories.map<Widget>((item) {
                  return Container(
                    alignment: Alignment.center,
                    height: 52.h,
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: GestureDetector(
                      child: Text(
                        item.title,
                        style: TextStyle(
                          color: controller.state.selCategoryCode == item.code
                              ? AppColor.secondaryElementText
                              : AppColor.primaryText,
                          fontSize: 18.sp,
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      onTap: () {
                        // 拉取数据
                        controller.asyncLoadNewsData(item.code);
                      },
                    ),
                  );
                }).toList(),
              ),
            ),
    );
  }
}
