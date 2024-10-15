import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_template/pages/index.dart';
import 'package:flutter_template/pages/sign_in/index.dart';
import 'package:flutter_template/pages/sign_up/view.dart';
import 'package:get/get.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

void main() async {
  await ScreenUtil.ensureScreenSize();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      // initialRoute: Routes.SPLASH,
      // theme: appThemeData,
      defaultTransition: Transition.fade,
      // initialBinding: SplashBinding(),
      // getPages: AppPages.pages,
      // home: SplashPage(),
      title: 'Flutter Demo',
      // theme: ThemeData(
      //   colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      //   useMaterial3: true,
      // ),
      routes: {
        '/sign-in': (ctx) => SignInPage(),
        '/sign-up': (ctx) => SignUpPage(),
      },
      initialRoute: '/sign-in',
      home: const WelcomePage(),
      builder: EasyLoading.init(),
    );
  }
}
