import 'package:flutter/cupertino.dart';
import 'package:taskee/data/dummy_data.dart';
import 'package:taskee/provider/task_model.dart';

class TaskProvider with ChangeNotifier {
  List<TaskModel> _items = DUMMY_DATA;
  List<TaskModel> get items => [..._items];

  void addItem(TaskModel task) {
    _items.add(task);
    notifyListeners();
  }

  void remove(String id) {
    final index = _items.indexWhere((task) => task.id == id);
    if (index >= 0) {
      _items.removeWhere((task) => task.id == id);
      notifyListeners();
    }
  }
}
