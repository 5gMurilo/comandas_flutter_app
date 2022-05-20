import 'dart:developer';

import 'package:comandas_app/controller/client/dio_client.dart';
import 'package:comandas_app/controller/services/get_comandas_service.dart';
import 'package:comandas_app/controller/services/post_comandas_service.dart';
import 'package:comandas_app/models/comanda_model.dart';
import 'package:flutter/material.dart';

class ComandasController extends ChangeNotifier {
  final DioClient client;
  var comandas = <ComandaModel>[];

  ComandasController(this.client);

  Future<void> fetchComandas() async {
    final _service = GetComandasService(client: client);
    comandas = await _service.getComanda();
    notifyListeners();
  }

  Future<void> newComanda(
    ComandaModel newComandaData,
  ) async {
    final _service = PostComandasService(client: client);
    var response = await _service.newComanda(newComandaData);

    if (response == true) {
      fetchComandas();
    }
    notifyListeners();
  }

  Future<void> changeToDone(bool value, String id) async {
    try {
      var response = await client.dio.patch(
        'https://bdpcomandas-app.herokuapp.com/comanda/update/$id',
        data: {'fechada': value},
      );

      response.statusCode == 200
          ? print('complete with success')
          : print('faiô');
    } catch (e) {
      print(e);
    }
  }
}
