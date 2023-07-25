import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:three65days/common/models/TaskModel.dart';
import 'package:three65days/common/utils/AppConst.dart';
import 'package:three65days/features/todo/controller/todo/TodoProvider.dart';
import 'package:three65days/features/todo/pages/UpdateTask.dart';
import 'package:three65days/features/todo/widgets/TodoTiles.dart';

class TodaysTask extends ConsumerWidget {
  const TodaysTask({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    List<TaskModel> listData = ref.watch(todoStateProvider);
    String today = ref.read(todoStateProvider.notifier).getToday();

    var todayList = listData
        .where((element) =>
    element.isCompleted == 0 && element.date!.contains(today))
        .toList();
    return ListView.builder(
        itemCount: todayList.length,
        itemBuilder: (context, index) {
          final data = todayList[index];

          bool isCompleted =
          ref.read(todoStateProvider.notifier).getStatus(data);

          return TodoTile(

            delete: (){
              ref.read(todoStateProvider.notifier).deleteTodo(data.id ?? 0);
            },
            editWidget: GestureDetector(
              onTap: (){
                updateTitle = data.title.toString();
                updateDescription = data.description.toString();
                Navigator.push(context, MaterialPageRoute(builder: (context)=> UpdateTask(id: data.id??0)));
              },
              child: const Icon(MaterialCommunityIcons.circle_edit_outline, color: AppConst.kLight,),
            ),
            title: data.title,
            description: data.description,
            start: data.startTime,
            end: data.endTime,
            color: AppConst.kYellow,
            switcher: Switch(
              value: isCompleted,
              onChanged: (value) {
                ref.read(todoStateProvider.notifier).markAsCompleted(
                    data.id??0,
                    data.title.toString(),
                    data.description.toString(),
                    1,
                    data.date.toString(),
                    data.startTime.toString(),
                    data.endTime.toString()
                );
              },
            ),
          );
        });
  }
}
