import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Todo {
  final int id;
  final String title;
  final String status;

  Todo({required this.id, required this.title, required this.status});
}

class GState with ChangeNotifier {
  String baseUrl = "http://10.0.2.2:8000/api/task/"; // android
  // String baseUrl = "http://127.0.0.1:8000/api/task/"; // web
  List<Todo> _records = [];

  Future<void> getRecords() async {
    http.Response response = await http.get(Uri.parse(baseUrl));

    if (response.statusCode == 200) {
      final res = json.decode(response.body) as List;

      print(response.body);
    } else {
      print("No data.");
    }
  }
}
