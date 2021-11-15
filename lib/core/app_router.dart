import 'package:get/get.dart';
import 'package:get_form/image_picker/view/image_picker_view.dart';
import 'package:get_form/login_form/view/login_view.dart';

class AppRouter {
  static const String login = '/login', imagePicker = '/imagepicker';

  static List<GetPage<dynamic>>? routes = [
    GetPage(name: login, page: () => const LoginView()),
    GetPage(
      name: imagePicker,
      page: () => const ImagePickerView(),
    ),
  ];
}
