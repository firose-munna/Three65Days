import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:three65days/common/utils/AppConst.dart';
import 'package:three65days/common/widgets/CustomOutlineButton.dart';
import 'package:three65days/common/widgets/HeightSpacer.dart';
import 'package:three65days/features/auth/pages/LoginPage.dart';



class PageTwo extends StatelessWidget {
  const PageTwo({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: AppConst.kHeight,
      width: AppConst.kWidth,
      color: AppConst.kLight,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 40.w),
            child: Image.asset("assets/images/to-do.png"),
          ),
          const HeightSpacer(height: 50),
          CustomOutlineButton(
              width: AppConst.kWidth * 0.8,
              height: AppConst.kHeight * 0.06,
              color: AppConst.kBkDark,
              text: "Log in with Phone Number",
            onTap: (){
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>LoginPage()));
            },
          )
        ],
      ),
    );
  }
}
