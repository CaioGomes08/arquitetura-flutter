import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:semana_arquitetura_app/app/interfaces/client_http.interface.dart';
import 'package:semana_arquitetura_app/app/models/clima_tempo.model.dart';
import 'package:semana_arquitetura_app/app/repositories/apiadvisor.repository.dart';
import 'package:semana_arquitetura_app/app/viewmodels/api_advisor.viewmodel.dart';

class ClientHttpMock implements IClientHttp {
  @override
  void addToken(String token) {}

  @override
  Future get(String url) async {
    return [
      ClimaTempoModel(country: "BR", date: "2020/05/30", text: "Teste")
          .toJson(),
    ];
  }
}

class ClientHttpErrorMock implements IClientHttp {
  @override
  void addToken(String token) {}

  @override
  Future get(String url) async {
    return [];
  }
}

class ClientHttpMockito extends Mock implements IClientHttp {}

main() {
  final mock = ClientHttpMockito();

  final viewModel = ApiAdvisorViewModel(
    ApiAdvisorRepository(mock),
  );

  group('ApiAdvisorViewModel ', () {
    test('ApiAdvisorViewModel error', () async {
      when(mock.get(
              "http://apiadvisor.climatempo.com.br/api/v1/anl/synoptic/locale/BR?token=95a9cb1ae6b422e8d7b7a4fe634fb14f"))
          .thenThrow(Exception("Erro"));
      await viewModel.fill();
      expect(viewModel.climaTempoModel.value, null);
    });

    test('ApiAdvisorViewModel success', () async {
      when(mock.get(
              "http://apiadvisor.climatempo.com.br/api/v1/anl/synoptic/locale/BR?token=95a9cb1ae6b422e8d7b7a4fe634fb14f"))
          .thenAnswer((_) => Future.value([
                ClimaTempoModel(
                        country: "BR", date: "2020/05/30", text: "Teste")
                    .toJson(),
              ]));
      await viewModel.fill();
      expect(viewModel.climaTempoModel.value, isA<ClimaTempoModel>());
    });
  });
}
