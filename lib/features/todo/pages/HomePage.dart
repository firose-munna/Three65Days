import 'package:flutter/material.dart';
import 'package:three65days/common/utils/AppConst.dart';
import 'package:three65days/common/widgets/AppStyle.dart';
import 'package:three65days/common/widgets/HeightSpacer.dart';
import 'package:three65days/common/widgets/ReuseableText.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ReusableText(text: "Three65Days", style: AppStyle(30, AppConst.kBlueLight, FontWeight.bold),),
          HeightSpacer(height: 15),
          ReusableText(text: "Three65Days", style: AppStyle(30, AppConst.kBlueLight, FontWeight.bold),),
          HeightSpacer(height: 15),
          ReusableText(text: "Three65Days", style: AppStyle(30, AppConst.kBlueLight, FontWeight.bold),),
        ],
      ),
    );
  }
}
