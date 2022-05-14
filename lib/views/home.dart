import 'package:comandas_app/controller/client/dio_client.dart';
import 'package:comandas_app/controller/comandas_controller.dart';
import 'package:comandas_app/controller/services/get_comandas_service.dart';
import 'package:comandas_app/models/comanda_model.dart';
import 'package:comandas_app/widgets/card.dart';
import 'package:comandas_app/widgets/list_of_comandas.dart';
import 'package:flutter/material.dart';

class HomeWidget extends StatefulWidget {
  const HomeWidget({Key? key}) : super(key: key);

  @override
  State<HomeWidget> createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> {
  final controller = ComandasController(
    GetComandasService(
      client: DioClient(),
    ),
  );

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller.fetchComandas();
  }

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
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          print('clicou');
        },
        child: Icon(Icons.menu, color: Colors.black),
        backgroundColor: Color.fromARGB(255, 216, 187, 83),
      ),
    );
  }
}
