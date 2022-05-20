import 'package:comandas_app/models/comanda_model.dart';

abstract class HttpClient {
  Future<dynamic> get(String url);

  Future<void> post(String url, dynamic data);
}
