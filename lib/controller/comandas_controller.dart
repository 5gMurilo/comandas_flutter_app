import 'dart:developer';

import 'package:comandas_app/controller/client/dio_client.dart';
import 'package:comandas_app/controller/services/get_comandas_service.dart';
import 'package:comandas_app/controller/services/get_products_service.dart';
import 'package:comandas_app/controller/services/post_comandas_service.dart';
import 'package:comandas_app/controller/services/post_products_service.dart';
import 'package:comandas_app/models/comanda_model.dart';
import 'package:comandas_app/models/foods_model.dart';
import 'package:flutter/material.dart';

class ComandasController extends ChangeNotifier {
  final DioClient client;
  var comandas = <ComandaModel>[];
  var foods = <FoodsModel>[];

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
    //TODO: create file to this function
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

  Future<void> deleteComanda(String id) async {
    try {
      var response = await client.dio
          .delete('http://bdpcomandas-app.herokuapp.com/delete/pedido/$id');
      response.statusCode == 200
          ? print('deleted with success')
          : print('faiô -> ${response.statusCode}');
    } catch (e) {
      print('error -> $e');
    }
  }

  Future<void> fetchFoods() async {
    try {
      var service = GetProductsService(client: client);
      foods = await service.getFoods();
      notifyListeners();
    } catch (e) {
      print('error -> $e');
    }
  }

  Future<void> newFood(FoodsModel food) async {
    try {
      final _service = PostProductService(client: client);
      var response = await _service.newProduct(food);

      if (response == true) {
        fetchFoods();
      }
      notifyListeners();
    } catch (e) {
      print('$e');
    }
  }
}
