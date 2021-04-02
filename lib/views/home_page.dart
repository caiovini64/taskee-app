import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:taskee/models/task_model.dart';
import 'package:taskee/provider/task_provider.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final task = Provider.of<TaskProvider>(context);
    final taskList = task.items;
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            stops: [0.1, 0.4, 0.9],
            colors: [
              Theme.of(context).primaryColor,
              Theme.of(context).primaryColorLight,
              Theme.of(context).primaryColorLight,
            ],
          ),
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 80.0, bottom: 60.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Taskee',
                    style: Theme.of(context).textTheme.headline1,
                  ),
                ],
              ),
            ),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40),
                    topRight: Radius.circular(40),
                  ),
                ),
                child: ListView.builder(
                  itemCount: taskList.length,
                  itemBuilder: (context, i) => Text(taskList[i].title),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
