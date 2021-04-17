import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:taskee/data/dummy_data.dart';
import 'package:taskee/provider/task_model.dart';
import 'package:http/http.dart' as http;

class TaskProvider with ChangeNotifier {
  List<TaskModel> _items = DUMMY_DATA;
  List<TaskModel> get items => [..._items];

  void addItem(TaskModel task) async {
    const url =
        'https://taskee-app-f5e80-default-rtdb.firebaseio.com/tasks.json';

    try {
      await http.post(
        Uri.parse(url),
        body: json.encode({
          'id': task.id,
          'title': task.title,
          'isChecked': task.isChecked,
        }),
      );

      _items.add(task);
      notifyListeners();
    } catch (error) {
      throw Exception(error);
    }
  }

  void remove(String id) {
    final index = _items.indexWhere((task) => task.id == id);
    if (index >= 0) {
      _items.removeWhere((task) => task.id == id);
      notifyListeners();
    }
  }
}
