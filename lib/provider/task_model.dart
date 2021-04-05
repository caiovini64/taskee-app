import 'dart:math';

import 'package:flutter/cupertino.dart';

class TaskModel with ChangeNotifier {
  final String id = Random().nextDouble().toString();
  final String title;
  bool isChecked;

  TaskModel({
    required this.title,
    required this.isChecked,
  });

  void toggleCheck() {
    isChecked = !isChecked;
    notifyListeners();
  }
}
