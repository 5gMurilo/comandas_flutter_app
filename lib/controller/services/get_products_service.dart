import 'package:comandas_app/controller/client/http_client.dart';
import 'package:comandas_app/models/foods_model.dart';

const _url = 'https://bdp-comandas-api.vercel.app/api/products';

class GetProductsService {
  final HttpClient client;

  GetProductsService({required this.client});

  Future<List<FoodsModel>> getFoods() async {
    final response = await client.get(_url);
    var responseSize = response.length;

    List<FoodsModel> foodsList = [];

    for (var i = 0; i < responseSize; i++) {
      foodsList.add(
        FoodsModel(
          id: response.elementAt(i)['_id'],
          categoria: response.elementAt(i)['categoria'],
          nome: response.elementAt(i)['nome'],
          valor: double.tryParse(response.elementAt(i)['preco'].toString())!,
        ),
      );
    }

    return foodsList;
  }
}
