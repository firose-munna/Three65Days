
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:three65days/common/utils/AppConst.dart';
import 'package:three65days/features/onboarding/pages/OnBoarding.dart';
import 'package:three65days/features/todo/pages/HomePage.dart';



void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      useInheritedMediaQuery: true,
      designSize: const Size(375, 825),
      minTextAdapt: true,
      builder: (context, child) {
        return MaterialApp(
          title: 'Three65Days',
          theme: ThemeData(
            scaffoldBackgroundColor: AppConst.kLight,
            colorScheme: ColorScheme.fromSeed(seedColor: AppConst.kBlueLight),
            useMaterial3: true,
          ),
          //themeMode: ThemeMode.dark,
          debugShowCheckedModeBanner: false,
          home: const HomePage(),
        );
      }
    );
  }
}

