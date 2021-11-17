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
}
