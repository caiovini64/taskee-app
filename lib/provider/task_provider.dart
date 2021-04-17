import 'package:flutter/cupertino.dart';
import 'package:taskee/provider/task_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:taskee/utils/api_key.dart';

class TaskProvider with ChangeNotifier {
  List<TaskModel> _items = [];
  List<TaskModel> get items => [..._items];

  Future<void> loadItems() async {
    http.Response response = await http.get(Uri.parse(url));
    Map<String, dynamic> data = json.decode(response.body);
    data.forEach((id, data) {
      _items.add(TaskModel(
        id: id,
        title: data['title'],
        isChecked: data['isChecked'],
      ));
    });
    notifyListeners();
  }

  void addItem(TaskModel task) async {
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
  }

  void remove(String id) {
    final index = _items.indexWhere((task) => task.id == id);
    if (index >= 0) {
      _items.removeWhere((task) => task.id == id);
      notifyListeners();
    }
  }
}
