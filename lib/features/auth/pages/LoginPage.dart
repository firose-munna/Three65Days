//import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:three65days/common/utils/AppConst.dart';
import 'package:three65days/common/widgets/AppStyle.dart';
import 'package:three65days/common/widgets/CustomOutlineButton.dart';
import 'package:three65days/common/widgets/CustomTextField.dart';
import 'package:three65days/common/widgets/HeightSpacer.dart';
import 'package:three65days/common/widgets/ReuseableText.dart';
import 'package:three65days/features/auth/pages/OtpPage.dart';

class LoginPage extends ConsumerStatefulWidget {
  const LoginPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _LoginPageState();
}

class _LoginPageState extends ConsumerState<LoginPage> {
  final TextEditingController phoneController = TextEditingController();

  // Country country = Country(
  //     phoneCode: '88',
  //     countryCode: "BD",
  //     e164Sc: 0,
  //     geographic: true,
  //     level: 1,
  //     name: "BD",
  //     example: "BD",
  //     displayName: "Bangladesh",
  //     displayNameNoCountryCode: "BD",
  //     e164Key: "");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 8.w),
          child: ListView(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 40.w),
                child: Image.asset(
                  "assets/images/to-do-list.png",
                  width: 300,
                ),
              ),
              const HeightSpacer(
                height: 20,
              ),
              Container(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: EdgeInsets.only(left: 20.w),
                  child: ReusableText(
                      text: "Please Enter Your Phone Number",
                      style: AppStyle(17, AppConst.kBkDark, FontWeight.w500)),
                ),
              ),
              const HeightSpacer(height: 10),
              Center(
                child: Padding(
                  padding: const EdgeInsets.only(left: 10, right: 10),
                  child: CustomTextField(
                    prefixIcon: Container(
                      padding: const EdgeInsets.all(10),
                      child: ReusableText(text: "+88", style: AppStyle(18, AppConst.kGreyDk, FontWeight.bold)),
                      // child: GestureDetector(
                      //   onTap: () {
                      //     showCountryPicker(
                      //         context: context,
                      //         countryListTheme: CountryListThemeData(
                      //           backgroundColor: AppConst.kLight,
                      //           bottomSheetHeight: AppConst.kHeight*0.6,
                      //           borderRadius: BorderRadius.only(
                      //             topLeft: Radius.circular(AppConst.kRadius),
                      //             topRight: Radius.circular(AppConst.kRadius),
                      //
                      //           )
                      //         ),
                      //         onSelect: (code) {
                      //           setState(() {});
                      //         });
                      //   },
                      //   child: ReusableText(
                      //       text: "${country.flagEmoji} +${country.phoneCode}",
                      //       style: AppStyle(
                      //           18, AppConst.kGreyDk, FontWeight.bold)),
                      // ),
                    ),
                    hintText: "Phone Number",
                    hintStyle: AppStyle(16, AppConst.kGreyDk, FontWeight.w600),
                    controller: phoneController,
                    keyboardType: TextInputType.number,
                  ),
                ),
              ),
              const HeightSpacer(height: 20),
              Padding(
                padding: const EdgeInsets.only(left: 10, right: 10),
                child: CustomOutlineButton(
                  width: AppConst.kWidth * 0.9,
                  height: AppConst.kHeight * 0.06,
                  color: AppConst.kBkDark,
                  //color2: AppConst.kBlueLight,
                  text: "Send Code",
                  onTap: () {
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) => OtpPage()));
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
