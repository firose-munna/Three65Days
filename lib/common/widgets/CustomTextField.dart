import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:three65days/common/utils/AppConst.dart';
import 'package:three65days/common/widgets/AppStyle.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField(
      {super.key,
      this.keyboardType,
      required this.hintText,
      this.suffixIcon,
      this.prefixIcon,
      this.hintStyle,
      required this.controller,
      this.onChanged});

  final TextInputType? keyboardType;
  final String hintText;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final TextStyle? hintStyle;
  final TextEditingController controller;
  final void Function(String)? onChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: AppConst.kWidth * 0.9,

      decoration: BoxDecoration(
        //color: AppConst.kBlueLight,
        border: Border.all(),
          borderRadius: BorderRadius.all(Radius.circular(AppConst.kRadius)),
      ),
      child: TextFormField(

        keyboardType: keyboardType,
        controller: controller,
        cursorHeight: 20,
        onChanged: onChanged,
        style: AppStyle(15, AppConst.kBkDark, FontWeight.w700),
        decoration: InputDecoration(


          hintText: hintText,
          suffixIcon: suffixIcon,
          prefixIcon: prefixIcon,
          suffixIconColor: AppConst.kBkDark,
          hintStyle: hintStyle,
          focusedBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.zero,
              borderSide: BorderSide(color: Colors.transparent, width: 0.5)),
          focusedErrorBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.zero,
              borderSide: BorderSide(color: AppConst.kRed, width: 0.5)),
          disabledBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.zero,
              borderSide: BorderSide(color: AppConst.kGreyDk, width: 0.5)),
          enabledBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.zero,
              borderSide: BorderSide(color: Colors.transparent, width: 0.5)),
        ),
      ),
    );
  }
}
