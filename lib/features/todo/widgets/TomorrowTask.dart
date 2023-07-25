import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:three65days/common/utils/AppConst.dart';
import 'package:three65days/common/widgets/ExpansionTile.dart';
import 'package:three65days/features/todo/controller/XpansionProvider.dart';
import 'package:three65days/features/todo/controller/todo/TodoProvider.dart';
import 'package:three65days/features/todo/pages/UpdateTask.dart';
import 'package:three65days/features/todo/widgets/TodoTiles.dart';

class TomorrowsTask extends ConsumerWidget {
  const TomorrowsTask({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final todos = ref.read(todoStateProvider);
    String tomorrow = ref.read(todoStateProvider.notifier).getTomorrow();
    
    var tomorrowTask = todos.where((element) => element.date!.contains(tomorrow));

    return XpansionTile(
        text: "Tomorrow's Task",
        text2: "Tomorrow's Tasks Are Shown Here",
        onExpansionChanged: (bool expanded) {
          ref
              .read(xpansionStateProvider.notifier)
              .setStart(!expanded);
        },
        trailing: Padding(
          padding: EdgeInsets.only(right: 12.w),
          child: ref.watch(xpansionStateProvider)
              ? const Icon(
            AntDesign.circledown,
            color: AppConst.kLight,
          )
              : const Icon(
            AntDesign.closecircleo,
            color: AppConst.kYellow,
          ),
        ),
        children: [
          for(final todo in tomorrowTask)
          TodoTile(
            delete: (){
              ref.read(todoStateProvider.notifier).deleteTodo(todo.id ?? 0);
            },
            editWidget: GestureDetector(
              onTap: (){
                updateTitle = todo.title.toString();
                updateDescription = todo.description.toString();

                Navigator.push(context, MaterialPageRoute(builder: (context)=> UpdateTask(id: todo.id??0)));
              },
              child: const Icon(MaterialCommunityIcons.circle_edit_outline, color: AppConst.kLight,),
            ),
            title: todo.title,
            description: todo.description,
            start: todo.startTime,
            end: todo.endTime,
            color: AppConst.kBlueLight,
            switcher: const SizedBox.shrink(),
          )
        ]);
  }
}
