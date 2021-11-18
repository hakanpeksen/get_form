import 'package:get/get.dart';

import '../model/todo.dart';
import '../providers/todo_provider.dart';

class TodoService {
  final _provider = Get.put(TodoProvider());

  Future<List<Todo>?> getTodos() async {
    var response = await _provider.getTodos();
    if (response.isOk) {
      if (response.body != null) {
        return List.from(response.body!.sublist(0, 20)); // 0.index den 20.index e kadar alır
      }
    }
    return [];
  }

  Future postTodo() async {
    var body = {"title": "sampletitle", "completed": true};
    var response = await _provider.postTodo(body);
    if (response.isOk) {
      return response;
    }
  }

  Future putTodo() async {
    var body = {"id:": "1", "title": "sampletitleupdate", "completed": false};
    var response = await _provider.putTodo(body);

    if (response.isOk) {
      return response;
    }
  }

  Future deleteTodo() async {
    var response = await _provider.deleteTodo(1);
    if (response.isOk) return;
  }
}
