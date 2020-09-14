import 'package:semana_arquitetura_app/app/interfaces/client_http.interface.dart';
import 'package:semana_arquitetura_app/app/models/clima_tempo.model.dart';
import 'package:semana_arquitetura_app/app/repositories/apiadvisor.repository.interface.dart';

class ApiAdvisorRepository implements IApiAdvisor {
  final IClientHttp client;

  ApiAdvisorRepository(this.client);

  @override
  Future<ClimaTempoModel> getWeather() async {
    var json = await client.get(
        "http://apiadvisor.climatempo.com.br/api/v1/anl/synoptic/locale/BR?token=95a9cb1ae6b422e8d7b7a4fe634fb14f");

    ClimaTempoModel climaTempo = ClimaTempoModel.fromJson(json[0]);
    return climaTempo;
  }
}
