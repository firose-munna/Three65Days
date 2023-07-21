import 'package:flutter/material.dart';
import 'package:three65days/common/widgets/AppStyle.dart';
import 'package:three65days/common/widgets/ReuseableText.dart';

class CustomOutlineButton extends StatelessWidget {
  const CustomOutlineButton({super.key, this.onTap, required this.width, required this.height, this.color2, required this.color, required this.text});

  final void Function()? onTap;
  final double width;
  final double height;
  final Color? color2;
  final Color color;
  final String text;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          color: color2,
          borderRadius: const BorderRadius.all(Radius.circular(12)),
          border: Border.all(color: color, width: 1)
        ),
        child: Center(
          child: ReusableText(text: text, style: AppStyle(18, color, FontWeight.bold),),
        ),
      ),
    );
  }
}
