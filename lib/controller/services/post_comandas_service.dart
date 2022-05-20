import 'package:comandas_app/controller/client/http_client.dart';
import 'package:dio/dio.dart';
import '../../models/comanda_model.dart';

const _comandasURL =
    'https://bdpcomandas-app.herokuapp.com/comanda/novaComanda';

class PostComandasService {
  final HttpClient client;

  PostComandasService({required this.client});

  Future<bool> newComanda(ComandaModel newComandaData) async {
    try {
      var response = await client.post(_comandasURL, {
        'detalhes': newComandaData.detalhes,
        'fechada': newComandaData.pronto,
        'valor_final': newComandaData.valorFinal,
        'nome_cliente': newComandaData.nomeCliente
      });

      return true;
    } catch (e) {
      print(e);

      return false;
    }
  }
}
