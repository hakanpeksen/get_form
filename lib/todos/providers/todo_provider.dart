import 'package:get/get_connect.dart';
import 'package:get_form/todos/model/todo.dart';

class TodoProvider extends GetConnect {
  @override
  void onInit() {
    httpClient.baseUrl = 'https://jsonplaceholder.typicode.com/';
    httpClient.maxAuthRetries = 2;
    httpClient.defaultDecoder = Todo.listFromJson;
    super.onInit();
  }

  Future<Response<List<Todo>>> getTodos() => get('todos');

  Future<Response> postTodo(body) => post('todos', body);

  Future<Response> putTodo(body) => put('todos/1', body);
  Future<Response> deleteTodo(int id) => delete('todos/$id');
}
