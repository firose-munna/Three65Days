import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:three65days/common/utils/AppConst.dart';
import 'package:three65days/common/widgets/AppStyle.dart';
import 'package:three65days/common/widgets/HeightSpacer.dart';
import 'package:three65days/common/widgets/ReuseableText.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        automaticallyImplyLeading: false,
      ),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ReusableText(text: "365", style: AppStyle(30, AppConst.kBlueLight, FontWeight.bold),),
            HeightSpacer(height: 15),
            ReusableText(text: "365", style: AppStyle(30, AppConst.kBlueLight, FontWeight.bold),),
            HeightSpacer(height: 15),
            ReusableText(text: "365", style: AppStyle(30, AppConst.kBlueLight, FontWeight.bold),),
          ],
        ),
      ),
    );
  }
}
