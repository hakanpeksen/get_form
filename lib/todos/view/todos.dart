import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_form/todos/controllers/todo_controller.dart';

class TodosView extends StatelessWidget {
  const TodosView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ctrl = Get.put(TodoController());
    return Scaffold(
      appBar: AppBar(title: const Text('Todos')),
      body: Obx(() {
        if (ctrl.isLoading.value) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        return ListView.separated(
            itemCount: ctrl.count,
            itemBuilder: (context, index) {
              final todo = ctrl.todoList.value[index];
              return Card(
                child: ListTile(
                  contentPadding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                  leading: CircleAvatar(child: Text(todo.id.toString())),
                  title: Text(todo.title),
                  onTap: () => ctrl.openDetail(todo.id),
                ),
              );
            },
            separatorBuilder: (context, index) => const Divider(thickness: 1, height: 0));
      }),
    );
  }
}
