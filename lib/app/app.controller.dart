import 'package:flutter/foundation.dart';
import 'package:semana_arquitetura_app/app/interfaces/local_storage.interface.dart';
import 'package:semana_arquitetura_app/app/models/app_config.model.dart';
import 'package:semana_arquitetura_app/app/services/shared_local_storage.service.dart';

class AppController {
  // Singleton
  static final AppController instance = AppController._();

  // Criação de um construtor privado, para proteger o singleton de uma nova instancia;
  AppController._() {
    storage.get('isDark').then((value) {
      if (value != null) themeSwitch.value = value;
    });
  }

  final AppConfigModel config = AppConfigModel();
  bool get isDark => config.themeSwitch.value;
  ValueNotifier<bool> get themeSwitch => config.themeSwitch;

  final ILocalStorage storage = SharedLocalStorageService();

  changeTheme(bool value) {
    themeSwitch.value = value;
    storage.save('isDark', value);
  }
}
