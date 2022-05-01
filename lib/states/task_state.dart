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
      final data = json.decode(response.body) as List;
      List<Todo> getTodo = [];

      data.forEach((element) {
        Todo todo = Todo(
            id: element['id'],
            title: element['title'],
            status: element['status']);
        getTodo.add(todo);
      });

      _records = getTodo;
      notifyListeners();
    } else {
      print("No data.");
    }
  }

  List<Todo> get todos {
    return [..._records];
  }

  Future<void> addTodo(String title) async {
    try{
      http.Response response =
      await http.post(Uri.parse(baseUrl), headers: {
        'Content-Type': 'application/json'
      }, body: json.encode({
        'title': title,
      }));

      print(response.body);
    } catch(e) {
      print(e);
    }
  }

  Future<void> deleteTodo(int id) async {
    await http.delete(Uri.parse(baseUrl + '${id}/')).then((response) {
      print(response.body);
      notifyListeners();
    }).catchError((e) {
      print(e);
    });
  }

  Todo details(dynamic id) {
    return _records.firstWhere((element) => element.id == id);
  }

  // Future<Todo> details(dynamic id) async {
  //   // return _records.firstWhere((element) => element.id == id);
  //
  //   http.Response response = await http.get(Uri.parse(baseUrl + '${id}/'));
  //   final data = json.decode(response.body);
  //
  //   Todo todo = Todo(id: data['id'], title: data['title'], status: data['status']);
  //   return todo;
  // }

  Future<void> update(dynamic id, String title, String status) async{
    try {
      http.Response response = await http.put(
          Uri.parse(baseUrl + '${id}/'),
          headers: {"Content-Type": "application/json"},
          body: json.encode({
            "title": title,
            "status": status
          }),
      );

      print(response.body);
      notifyListeners();
    } catch(e) {
      print(e);
    }
  }

}
