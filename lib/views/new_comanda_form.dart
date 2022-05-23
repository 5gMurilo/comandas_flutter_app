import 'package:comandas_app/widgets/appbar.dart';
import 'package:comandas_app/widgets/custom_buttom.dart';
import 'package:comandas_app/widgets/styled_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class NewComandaForm extends StatefulWidget {
  const NewComandaForm({Key? key, required this.appBarTitle}) : super(key: key);

  final String appBarTitle;

  @override
  State<NewComandaForm> createState() => _NewComandaFormState();
}

class _NewComandaFormState extends State<NewComandaForm> {
  var value = 0.0;
  var items = [];
  List<Map<String, int>> prodList = [];

  @override
  Widget build(BuildContext context) {
    var qtd = 0;
    List<Map<String, double>> produtos = [
      {'espetinho de kafta': 5.00},
      {'espetinho de frango': 4.50},
      {'espetinho de linguiça': 4.50},
      {'Cerveja Itaipava': 4.50},
      {'Cerveja Skol': 4.50},
      {'Cerveja Brahma': 4.50},
    ];

    return Scaffold(
      backgroundColor: Color.fromARGB(255, 33, 33, 33),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(120),
        child: CustomAppBar(
          iconButton: IconButton(
              onPressed: () {
                Modular.to.navigate('/home');
              },
              icon: Icon(Icons.arrow_back_ios_new)),
          title: widget.appBarTitle,
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.symmetric(vertical: 12, horizontal: 15),
          child: Form(
            child: Column(
              children: [
                StyledFormField(labelTitle: 'Nome do cliente'),
                Divider(color: Colors.white, height: 10, thickness: 1.25),
                Text(
                  'Itens do pedido',
                  style: TextStyle(fontSize: 20),
                ),
                ListView.builder(
                  shrinkWrap: true,
                  itemCount: produtos.length,
                  itemBuilder: (context, index) {
                    var produto = produtos.elementAt(index);
                    return Container(
                      margin: EdgeInsets.symmetric(vertical: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            flex: 2,
                            child: Text(
                              '${produto.keys.toString().replaceAll(
                                  RegExp('([()])'), '')}',
                            ),
                          ),
                          Flexible(
                            flex: 1,
                            child: Text(
                              'R\$ ${produto.values.toString().replaceAll(
                                  RegExp('([()])'), '')}',
                            ),
                          ),
                          Flexible(
                            flex: 2,
                            child: Row(
                              children: [
                                ElevatedButton(
                                  onPressed: () {
                                    setState(() {
                                      qtd++;
                                      value += double.parse(produto.values.toString().replaceAll(RegExp('([()])'), ''));
                                      items = [{index: qtd}];
                                    });
                                    print(items);
                                  },
                                  child: Text('+'),
                                ),
                                ElevatedButton(
                                  onPressed: () {
                                    if (value != 0) {
                                      setState(() {
                                        value -= double.parse(produto.values.toString().replaceAll(RegExp('([()])'), ''));
                                      });
                                    } else {
                                      value = value;
                                    }
                                  },
                                  child: Text('-'),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    );
                  },
                ),
                Divider(color: Colors.white, height: 10, thickness: 1.25),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 10),
                  child: Text(
                    'Valor final',
                    style: TextStyle(fontSize: 20),
                  ),
                ),
                Center(
                  child: Text(
                    'R\$ $value',
                    style: TextStyle(fontSize: 22),
                  ),
                ),
                CustomButton(title: 'Enviar pedido', function: () {
                  print('$prodList');
                },),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
