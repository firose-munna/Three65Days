import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:three65days/common/helpers/DBHelper.dart';
import 'package:three65days/common/models/TaskModel.dart';

part 'TodoProvider.g.dart';

@riverpod
class TodoState extends _$TodoState{
  @override
  List <TaskModel> build(){
    return [];
  }
  void refresh()async{
    final data = await DbHelper.getItems();
    state = data.map((e) => TaskModel.fromJson(e)).toList();
  }

  void addItem(TaskModel task)async{
    await DbHelper.createItem(task);
    refresh();
  }

  void updateItems(int id, String title, String description, int isCompleted,
      String date, String startTime, String endTime)async{
    await DbHelper.updateItems(id, title, description, isCompleted,
        date,  startTime,  endTime);
    refresh();
  }

  Future<void> deleteTodo(int id)async{
    await DbHelper.deleteItem(id);
    refresh();
  }

  void markAsCompleted(int id, String title, String description, int isCompleted,
      String date, String startTime, String endTime)async{
    await DbHelper.updateItems(id, title, description, 1,
        date,  startTime,  endTime);
    refresh();
  }

  String getToday(){
    DateTime today = DateTime.now();
    return today.toString().substring(0, 10);
  }

  String getTomorrow(){
    DateTime tomorow = DateTime.now().add(Duration(days: 1));
    return tomorow.toString().substring(0, 10);
  }

  String getDayAfterTomorrow(){
    DateTime dayAfterTomorrow = DateTime.now().add(Duration(days: 2));
    return dayAfterTomorrow.toString().substring(0, 10);
  }

  List<String> last30dDays(){
    DateTime today = DateTime.now();
    DateTime oneMonthAgo = today.subtract(Duration(days: 30));

    List<String> dates = [];
    for(int i=0; i<30; i++){
      DateTime date = oneMonthAgo.add(Duration(days: 1));
      dates.add(date.toString().substring(0, 10));
    }
    return dates;
  }

  bool getStatus(TaskModel data){
    bool? isCompleted;
    if(data.isCompleted == 0){
      isCompleted = false;
    }
    else{
      isCompleted = true;
    }

    return isCompleted;
  }

}