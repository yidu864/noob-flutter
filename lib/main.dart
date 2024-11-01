import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_template/common/store/config.dart';
import 'package:get/get.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'package:flutter_template/common/index.dart';
import 'package:flutter_template/global.dart';

void main() async {
  await Global.init();
  runApp(const MyApp());
  Global.registerBackground();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      builder: (ctx, child) => GetMaterialApp(
        debugShowCheckedModeBanner: false,
        theme: AppTheme.light,
        defaultTransition: Transition.fade,
        title: 'Flutter Demo',
        initialRoute: AppPages.SPLASH,
        getPages: AppPages.pages,
        builder: EasyLoading.init(),
        translations: TranslationService(),
        navigatorObservers: [AppPages.obs],
        // 国际化
        localizationsDelegates: const [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate
        ],
        supportedLocales: ConfigStore.to.langs,
        locale: ConfigStore.to.locale,
        fallbackLocale: const Locale('en', 'US'),
        enableLog: true,
      ),
    );
  }
}
