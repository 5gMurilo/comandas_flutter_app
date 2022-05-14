import 'dart:convert';

import 'package:comandas_app/controller/client/http_client.dart';
import 'package:comandas_app/controller/services/get_comandas_service.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

void main() {
  testWidgets('should return a not empty list', (tester) async {
    final client = MockHttpClient();

    when(() => client.get(_comandasURL))
        .thenAnswer((_) async => jsonDecode(mockResponse));

    final service = GetComandasService(client: client);
    final comandas = await service.getComanda();

    expect(comandas.iterator.moveNext(), true);
  });
}

class MockHttpClient extends Mock implements HttpClient {}

const _comandasURL = 'https://bdpcomandas-app.herokuapp.com/';

const mockResponse = r'''[
    {
        "_id": "627eae116b6352b2bfcbe0f1",
        "detalhes": {
            "espetinho de frango": 6,
            "espetinho de carne": 0,
            "espetinho de linguiça": 1
        },
        "fechada": false,
        "valor_final": 35,
        "nome_cliente": "Natan",
        "__v": 0
    },
    {
        "_id": "627eae216b6352b2bfcbe0f3",
        "detalhes": {
            "espetinho de frango": 1,
            "espetinho de carne": 2,
            "espetinho de linguiça": 2
        },
        "fechada": false,
        "valor_final": 25,
        "nome_cliente": "Murilo",
        "__v": 0
    },
    {
        "_id": "627eae486b6352b2bfcbe0f5",
        "detalhes": {
            "espetinho de frango": 2,
            "espetinho de carne": 2,
            "espetinho de linguiça": 2,
            "coca 350ml": 2
        },
        "fechada": false,
        "valor_final": 40,
        "nome_cliente": "Murilo",
        "__v": 0
    }
]''';
