import 'package:flutter/material.dart';
import 'package:gradient_ui_widgets/buttons/gradient_floating_action_button.dart';
import 'package:gradient_ui_widgets/gradient_ui_widgets.dart';
import 'package:taskee/components/task_form_field.dart';

import 'package:taskee/components/task_list.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
              padding: const EdgeInsets.only(top: 80.0, bottom: 30.0),
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
            TaskFormField(),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                ),
                child: TaskList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
