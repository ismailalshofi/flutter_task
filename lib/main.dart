import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:mobile_test_task/core/helper/dependencies.dart';
import 'package:mobile_test_task/core/routes/app_pages.dart';
import 'package:mobile_test_task/core/routes/app_routes.dart';
import 'package:mobile_test_task/core/values/values.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized;
  await init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) {
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          title: AppText.appTitle,
          theme: ThemeData(
            useMaterial3: true,
            fontFamily: 'AlexandriaFLF-Bold',
          ),
          initialRoute: Paths.landingScreen,
          getPages: AppPages.routes
        );
      },
    );
  }
}
