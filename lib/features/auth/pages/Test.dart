import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:three65days/common/utils/AppConst.dart';
import 'package:three65days/common/widgets/AppStyle.dart';
import 'package:three65days/common/widgets/ReuseableText.dart';
import 'package:three65days/features/auth/controller/CodeProvider.dart';

class TestPage extends ConsumerWidget{
  const TestPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref){
    String code = ref.watch(codeStateProvider);
    return Scaffold(
      appBar:  AppBar(),
      body: Center(
        child: Column(
          children: [
            ReusableText(text: code, style: AppStyle(30, AppConst.kBkDark, FontWeight.bold)),
            TextButton(
                onPressed: (){
                  ref.watch(codeStateProvider.notifier).setStart("Hello firose");
                },
                child: Text("Press Me"))
          ],
        ),
      ),
    );
  }
}