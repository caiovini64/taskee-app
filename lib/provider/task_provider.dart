import 'package:flutter/cupertino.dart';
import 'package:taskee/data/dummy_data.dart';
import 'package:taskee/provider/task_model.dart';

class TaskProvider with ChangeNotifier {
  List<TaskModel> _items = [];
  List<TaskModel> get items => [..._items];

  void addItem(TaskModel task) {
    _items.add(task);
    notifyListeners();
  }
}
