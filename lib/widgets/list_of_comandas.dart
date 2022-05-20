import 'package:comandas_app/controller/comandas_controller.dart';
import 'package:comandas_app/widgets/card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class ComandasList extends StatefulWidget {
  const ComandasList({Key? key}) : super(key: key);

  @override
  State<ComandasList> createState() => _ComandasListState();
}

class _ComandasListState extends State<ComandasList> {
  final controller = Modular.get<ComandasController>();

  @override
  void initState() {
    super.initState();
    controller.fetchComandas();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: controller,
        builder: (context, position) {
          return ListView.builder(
            itemCount: controller.comandas.length,
            itemBuilder: (context, index) {
              final comanda = controller.fetchComandas();
              return ComandaCard(
                comanda: controller.comandas.elementAt(index),
                position: index,
              );
            },
          );
        });
  }
}
