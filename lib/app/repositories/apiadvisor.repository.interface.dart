import 'package:semana_arquitetura_app/app/models/clima_tempo.model.dart';

abstract class IApiAdvisor {
  Future<ClimaTempoModel> getWeather();
}
