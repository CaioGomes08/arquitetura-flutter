import 'package:flutter/foundation.dart';
import 'package:semana_arquitetura_app/app/services/shared_local_storage.service.dart';
import 'package:semana_arquitetura_app/app/viewmodels/change_theme.viewmodel.dart';

class AppController {
  // Singleton
  static final AppController instance = AppController._();

  // Criação de um construtor privado, para proteger o singleton de uma nova instancia;
  AppController._() {
    changeThemeViewModel.init();
  }

  final ChangeThemeViewModel changeThemeViewModel =
      ChangeThemeViewModel(storage: SharedLocalStorageService());

  // Criando um get para ter acesso facilitado em outras pages.
  bool get isDark => changeThemeViewModel.config.themeSwitch.value;
  ValueNotifier<bool> get themeSwitch =>
      changeThemeViewModel.config.themeSwitch;
}
