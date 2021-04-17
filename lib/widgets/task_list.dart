import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:taskee/widgets/task_item.dart';
import 'package:taskee/provider/task_provider.dart';

class TaskList extends StatefulWidget {
  @override
  _TaskListState createState() => _TaskListState();
}

class _TaskListState extends State<TaskList> {
  bool isLoading = true;
  @override
  void initState() {
    super.initState();
    Provider.of<TaskProvider>(context, listen: false).loadItems();
  }

  @override
  Widget build(BuildContext context) {
    final task = Provider.of<TaskProvider>(context, listen: true);
    final taskList = task.items;
    return Padding(
        padding: const EdgeInsets.only(top: 5),
        child: ListView.builder(
          itemCount: taskList.length,
          itemBuilder: (context, i) => ChangeNotifierProvider.value(
            value: taskList[i],
            child: TaskItem(),
          ),
        ));
  }
}
