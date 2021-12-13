import 'package:get_storage/get_storage.dart';
import '../model/login_model.dart';

class AppService {
  final box = GetStorage();
  final _hasLoggedKey = 'loggedIn';
  final _key = 'loginKey';

  // save loggedIn storage
  void saveHasLoggedIn(bool val) {
    box.write(_hasLoggedKey, val);
  }

// get loggedIn storage
  bool getHasLoggedIn() => box.read<bool?>(_hasLoggedKey) ?? false;

// login get name
  String get name => getLoginModel()?.name ?? '';

  LoginModel? getLoginModel() {
    final map = box.read(_key);
    // remove ile Geçici olarak silindi Login sayfasına attı // box.remove(_hasLoggedKey);
    // loginden sonra normal akışa devam eder
    if (map != null) {
      return LoginModel.fromMap(map);
    }
    return null;
  }

// login save model
  void saveLoginModel(LoginModel model) {
    box.write(_key, model.toMap());
  }
}
