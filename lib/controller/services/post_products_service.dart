import 'package:comandas_app/controller/client/http_client.dart';
import 'package:comandas_app/models/foods_model.dart';

const _produtosURL = "https://bdpcomandas-app.herokuapp.com/post/novoProduto";

class PostProductService {
  final HttpClient client;

  PostProductService({required this.client});

  Future<bool> newProduct(FoodsModel newFood) async {
    try {
      await client.post(_produtosURL, {
        "produto": newFood.nome,
        "categoria": newFood.categoria,
        "valor": newFood.valor
      });

      return true;
    } catch (e) {
      return false;
    }
  }
}
