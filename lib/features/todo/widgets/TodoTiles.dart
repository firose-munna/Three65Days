import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:three65days/common/utils/AppConst.dart';
import 'package:three65days/common/widgets/AppStyle.dart';
import 'package:three65days/common/widgets/HeightSpacer.dart';
import 'package:three65days/common/widgets/ReuseableText.dart';
import 'package:three65days/common/widgets/WidthSpacer.dart';

class TodoTile extends StatelessWidget {
  const TodoTile(
      {super.key,
      this.color,
      this.title,
      this.description,
      this.start,
      this.end,
      this.editWidget,
      this.delete, this.switcher});

  final Color? color;
  final String? title;
  final String? description;
  final String? start;
  final String? end;
  final Widget? editWidget;
  final Widget? switcher;
  final void Function()? delete;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 8.h),
      child: Stack(
        children: [
          Container(
            padding: EdgeInsets.all(8.h),
            width: AppConst.kWidth,
            decoration: BoxDecoration(
                color: AppConst.kGreyLight,
                borderRadius:
                    BorderRadius.all(Radius.circular(AppConst.kRadius))),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Container(
                      height: 80,
                      width: 5,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(
                              Radius.circular(AppConst.kRadius)),
                          color: color ?? AppConst.kRed),
                    ),
                    const WidthSpacer(width: 15),
                    Padding(
                      padding: EdgeInsets.all(8.h),
                      child: SizedBox(
                        width: AppConst.kWidth*0.6,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ReusableText(
                                text: title ?? "Title of TODO",
                                style: AppStyle(
                                    18, AppConst.kLight, FontWeight.bold)),
                            const HeightSpacer(height: 3),
                            ReusableText(
                                text: description ?? "Description of TODO",
                                style: AppStyle(
                                    12, AppConst.kLight, FontWeight.bold)),
                            const HeightSpacer(height: 10),
                            Container(
                              width: AppConst.kWidth * 0.3,
                              height: 25.h,
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      width: 0.3, color: AppConst.kGreyDk),
                                  borderRadius: BorderRadius.all(
                                      Radius.circular(AppConst.kRadius)),
                                  color: AppConst.kBkDark),
                              child: Center(
                                child: ReusableText(
                                    text: "$start | $end",
                                    style: AppStyle(12, AppConst.kLight,
                                        FontWeight.normal)),
                              ),
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      padding: EdgeInsets.only(bottom: 0.h),
                      child: switcher,
                    ),
                    const HeightSpacer(height: 3),
                    SizedBox(
                      child: editWidget,
                    ),
                    const HeightSpacer(height: 10),
                    GestureDetector(
                      onTap: delete,
                      child: const Icon(
                        MaterialCommunityIcons.delete_circle, color: AppConst.kLight,),
                    )

                  ],
                )

              ],
            ),
          )
        ],
      ),
    );
  }
}
