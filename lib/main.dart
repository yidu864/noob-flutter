import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_template/pages/index.dart';

void main() {
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
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const WelcomePage(),
    );
  }
}