import 'package:flutter/material.dart';
import 'package:outline_gradient_button/outline_gradient_button.dart';
import 'package:provider/provider.dart';
import 'package:taskee/models/task_model.dart';

class TaskItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final TaskModel task = Provider.of<TaskModel>(context);
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
      child: OutlineGradientButton(
        radius: Radius.circular(15),
        strokeWidth: 2,
        padding: EdgeInsets.only(top: 10, bottom: 10),
        gradient: LinearGradient(
          colors: task.isChecked == true
              ? [
                  Theme.of(context).primaryColor,
                  Theme.of(context).primaryColorLight,
                ]
              : [
                  Theme.of(context).disabledColor,
                  Theme.of(context).disabledColor,
                ],
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
        ),
        child: ListTile(
          title: Text(
            task.title,
            style: Theme.of(context).textTheme.headline2,
            overflow: TextOverflow.ellipsis,
            maxLines: 2,
            softWrap: true,
          ),
          trailing: IconButton(
            onPressed: () {
              task.toggleCheck();
            },
            icon: Icon(
              task.isChecked == true
                  ? Icons.check_outlined
                  : Icons.panorama_fish_eye,
              color: task.isChecked == true
                  ? Theme.of(context).primaryColorLight
                  : Theme.of(context).disabledColor,
            ),
          ),
        ),
      ),
    );
  }
}
