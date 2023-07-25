import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:three65days/common/models/TaskModel.dart';
import 'package:three65days/common/utils/AppConst.dart';
import 'package:three65days/common/widgets/AppStyle.dart';
import 'package:three65days/common/widgets/CustomOutlineButton.dart';
import 'package:three65days/common/widgets/CustomTextField.dart';
import 'package:three65days/common/widgets/HeightSpacer.dart';
import 'package:flutter_datetime_picker_plus/flutter_datetime_picker_plus.dart'
    as picker;
import 'package:three65days/features/todo/controller/dates/DateProvider.dart';
import 'package:three65days/features/todo/controller/todo/TodoProvider.dart';

class UpdateTask extends ConsumerStatefulWidget {
  const UpdateTask( {super.key, required this.id,});

  final int id;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _UpdateTaskState();
}

class _UpdateTaskState extends ConsumerState<UpdateTask> {
  final TextEditingController titleController = TextEditingController(text: updateTitle);
  final TextEditingController descriptionController = TextEditingController(text: updateDescription);

  @override
  Widget build(BuildContext context) {
    var sheduleDate = ref.watch(dateStateProvider);
    var startTime = ref.watch(startTimeStateProvider);
    var endTime = ref.watch(endTimeStateProvider);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: ListView(
          children: [
            const HeightSpacer(height: 20),
            CustomTextField(
              hintText: "Add Title",
              controller: titleController,
              hintStyle: AppStyle(16, AppConst.kBkDark, FontWeight.w600),
            ),
            const HeightSpacer(height: 20),
            CustomTextField(
              hintText: "Add Description",
              controller: descriptionController,
              hintStyle: AppStyle(16, AppConst.kBkDark, FontWeight.w600),
            ),
            const HeightSpacer(height: 20),
            CustomOutlineButton(
                onTap: () {
                  picker.DatePicker.showDatePicker(context,
                      showTitleActions: true,
                      theme: picker.DatePickerTheme(
                          headerColor: AppConst.kGreyLight,
                          doneStyle:
                              TextStyle(color: Colors.white, fontSize: 16)),
                      onConfirm: (date) {
                    ref
                        .read(dateStateProvider.notifier)
                        .setDate(date.toString());
                  }, currentTime: DateTime.now(), locale: picker.LocaleType.en);
                },
                width: AppConst.kWidth,
                height: 52.h,
                color: AppConst.kLight,
                color2: AppConst.kGreyLight,
                text: sheduleDate == ""
                    ? "Set Date"
                    : sheduleDate.substring(0, 10)),
            const HeightSpacer(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomOutlineButton(
                    onTap: () {
                      picker.DatePicker.showDateTimePicker(context,
                          showTitleActions: true, onConfirm: (time) {
                        ref
                            .read(startTimeStateProvider.notifier)
                            .setStart(time.toString());
                      }, locale: picker.LocaleType.en);
                    },
                    width: AppConst.kWidth * 0.4,
                    height: 52.h,
                    color: AppConst.kLight,
                    color2: AppConst.kGreyLight,
                    text: startTime == ""?"Start Time": startTime.substring(10,16)),
                CustomOutlineButton(
                    onTap: () {
                      picker.DatePicker.showDateTimePicker(context,
                          showTitleActions: true, onConfirm: (time) {
                            ref
                                .read(endTimeStateProvider.notifier)
                                .setStart(time.toString());
                          }, locale: picker.LocaleType.en);
                    },
                    width: AppConst.kWidth * 0.4,
                    height: 52.h,
                    color: AppConst.kLight,
                    color2: AppConst.kGreyLight,
                    text: endTime == ""?"End Time":endTime.substring(10,16)),
              ],
            ),
            const HeightSpacer(height: 20),
            CustomOutlineButton(
                onTap: () {
                  if(
                  titleController.text.isNotEmpty
                  && descriptionController.text.isNotEmpty &&
                  sheduleDate.isNotEmpty&&
                  startTime.isNotEmpty&&
                  endTime.isNotEmpty){

                    ref.read(todoStateProvider.notifier).updateItems(
                        widget.id,
                      titleController.text,
                      descriptionController.text,
                      0,
                      sheduleDate,
                      startTime.substring(10, 16),
                      endTime.substring(10, 16),

                    );

                    ref.read(startTimeStateProvider.notifier).setStart('');

                    ref.read(endTimeStateProvider.notifier).setStart('');

                    ref.read(dateStateProvider.notifier).setDate('');

                    Navigator.pop(context);
                  }
                  else{
                    print("Failed To Updated the Task");
                  }
                },
                width: AppConst.kWidth,
                height: 52.h,
                color: AppConst.kLight,
                color2: AppConst.kBlueLight,
                text: "Update"),
          ],
        ),
      ),
    );
  }
}
