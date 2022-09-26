import 'package:comandas_app/controller/client/http_client.dart';
import 'package:comandas_app/models/comanda_model.dart';

const _comandasURL = 'https://bdpcomandas.up.railway.app/api/comandas';

class GetComandasService {
  final HttpClient client;

  GetComandasService({required this.client});

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
}
