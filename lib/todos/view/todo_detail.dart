import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/todo_controller.dart';

class TodoDetailView extends StatelessWidget {
  const TodoDetailView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ctrl = Get.find<TodoController>();
    return Scaffold(
      appBar: AppBar(title: const Text('Todo Detail')),
      body: Obx(
        () {
          return ctrl.todo.value != null
              ? Card(child: ListTile(title: Text(ctrl.todo.value!.title.toString())))
              : Container();
        },
      ),
    );
  }
}
