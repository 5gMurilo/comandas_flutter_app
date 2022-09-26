import '../../models/comanda_model.dart';
import '../client/http_client.dart';

const _comandasURL = 'https://bdpcomandas.up.railway.app/api/';

class ApiService {
  final HttpClient client;

  ApiService(this.client);

  Future<List<ComandaModel>> getComanda() async {
    final response = await client.get(_comandasURL);
    var responseSize = response.length;

    List<ComandaModel> listReturn = [];

    for (var i = 0; i < responseSize; i++) {
      var details = response.elementAt(i)['detalhes'] as List<dynamic>;

      List<Map<dynamic, dynamic>> detalhes = [];

      for (var detail in details) {
        detalhes.add(detail as Map<dynamic, dynamic>);
      }

      listReturn.add(
        ComandaModel(
          id: response.elementAt(i)['_id'],
          detalhes: detalhes,
          valorFinal: double.tryParse(
                  response.elementAt(i)['valor_final'].toString()) ??
              0.0,
          nomeCliente: response.elementAt(i)['nome_cliente'],
          pronto: response.elementAt(i)['fechada'],
        ),
      );
    }

    return listReturn;
  }

  Future<void> newComanda(ComandaModel newComandaData) async {
    await client.post(_comandasURL, {
      'detalhes': newComandaData.detalhes,
      'fechada': newComandaData.pronto,
      'valor_final': newComandaData.valorFinal,
      'nome_cliente': newComandaData.nomeCliente
    });
  }
}
