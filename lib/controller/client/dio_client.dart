import 'package:comandas_app/controller/client/http_client.dart';
import 'package:dio/dio.dart';

class DioClient implements HttpClient {
  final dio = Dio();

  @override
  Future get(String url) async {
    final response = await dio.get(url);
    return response.data;
  }
}
