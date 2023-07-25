
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:three65days/common/utils/AppConst.dart';
import 'package:three65days/features/auth/pages/Test.dart';
import 'package:three65days/features/onboarding/pages/OnBoarding.dart';
import 'package:three65days/features/todo/pages/HomePage.dart';
import 'package:three65days/firebase_options.dart';

//com.googleusercontent.apps.131246157838-jiutknojo5m09ab1q815d2clqopnkg2q

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
  );

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

