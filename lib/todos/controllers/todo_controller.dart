import 'package:get/get.dart';
import 'package:get_form/core/app_router.dart';

import '../model/todo.dart';
import '../service/todo_service.dart';

class TodoController extends GetxController {
  var todoList = Rx<List<Todo>>([]);
  var todo = Rxn<Todo>();
  var isLoading = false.obs;
  int get count => todoList.value.length;
  final service = Get.put(TodoService());

  @override
  void onInit() {
    getTodos();
    super.onInit();
  }

  Future<void> getTodos() async {
    isLoading(true);
    todoList(await service.getTodos());
    isLoading(false);
  }

  openDetail(int id) {
    todo(todoList.value.firstWhere((e) => e.id == id));
    Get.toNamed(AppRouter.todoDetail);
  }
}
