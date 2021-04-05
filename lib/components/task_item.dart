import 'package:flutter/material.dart';
import 'package:outline_gradient_button/outline_gradient_button.dart';
import 'package:provider/provider.dart';
import 'package:taskee/provider/task_model.dart';
import 'package:taskee/provider/task_provider.dart';

class TaskItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<TaskModel>(
      builder: (ctx, task, __) => GestureDetector(
        onTap: () {
          task.toggleCheck();
        },
        child: Padding(
          padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
          child: Dismissible(
            onDismissed: (_) {
              Provider.of<TaskProvider>(context, listen: false).remove(task.id);
            },
            direction: DismissDirection.startToEnd,
            key: UniqueKey(),
            background: Container(
              decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.circular(5),
              ),
              child: Align(
                alignment: Alignment(-0.9, 0.0),
                child: Icon(
                  Icons.delete,
                  color: Colors.white,
                ),
              ),
            ),
            child: OutlineGradientButton(
              backgroundColor: Colors.transparent,
              radius: Radius.circular(0),
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
                trailing: Icon(
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
        ),
      ),
    );
  }
}
