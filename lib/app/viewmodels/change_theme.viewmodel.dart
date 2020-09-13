import 'package:semana_arquitetura_app/app/interfaces/local_storage.interface.dart';
import 'package:semana_arquitetura_app/app/models/app_config.model.dart';

// Responsavel pela regra de negocio de mudança de temas
class ChangeThemeViewModel {
  final ILocalStorage storage;

  final AppConfigModel config = AppConfigModel();

  ChangeThemeViewModel({this.storage});

  Future init() async {
    await storage.get('isDark').then((value) {
      if (value != null) config.themeSwitch.value = value;
    });
  }

  changeTheme(bool value) {
    config.themeSwitch.value = value;
    storage.save('isDark', value);
  }
}
