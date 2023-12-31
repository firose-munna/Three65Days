import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:three65days/common/utils/AppConst.dart';
import 'package:three65days/common/widgets/AppStyle.dart';
import 'package:three65days/common/widgets/CustomTextField.dart';
import 'package:three65days/common/widgets/ExpansionTile.dart';
import 'package:three65days/common/widgets/HeightSpacer.dart';
import 'package:three65days/common/widgets/ReuseableText.dart';
import 'package:three65days/common/widgets/WidthSpacer.dart';
import 'package:three65days/features/todo/controller/XpansionProvider.dart';
import 'package:three65days/features/todo/controller/todo/TodoProvider.dart';
import 'package:three65days/features/todo/pages/AddTask.dart';
import 'package:three65days/features/todo/widgets/CompletedTask.dart';
import 'package:three65days/features/todo/widgets/DayAfterTomorrowTask.dart';
import 'package:three65days/features/todo/widgets/TodayTask.dart';
import 'package:three65days/features/todo/widgets/TodoTiles.dart';
import 'package:three65days/features/todo/widgets/TomorrowTask.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage>
    with TickerProviderStateMixin {
  final TextEditingController searchController = TextEditingController();
  late TabController tabController = TabController(length: 2, vsync: this);

  @override
  Widget build(BuildContext context) {
    ref.watch(todoStateProvider.notifier).refresh();
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            backgroundColor: AppConst.kLight,
            automaticallyImplyLeading: false,
            bottom: PreferredSize(
              preferredSize: const Size.fromHeight(85),
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ReusableText(
                            text: "Dashboard",
                            style: AppStyle(
                                18, AppConst.kBkDark, FontWeight.bold)),
                        Container(
                          height: 25.h,
                          width: 25.w,
                          decoration: const BoxDecoration(
                              color: AppConst.kBkDark,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(8))),
                          child: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => AddTask()));
                            },
                            child: const Icon(
                              Icons.add,
                              color: AppConst.kLight,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const HeightSpacer(height: 10),
                  CustomTextField(
                    hintText: "Search",
                    controller: searchController,
                    prefixIcon: Padding(
                      padding: EdgeInsets.all(14.h),
                      child: GestureDetector(
                          onTap: () {},
                          child: const Icon(
                            AntDesign.search1,
                            color: AppConst.kGreyLight,
                          )),
                    ),
                    suffixIcon: const Icon(
                      FontAwesome.sliders,
                      color: AppConst.kGreyLight,
                    ),
                  ),
                  const HeightSpacer(height: 15),
                ],
              ),
            ),
          ),
          body: SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: ListView(
                children: [
                  const HeightSpacer(height: 25),
                  Row(
                    //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Icon(
                        FontAwesome.tasks,
                        color: AppConst.kBkDark,
                      ),
                      const WidthSpacer(width: 20),
                      ReusableText(
                          text: "Today's Task",
                          style:
                              AppStyle(18, AppConst.kBkDark, FontWeight.bold))
                    ],
                  ),
                  const HeightSpacer(height: 25),
                  Container(
                    decoration: BoxDecoration(
                        color: AppConst.kBkDark,
                        borderRadius: BorderRadius.all(
                            Radius.circular(AppConst.kRadius))),
                    child: TabBar(
                      indicatorSize: TabBarIndicatorSize.label,
                      indicator: BoxDecoration(
                        color: AppConst.kGreyLight,
                        borderRadius:
                            BorderRadius.all(Radius.circular(AppConst.kRadius)),
                      ),
                      controller: tabController,
                      isScrollable: false,
                      unselectedLabelColor: AppConst.kLight,
                      labelColor: AppConst.kBlueLight,
                      labelStyle:
                          AppStyle(24, AppConst.kLight, FontWeight.w700),
                      labelPadding: EdgeInsets.zero,
                      tabs: [
                        Tab(
                          child: SizedBox(
                            width: AppConst.kWidth * 0.5,
                            child: Center(
                              child: ReusableText(
                                  text: "Pending",
                                  style: AppStyle(
                                      16, AppConst.kLight, FontWeight.bold)),
                            ),
                          ),
                        ),
                        Tab(
                          child: Container(
                            padding: EdgeInsets.only(left: 30.w),
                            width: AppConst.kWidth * 0.5,
                            child: Center(
                              child: ReusableText(
                                  text: "Completed",
                                  style: AppStyle(
                                      16, AppConst.kLight, FontWeight.bold)),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  const HeightSpacer(height: 20),
                  SizedBox(
                    width: AppConst.kWidth,
                    height: AppConst.kHeight * 0.3,
                    child: ClipRRect(
                      borderRadius:
                          BorderRadius.all(Radius.circular(AppConst.kRadius)),
                      child: TabBarView(
                        controller: tabController,
                        children: [
                          Container(
                              color: AppConst.kBkDark,
                              height: AppConst.kHeight * 0.3,
                              child: const TodaysTask()),
                          Container(
                            color: AppConst.kBkDark,
                            height: AppConst.kHeight * 0.3,
                            child: const CompletedTask(),
                          )
                        ],
                      ),
                    ),
                  ),
                  const HeightSpacer(height: 20),
                  // XpansionTile(
                  //     text: "Tomorrow's Task",
                  //     text2: "Tomorrow's tasks are shown here",
                  //     onExpansionChanged: (bool expanded) {
                  //       ref
                  //           .read(xpansionStateProvider.notifier)
                  //           .setStart(!expanded);
                  //     },
                  //     trailing: Padding(
                  //       padding: EdgeInsets.only(right: 12.w),
                  //       child: ref.watch(xpansionStateProvider)
                  //           ? const Icon(
                  //               AntDesign.circledown,
                  //               color: AppConst.kLight,
                  //             )
                  //           : const Icon(
                  //               AntDesign.closecircleo,
                  //               color: AppConst.kYellow,
                  //             ),
                  //     ),
                  //     children: [
                  //       TodoTile(
                  //         start: "3:00",
                  //         end: "9:00",
                  //         switcher: Switch(value: true, onChanged: (value) {}),
                  //       )
                  //     ]),
                  const TomorrowsTask(),
                  const HeightSpacer(height: 20),
                  const DayAfterTomorrowsTask(),

                ],
              ),
            ),
          )),
    );
  }
}

