import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:three65days/common/models/TaskModel.dart';
import 'package:three65days/common/utils/AppConst.dart';
import 'package:three65days/features/todo/controller/todo/TodoProvider.dart';
import 'package:three65days/features/todo/widgets/TodoTiles.dart';

class CompletedTask extends ConsumerWidget {
  const CompletedTask({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    List<TaskModel> listData = ref.watch(todoStateProvider);
    List lastMonth = ref.read(todoStateProvider.notifier).last30dDays();

    var completedList = listData
        .where((element) =>
    element.isCompleted == 1 || lastMonth.contains(element.date!.substring(0, 10)))
        .toList();
    return ListView.builder(
        itemCount: completedList.length,
        itemBuilder: (context, index) {
          final data = completedList[index];

          return TodoTile(

            delete: (){
              ref.read(todoStateProvider.notifier).deleteTodo(data.id ?? 0);
            },
            editWidget: const SizedBox.shrink(),
            title: data.title,
            description: data.description,
            start: data.startTime,
            end: data.endTime,
            color: AppConst.kYellow,
            switcher: const Icon(MaterialCommunityIcons.check_circle, color: AppConst.kLight,),
          );
        });
  }
}
