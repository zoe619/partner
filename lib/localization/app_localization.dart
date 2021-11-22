import 'dart:ui';

import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'en_usa.dart';
import 'es_es.dart';
import 'ru_ru.dart';

const String LANGUAGE_CODE = 'languageCode';

//languages code
const String ENGLISH = 'en';
const String ESPANOL = 'es';
const String RUSSIAN = 'ru';

abstract class AppTranslation extends Translations {
  static Map<String, Map<String, String>> translationsKeys = {"en_US": enUS, "es": es, "ru": ru};
}

Future<Locale> getLocale() async {
  SharedPreferences _prefs = await SharedPreferences.getInstance();
  String languageCode = _prefs.getString(LANGUAGE_CODE) ?? "en";
  return _locale(languageCode);
}

Locale _locale(String languageCode) {
  switch (languageCode) {
    case ENGLISH:
      return Locale(ENGLISH, 'US');
    case ESPANOL:
      return Locale(ESPANOL, "ES");
    case RUSSIAN:
      return Locale(RUSSIAN, "RU");
    default:
      return Locale(ENGLISH, 'US');
  }
}
