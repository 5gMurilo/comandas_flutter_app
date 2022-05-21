import 'package:comandas_app/controller/comandas_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class SwitchStatus extends StatefulWidget {
  const SwitchStatus({
    Key? key,
    required this.switchValue,
    required this.position,
  }) : super(key: key);

  final bool switchValue;
  final int position;

  @override
  State<SwitchStatus> createState() => _SwitchStatusState();
}

class _SwitchStatusState extends State<SwitchStatus> {
  final controller = Modular.get<ComandasController>();

  @override
  Widget build(BuildContext context) {
    var comanda = controller.comandas.elementAt(widget.position);

    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'fazendo',
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
            letterSpacing: 2.5,
          ),
        ),
        Switch(
          value: widget.switchValue,
          activeColor: Color(0xFFD8BB53),
          onChanged: (value) {
            setState(() {});
            if (comanda.pronto != true) {
              showDialog(
                context: context,
                barrierDismissible: false,
                builder: (_) => AlertDialog(
                  title: Text('pedido'),
                  content:
                      Text('Deseja alterar o estado do pedido para pronto?'),
                  actions: [
                    TextButton(
                        onPressed: () async {
                          await controller.changeToDone(
                            value,
                            controller.comandas.elementAt(widget.position).id!,
                          );
                          await controller.fetchComandas();
                          Navigator.pop(context);
                        },
                        child: Text('Sim')),
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text('não'),
                    ),
                  ],
                  elevation: 20,
                ),
              );
            } else {
              showDialog(
                context: context,
                barrierDismissible: false,
                builder: (_) => AlertDialog(
                  title: Text('Ops!'),
                  content: Text(
                    'Não é possível alterar o estado do produto',
                  ),
                  actions: [
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text('Ok'),
                    ),
                  ],
                ),
              );
            }
          },
        ),
        Text(
          'concluído',
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
            letterSpacing: 2.5,
          ),
        ),
      ],
    );
  }
}
