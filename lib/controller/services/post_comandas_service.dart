import 'package:comandas_app/controller/client/http_client.dart';

const _comandasURL = 'https://bdpcomandas-app.herokuapp.com/';

class PostComandasService {
  final HttpClient client;

  PostComandasService(this.client);

  // Future<void> newComanda(ComandaModel newComandaData) async {
  //   final jsonData = FromModelToJson(model: newComandaData).toJson();

  //   print(jsonData);

  //   final response = await client.post(_comandasURL, newComandaData);
  // }
}
