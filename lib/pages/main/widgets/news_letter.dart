import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_template/common/index.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../controller.dart';

class NewsletterWidget extends GetView<MainController> {
  const NewsletterWidget({super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(20.w),
      child: Column(
        children: <Widget>[
          // newsletter
          Row(
            children: <Widget>[
              Text(
                'Newsletter',
                style: TextStyle(
                  fontFamily: 'Montserrat',
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w600,
                  color: AppColor.thirdElement,
                ),
              ),
              const Spacer(),
              IconButton(
                icon: Icon(
                  Icons.close,
                  color: AppColor.thirdElementText,
                  size: 17.sp,
                ),
                onPressed: () {},
              ),
            ],
          ),

          // email
          inputEmailEdit(
            marginTop: 19,
            keyboardType: TextInputType.emailAddress,
            hintText: "Email",
            isPassword: false,
            controller: null,
          ),

          // btn subcrible
          Padding(
            padding: const EdgeInsets.only(top: 15),
            child: btnFlatButtonWidget(
              onPressed: () {},
              width: 335.w,
              height: 44.h,
              fontWeight: FontWeight.w600,
              title: "Subscribe",
            ),
          ),

          // disc
          Container(
            margin: EdgeInsets.only(top: 29.h),
            width: 261.w,
            child: Text.rich(TextSpan(children: <TextSpan>[
              TextSpan(
                text: 'By clicking on Subscribe button you agree to accept',
                style: TextStyle(
                  color: AppColor.thirdElementText,
                  fontFamily: "Avenir",
                  fontWeight: FontWeight.w400,
                  fontSize: 14.sp,
                ),
              ),
              TextSpan(
                text: ' Privacy Policy',
                style: TextStyle(
                  color: AppColor.secondaryElementText,
                  fontFamily: "Avenir",
                  fontWeight: FontWeight.w400,
                  fontSize: 14.sp,
                ),
                recognizer: TapGestureRecognizer()
                  ..onTap = () {
                    EasyLoading.showToast('Privacy Policy');
                  },
              ),
            ])),
          ),
        ],
      ),
    );
  }
}
