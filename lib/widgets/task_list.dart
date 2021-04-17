import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:taskee/widgets/task_item.dart';
import 'package:taskee/provider/task_provider.dart';

class TaskList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final task = Provider.of<TaskProvider>(context, listen: true);
    final taskList = task.items;
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: ListView.builder(
        itemCount: taskList.length,
        itemBuilder: (context, i) => ChangeNotifierProvider.value(
          value: taskList[i],
          child: TaskItem(),
        ),
      ),
    );
  }
}
