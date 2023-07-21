import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pinput/pinput.dart';
import 'package:three65days/common/utils/AppConst.dart';
import 'package:three65days/common/widgets/AppStyle.dart';
import 'package:three65days/common/widgets/HeightSpacer.dart';
import 'package:three65days/common/widgets/ReuseableText.dart';

class OtpPage extends StatelessWidget {
  const OtpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        backgroundColor: Colors.transparent,
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              HeightSpacer(height: AppConst.kHeight*0.05),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 130.w),
                child: Image.asset("assets/images/otp.png"),
              ),
              HeightSpacer(height: 25),
              ReusableText(text: "Enter OTP", style: AppStyle(18, AppConst.kBkDark, FontWeight.bold)),
              HeightSpacer(height: 12),
              Pinput(
                length: 6,
                showCursor: true,
                onCompleted: (value){
                  if(value.length == 6){

                  }
                },
                onSubmitted: (value){
                  if(value.length == 6){

                  }
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
