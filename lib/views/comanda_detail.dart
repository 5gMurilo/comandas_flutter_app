import 'package:comandas_app/widgets/appbar.dart';
import 'package:comandas_app/widgets/custom_buttom.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class ComandaDetails extends StatefulWidget {
  const ComandaDetails({Key? key}) : super(key: key);

  @override
  State<ComandaDetails> createState() => _ComandaDetailsState();
}

class _ComandaDetailsState extends State<ComandaDetails> {
  var boolval = false;

  @override
  Widget build(BuildContext context) {
    const _quantidade = [2, 3, 4];
    const _tastes = [
      'espetinho de frango',
      'espetinho de carne',
      'espetinho de linguiça'
    ];
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
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IntrinsicHeight(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      Container(
                        margin: EdgeInsets.symmetric(vertical: 5),
                        child: Text(
                          '${_quantidade[0]}x',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            letterSpacing: 1.2,
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(vertical: 5),
                        child: Text(
                          '${_quantidade[1]}x',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            letterSpacing: 1.2,
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(vertical: 5),
                        child: Text(
                          '${_quantidade[2]}x',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            letterSpacing: 1.2,
                          ),
                        ),
                      ),
                    ],
                  ),
                  VerticalDivider(
                    thickness: 1.5,
                    width: 25,
                    color: Colors.white,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: EdgeInsets.symmetric(vertical: 5),
                        child: Text(
                          _tastes[0],
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            letterSpacing: 1.2,
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(vertical: 5),
                        child: Text(
                          _tastes[1],
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            letterSpacing: 1.2,
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(vertical: 5),
                        child: Text(
                          _tastes[2],
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            letterSpacing: 1.2,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
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
                    'R\$ 45,00',
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
                Row(
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
                      value: boolval,
                      onChanged: (value) => setState(() {
                        boolval = value;
                      }),
                      activeColor: Color(0xFFD8BB53),
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
                )
              ],
            ),
            CustomButton(
              title: 'Editar informações',
              navigatorUrl: '/editinfos',
            ),
            CustomButton(
              title: 'Excluir pedido',
              navigatorUrl: '/home',
            )
          ],
        ),
      ),
    );
  }
}
