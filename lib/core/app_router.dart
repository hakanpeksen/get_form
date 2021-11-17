import 'package:get/get.dart';
import 'package:get_form/todos/view/todo_detail.dart';

import '../image_picker/view/image_picker_view.dart';
import '../login_form/view/login_view.dart';
import '../todos/view/todos.dart';

class AppRouter {
  static const String login = '/login',
      imagePicker = '/imagepicker',
      todos = '/todos',
      todoDetail = '/todo_detail';

  static List<GetPage<dynamic>>? routes = [
    GetPage(name: login, page: () => const LoginView()),
    GetPage(name: imagePicker, page: () => const ImagePickerView()),
    GetPage(name: todos, page: () => const TodosView()),
    GetPage(name: todoDetail, page: () => const TodoDetailView()),
  ];
}
