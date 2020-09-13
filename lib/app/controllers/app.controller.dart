import 'package:flutter/foundation.dart';

class AppController {
  // Singleton
  static final AppController instance = AppController._();

  // Criação de um construtor privado, para proteger o singleton de uma nova instancia;
  AppController._();

  final themeSwitch = ValueNotifier<bool>(false);

  changeTheme(bool value) {
    themeSwitch.value = value;
  }
}
