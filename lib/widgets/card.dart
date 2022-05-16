import 'package:comandas_app/models/comanda_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class ComandaCard extends StatelessWidget {
  const ComandaCard({
    Key? key,
    required this.comanda,
  }) : super(key: key);

  final ComandaModel comanda;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Modular.to.navigate('/comanda');
      },
      child: Container(
        child: Card(
          margin: EdgeInsets.symmetric(vertical: 10),
          color: Color.fromARGB(255, 57, 57, 57),
          elevation: 5,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            child: Row(
              children: [
                Flexible(
                  flex: 3,
                  fit: FlexFit.tight,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8),
                          child: Text('Pedido do(a) ${comanda.nomeCliente}',
                              style:
                                  TextStyle(fontSize: 20, color: Colors.white)),
                        ),
                        Text('Toque para ver detalhes',
                            style:
                                TextStyle(fontSize: 16, color: Colors.white)),
                      ],
                    ),
                  ),
                ),
                Flexible(
                  flex: 1,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8),
                        child: Text('R\$ ${comanda.valorFinal}',
                            style:
                                TextStyle(fontSize: 20, color: Colors.white)),
                      ),
                      Text(comanda.pronto ? 'Pronto' : 'Fazendo..',
                          style: TextStyle(
                              fontSize: 16,
                              color: Color.fromARGB(255, 255, 17, 0))),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
