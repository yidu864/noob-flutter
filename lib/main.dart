import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_template/common/index.dart';
import 'package:flutter_template/global.dart';

import 'package:get/get.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

void main() async {
  await Global.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      builder: (ctx, child) => GetMaterialApp(
        debugShowCheckedModeBanner: false,
        // initialRoute: Routes.SPLASH,
        theme: AppTheme.light,
        defaultTransition: Transition.fade,
        // initialBinding: SplashBinding(),
        // getPages: AppPages.pages,
        // home: SplashPage(),
        title: 'Flutter Demo',
        // theme: ThemeData(
        //   colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        //   useMaterial3: true,
        // ),
        initialRoute: AppPages.SPLASH,
        getPages: AppPages.pages,
        // initialRoute: '/dahua',
        builder: EasyLoading.init(),
        translations: TranslationService(),
        navigatorObservers: [AppPages.obs],
        // TODO: 国际化
        // localizationsDelegates: [
        //   Global
        // ],
      ),
    );
  }
}
