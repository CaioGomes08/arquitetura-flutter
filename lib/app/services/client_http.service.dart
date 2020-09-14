import 'package:dio/dio.dart';
import 'package:semana_arquitetura_app/app/interfaces/client_http.interface.dart';

class ClientHttpService implements IClientHttp {
  final Dio dio = Dio();

  @override
  void addToken(String token) {}

  @override
  Future get(String url) async {
    var response = await dio.get(url);
    return response.data;
  }
}
