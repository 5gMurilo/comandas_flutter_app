import 'package:comandas_app/controller/services/get_comandas_service.dart';
import 'package:comandas_app/models/comanda_model.dart';
import 'package:flutter/material.dart';

class ComandasController extends ChangeNotifier {
  final GetComandasService _service;

  ComandasController(this._service);

  var comandas = <ComandaModel>[];

  Future<void> fetchComandas() async {
    comandas = await _service.getComanda();
    notifyListeners();
  }
}
