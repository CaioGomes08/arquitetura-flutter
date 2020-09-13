import 'package:flutter/foundation.dart';
import 'package:semana_arquitetura_app/app/models/app_config.model.dart';

class AppController {
  // Singleton
  static final AppController instance = AppController._();

  // Criação de um construtor privado, para proteger o singleton de uma nova instancia;
  AppController._();

  final AppConfigModel config = AppConfigModel();
  bool get isDark => config.themeSwitch.value;
  ValueNotifier<bool> get themeSwitch => config.themeSwitch;

  changeTheme(bool value) {
    themeSwitch.value = value;
  }
}
