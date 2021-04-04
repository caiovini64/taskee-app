import 'package:flutter/cupertino.dart';
import 'package:taskee/data/dummy_data.dart';
import 'package:taskee/provider/task_model.dart';

class TaskProvider with ChangeNotifier {
  List<TaskModel> _items = DUMMY_DATA;
  List<TaskModel> get items => [..._items];

  void deleteItem(String id) {
    _items.remove(id);
    notifyListeners();
  }
}
