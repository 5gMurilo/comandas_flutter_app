import 'package:comandas_app/controller/comandas_controller.dart';
import 'package:comandas_app/widgets/action_button.dart';
import 'package:comandas_app/widgets/card.dart';
import 'package:comandas_app/widgets/expandable_fab.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class HomeWidget extends StatefulWidget {
  const HomeWidget({Key? key}) : super(key: key);

  @override
  State<HomeWidget> createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> {
  final controller = Modular.get<ComandasController>();

  @override
  Widget build(BuildContext context) {
    const _appBarTitle = "Comandas";

    return Scaffold(
      backgroundColor: Color.fromARGB(255, 22, 22, 22),
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          _appBarTitle,
          style: TextStyle(letterSpacing: 1.5),
        ),
        backgroundColor: Color.fromARGB(255, 33, 33, 33),
        toolbarHeight: 120,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(bottom: Radius.circular(15)),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: AnimatedBuilder(
            animation: controller,
            builder: (context, position) {
              return ListView.builder(
                itemCount: controller.comandas.length,
                itemBuilder: (context, index) {
                  final comanda = controller.comandas.elementAt(index);
                  return ComandaCard(comanda: comanda);
                },
              );
            }),
      ),
      floatingActionButton: ExpandableFab(
        distance: 112,
        children: [
          Actionbutton(
            onPressed: () => print('salve'),
            icon: Icon(Icons.print_rounded),
          ),
          Actionbutton(
            onPressed: () => ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                backgroundColor: Theme.of(context).colorScheme.primary,
                content: Text(
                  'adicionar pedido',
                  style:
                      TextStyle(color: Theme.of(context).colorScheme.onPrimary),
                ),
              ),
            ),
            icon: Icon(Icons.add),
          ),
        ],
      ),
    );
  }
}
