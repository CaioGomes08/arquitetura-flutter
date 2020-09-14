import 'package:flutter/foundation.dart';
import 'package:semana_arquitetura_app/app/models/clima_tempo.model.dart';
import 'package:semana_arquitetura_app/app/repositories/apiadvisor.repository.interface.dart';

class ApiAdvisorViewModel {
  final IApiAdvisor repository;

  final climaTempoModel = ValueNotifier<ClimaTempoModel>(null);

  ApiAdvisorViewModel(this.repository);

  fill() async {
    climaTempoModel.value = await repository.getWeather();
  }
}
