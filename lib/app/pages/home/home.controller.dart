import 'package:flutter/foundation.dart';
import 'package:semana_arquitetura_app/app/models/clima_tempo.model.dart';
import 'package:semana_arquitetura_app/app/viewmodels/api_advisor.viewmodel.dart';

class HomeController {
  final ApiAdvisorViewModel viewModel;

  HomeController(this.viewModel);

  ValueNotifier<ClimaTempoModel> get weather => viewModel.climaTempoModel;

  getWeather() {
    viewModel.fill();
  }
}
