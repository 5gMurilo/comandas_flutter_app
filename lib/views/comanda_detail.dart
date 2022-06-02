import 'package:comandas_app/controller/comandas_controller.dart';
import 'package:comandas_app/widgets/appbar.dart';
import 'package:comandas_app/widgets/change_status_switch.dart';
import 'package:comandas_app/widgets/custom_buttom.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class ComandaDetails extends StatefulWidget {
  const ComandaDetails({required this.position, Key? key}) : super(key: key);

  final int position;

  @override
  State<ComandaDetails> createState() => _ComandaDetailsState();
}

class _ComandaDetailsState extends State<ComandaDetails> {
  var controller = Modular.get<ComandasController>();

  @override
  Widget build(BuildContext context) {
    bool initialSwitchValue =
        controller.comandas.elementAt(widget.position).pronto;
    var comanda = controller.comandas.elementAt(widget.position);

    print(comanda.detalhes);

    return Scaffold(
      backgroundColor: Color.fromARGB(255, 22, 22, 22),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(120),
        child: CustomAppBar(
          iconButton: IconButton(
              onPressed: () {
                Modular.to.navigate('/home');
              },
              icon: Icon(Icons.arrow_back_ios_new)),
          title: 'Detalhes',
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.symmetric(vertical: 10),
              child: Text(
                'Itens do pedido',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                  letterSpacing: 1.3,
                ),
              ),
            ),
            ListView.builder(
              shrinkWrap: true,
              itemCount: comanda.detalhes.length,
              itemBuilder: (context, index) {
                print(comanda.id);
                return Container(
                  margin: EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                  child: IntrinsicHeight(
                    child: Row(
                      children: [
                        Text(
                          '${comanda.detalhes.elementAt(index).values.toString().replaceAll(RegExp('([()])'), '')}x',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            letterSpacing: 1.2,
                          ),
                        ),
                        VerticalDivider(
                          width: 35,
                          thickness: 1.2,
                          color: Colors.white,
                        ),
                        Text(
                          comanda.detalhes
                              .elementAt(index)
                              .keys
                              .toString()
                              .replaceAll(RegExp('([()])'), ''),
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            letterSpacing: 1.2,
                          ),
                        )
                      ],
                    ),
                  ),
                );
              },
            ),
            Divider(
              height: 35,
              thickness: 1,
              color: Colors.white,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Valor do pedido',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    letterSpacing: 1,
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 10),
                  child: Text(
                    'R\$ ${comanda.valorFinal}',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      letterSpacing: 2.5,
                    ),
                  ),
                ),
              ],
            ),
            Divider(
              height: 35,
              thickness: 1,
              color: Colors.white,
            ),
            Column(
              children: [
                Text(
                  'Status do pedido',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    letterSpacing: 2.5,
                  ),
                ),
                SwitchStatus(
                    switchValue: initialSwitchValue, position: widget.position),
              ],
            ),
            CustomButton(
              title: 'Editar informações',
              navigatorUrl: '/editinfos',
              arguments: widget.position,
            ),
            CustomButton(
              title: 'Excluir pedido',
              function: () async {
                showDialog(
                  context: context,
                  builder: (_) => AlertDialog(
                    title: Text('Excluir pedido'),
                    content: Text('deseja realmente excluir este pedido?'),
                    actions: [
                      TextButton(onPressed: () async{
                        var id = comanda.id;
                        await controller.deleteComanda(id!);
                        Navigator.pop(context);
                        Modular.to.navigate('/home');
                      }, child: Text('Sim')),
                      TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: Text('Não')),
                    ],
                  ),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
