import 'package:comandas_app/controller/client/http_client.dart';
import 'package:comandas_app/models/foods_model.dart';

const _produtosURL = "https://bdpcomandas.up.railway.app/api/post/product";

class PostProductService {
  final HttpClient client;

  PostProductService({required this.client});

  Future<bool> newProduct(FoodsModel newFood) async {
    try {
      await client.post(_produtosURL, {
        "nome": newFood.nome,
        "categoria": newFood.categoria,
        "valor": newFood.valor
      });

      return true;
    } catch (e) {
      return false;
    }
  }
}
