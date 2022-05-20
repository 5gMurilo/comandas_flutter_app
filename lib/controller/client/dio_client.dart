import 'package:comandas_app/controller/client/http_client.dart';
import 'package:comandas_app/models/comanda_model.dart';
import 'package:dio/dio.dart';

class DioClient implements HttpClient {
  final dio = Dio();

  @override
  Future get(String url) async {
    final response = await dio.get(url);
    return response.data;
  }

  @override
  Future<void> post(String url, dynamic newComandaData) async {
    final postAction = await dio.post(url, data: newComandaData);

    print('${postAction.statusCode} - ${postAction.statusMessage}');
  }
}
