import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:taskee/utils/api_key.dart';

class TaskModel with ChangeNotifier {
  final String id;
  final String title;
  bool isChecked;

  TaskModel({
    required this.id,
    required this.title,
    required this.isChecked,
  });

  void _toggleCheck() {
    isChecked = !isChecked;
    notifyListeners();
  }

  void toggleCheck() async {
    _toggleCheck();
    try {
      final response = await http.patch(
        Uri.parse('$url/$id.json'),
        body: json.encode({
          'isChecked': isChecked,
        }),
      );

      //Caso não atualize no firebase
      if (response.statusCode >= 400) {
        _toggleCheck();
      }
    } catch (error) {
      _toggleCheck();
    }
  }
}
