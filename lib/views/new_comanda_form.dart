import 'package:comandas_app/controller/comandas_controller.dart';
import 'package:comandas_app/models/foods_model.dart';
import 'package:comandas_app/widgets/appbar.dart';
import 'package:comandas_app/widgets/custom_buttom.dart';
import 'package:comandas_app/widgets/styled_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:provider/provider.dart';

class NewComandaForm extends StatefulWidget {
  const NewComandaForm({Key? key, required this.appBarTitle}) : super(key: key);

  final String appBarTitle;

  @override
  State<NewComandaForm> createState() => _NewComandaFormState();
}

class _NewComandaFormState extends State<NewComandaForm> {
  final controller = Modular.get<ComandasController>();

  var orderVal = 0.0;

  @override
  void initState() {
    controller.fetchFoods();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    List<FoodsModel> prods = [];
    List<Map<int, int>> quant = [];

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
                Consumer(
                  builder: (context, value, child) {
                    return ListView.builder(
                      shrinkWrap: true,
                      itemCount: controller.foods.length,
                      itemBuilder: (context, index) {
                        return Container(
                          margin: EdgeInsets.symmetric(vertical: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                flex: 2,
                                child: Text(
                                  controller.foods.elementAt(index).nome,
                                ),
                              ),
                              Flexible(
                                flex: 1,
                                child: Text(
                                  'R\$ ${controller.foods.elementAt(index).valor}',
                                ),
                              ),
                              Flexible(
                                flex: 2,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    ElevatedButton(
                                      onPressed: () {
                                        setState(() {
                                          prods.add(controller.foods
                                              .elementAt(index));
                                          print(prods.last.id);
                                          //ao adicionar, pegar como referência o id e usar como chave, sendo o valor desta chave a quantidade do produto
                                        });
                                      },
                                      child: Text('+'),
                                    ),
                                    ElevatedButton(
                                      onPressed: () {
                                        if (1 != 0) {
                                          setState(() {});
                                        } else {
                                          orderVal = orderVal;
                                        }
                                      },
                                      child: Text('-'),
                                    ),
                                    Text(
                                        '${quant.isEmpty ? 0 : quant[index]} x'),
                                  ],
                                ),
                              )
                            ],
                          ),
                        );
                      },
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
                    'R\$ $orderVal',
                    style: TextStyle(fontSize: 22),
                  ),
                ),
                CustomButton(
                  title: 'Enviar pedido',
                  function: () {},
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
