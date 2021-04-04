import 'package:flutter/cupertino.dart';

class TaskModel with ChangeNotifier {
  final String id;
  final String title;
  bool isChecked;

  TaskModel({
    required this.id,
    required this.title,
    required this.isChecked,
  });

  void toggleCheck() {
    isChecked = !isChecked;
    notifyListeners();
  }
}
