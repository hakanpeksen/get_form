import 'package:get/get.dart';

import 'lang/translation_en.dart';
import 'lang/translation_tr.dart';

class AppTranslations extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'en': TranslationEN.keys,
        'tr': TranslationTR.keys,
      };
}
