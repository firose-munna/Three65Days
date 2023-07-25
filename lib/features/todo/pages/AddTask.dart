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

class AddTask extends ConsumerStatefulWidget {
  const AddTask({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _AddTaskState();
}

class _AddTaskState extends ConsumerState<AddTask> {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();

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
                    TaskModel task = TaskModel(
                      title: titleController.text,
                      description: descriptionController.text,
                      isCompleted: 0,
                      date: sheduleDate,
                      startTime: startTime.substring(10,16),
                      endTime: endTime.substring(10,16),
                      remind: 0,
                      repeat: "yes"
                    );


                    ref.read(todoStateProvider.notifier).addItem(task);

                    ref.read(startTimeStateProvider.notifier).setStart('');

                    ref.read(endTimeStateProvider.notifier).setStart('');

                    ref.read(dateStateProvider.notifier).setDate('');

                    Navigator.pop(context);
                  }
                  else{
                    print("Failed To Add Task");
                  }
                },
                width: AppConst.kWidth,
                height: 52.h,
                color: AppConst.kLight,
                color2: AppConst.kBlueLight,
                text: "Submit"),
          ],
        ),
      ),
    );
  }
}
