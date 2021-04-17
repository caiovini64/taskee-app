import 'package:flutter/cupertino.dart';
import 'package:taskee/provider/task_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:taskee/utils/api_key.dart';

class TaskProvider with ChangeNotifier {
  List<TaskModel> _items = [];
  List<TaskModel> get items => [..._items];

  Future<void> loadItems() async {
    http.Response response = await http.get(Uri.parse('$url.json'));
    Map<String, dynamic> data = json.decode(response.body);
    data.forEach((id, data) {
      _items.add(TaskModel(
        id: id,
        title: data['title'],
        isChecked: data['isChecked'],
      ));
    });
    notifyListeners();
    return Future.value();
  }

  void addItem(TaskModel task) async {
    await http.post(
      Uri.parse('$url.json'),
      body: json.encode({
        'id': task.id,
        'title': task.title,
        'isChecked': task.isChecked,
      }),
    );
    _items.add(task);
    notifyListeners();
  }

  void remove(String id) async {
    final index = _items.indexWhere((task) => task.id == id);
    if (index >= 0) {
      final task = _items[index];

      final response = await http.delete(Uri.parse('$url/${task.id}.json'));

      if (response.statusCode < 400) {
        _items.remove(task);
        notifyListeners();
      }
    }
  }
}
