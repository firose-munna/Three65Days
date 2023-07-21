import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:three65days/common/utils/AppConst.dart';
import 'package:three65days/common/widgets/AppStyle.dart';
import 'package:three65days/common/widgets/ReuseableText.dart';
import 'package:three65days/common/widgets/WidthSpacer.dart';

import '../widgets/PageOne.dart';
import '../widgets/PageTwo.dart';

class OnBoarding extends StatefulWidget {
  const OnBoarding({super.key});

  @override
  State<OnBoarding> createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {

  final PageController pageController = PageController();

  @override
  void dispose() {
    // TODO: implement dispose
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            physics: const AlwaysScrollableScrollPhysics(),
            controller: pageController,
            children: [
              PageOne(),
              PageTwo(),
            ],

          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 30.h, horizontal: 20.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      GestureDetector(
                        onTap: (){
                          pageController.nextPage(duration: Duration(microseconds: 600), curve: Curves.ease);
                        },
                        child: const Icon(Ionicons.chevron_forward_circle, size: 25, color: AppConst.kBkDark,),
                      ),
                      const WidthSpacer(width: 5),

                      ReusableText(text: "Skip", style: AppStyle(16, AppConst.kBkDark, FontWeight.w500)),
                    ],
                  ),

                  GestureDetector(
                    onTap: (){
                      pageController.nextPage(duration: const Duration(microseconds: 600), curve: Curves.ease);
                    },
                    child: SmoothPageIndicator(controller: pageController, count: 2,
                    effect: const WormEffect(
                      dotHeight: 12,
                      dotWidth: 16,
                      spacing: 10,
                      dotColor: AppConst.kRed
                    ),),
                  )

                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
