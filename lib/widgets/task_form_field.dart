import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:taskee/provider/task_model.dart';
import 'package:taskee/provider/task_provider.dart';
import 'package:taskee/utils/layout_utils.dart';

class TaskFormField extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    LayoutUtils _layoutUtil = LayoutUtils(context);

    final taskTitleController = TextEditingController();

    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16, top: 20, bottom: 30),
      child: Container(
        width: _layoutUtil.resizeWidget(400),
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.2),
          borderRadius: BorderRadius.circular(5),
        ),
        child: Padding(
          padding:
              const EdgeInsets.only(left: 16, right: 16, top: 10, bottom: 10),
          child: Row(
            children: [
              Expanded(
                child: TextFormField(
                  controller: taskTitleController,
                  keyboardType: TextInputType.text,
                  style: TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    enabledBorder: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    hintText: 'Adcionar Nova Tarefa',
                    hintStyle:
                        TextStyle(color: Theme.of(context).disabledColor),
                  ),
                ),
              ),
              IconButton(
                onPressed: () {
                  Provider.of<TaskProvider>(context, listen: false)
                      .addItem(TaskModel(
                    title: taskTitleController.text,
                    isChecked: false,
                  ));
                  FocusScope.of(context).requestFocus(new FocusNode());
                  taskTitleController.clear();
                },
                icon: Icon(
                  Icons.add,
                  color: Theme.of(context).disabledColor,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
