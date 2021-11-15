import 'package:get/get.dart';

import '../image_picker/view/image_picker_view.dart';
import '../login_form/view/login_view.dart';

class AppRouter {
  static const String login = '/login', imagePicker = '/imagepicker';

  static List<GetPage<dynamic>>? routes = [
    GetPage(name: login, page: () => const LoginView()),
    GetPage(name: imagePicker, page: () => const ImagePickerView()),
  ];
}
