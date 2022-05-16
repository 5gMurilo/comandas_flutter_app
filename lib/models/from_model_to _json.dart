import 'dart:convert';

import 'package:comandas_app/models/comanda_model.dart';

class FromModelToJson {
  final ComandaModel model;

  FromModelToJson({required this.model});

  toJson() {
    var json = jsonDecode(r'''
    {
      "detalhes": [
        {
          "espetinho de frango": 2
        },
        {
          "espetinho de frango": 2
        },
        {
          "espetinho de frango": 2
        }
      ],
      "fechada": ${model.pronto},
      "valor_final": ${model.valorFinal},
      "nome_cliente": ${model.nomeCliente}
    }
''');

    return json;
  }
}

/*{
    "detalhes": [
        {
            "espetinho de frango": 2
        },
        {
            "espetinho de carne": 2
        },
        {
            "espetinho de linguiça": 2
        },
        {
            "coca 350ml": 2
        }
    ],
    "fechada": false,
    "valor_final": 40,
    "nome_cliente": "Murilo"
}*/