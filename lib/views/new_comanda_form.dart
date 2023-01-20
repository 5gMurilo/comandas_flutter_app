import 'package:comandas_app/controller/comandas_controller.dart';
import 'package:comandas_app/models/cartItem.dart';
import 'package:comandas_app/models/foods_model.dart';
import 'package:comandas_app/widgets/appbar.dart';
import 'package:comandas_app/widgets/custom_buttom.dart';
import 'package:comandas_app/widgets/styled_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:provider/provider.dart';

class NewComandaForm extends StatefulWidget {
  const NewComandaForm({Key? key, required this.appBarTitle, required this.foodsQuantity}) : super(key: key);

  final String appBarTitle;
  final int foodsQuantity;
  @override
  State<NewComandaForm> createState() => _NewComandaFormState();
}

class _NewComandaFormState extends State<NewComandaForm> {
  final controller = Modular.get<ComandasController>();

  List<int> quantity = List.generate(4, (index) => 0,growable: true);
  List<CartItem> prods = [];
  
  void handleQuantity(int position) {
    setState(() {
      quantity[position]++;
    });
  }

  void handleAddToCart({
      required FoodsModel food,
      required int buttonIndex,
    }) {
      var indexOf =
          prods.indexWhere((element) => element.food.nome == food.nome);

      if (indexOf < 0) {
        handleQuantity(buttonIndex);
        prods.add(CartItem(food: food, quantity:quantity[buttonIndex]));
      } else {
        handleQuantity(buttonIndex);
        prods[indexOf] =
            CartItem(food: food, quantity: quantity[buttonIndex]);
      }
    }

  var orderVal = 0.0;

  void setCartValue(double newValue) { 
    setState(() {
      orderVal = newValue;
    });
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    

    void handleCartValue(List<CartItem> items){
      double newValue = 0.0;


      for (var prod in items) {
        newValue += (prod.food.valor * prod.quantity);
      }

      print(newValue);

      setCartValue(newValue);
    }

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
          margin: EdgeInsets.symmetric(vertical: 10, horizontal: 12),
          child: Form(
            child: Column(
              children: [
                StyledFormField(labelTitle: 'Nome do cliente'),
                Divider(color: Colors.white, height: 10, thickness: 1.25),
                Text(
                  'Itens do pedido',
                  style: TextStyle(fontSize: 22),
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
                                  textAlign: TextAlign.justify,
                                  style: TextStyle(fontWeight: FontWeight.w500),
                                ),
                              ),
                              Flexible(
                                flex: 1,
                                fit: FlexFit.tight,
                                child: Text(
                                  'R\$ ${controller.foods.elementAt(index).valor}',
                                  textAlign: TextAlign.justify,
                                  style: TextStyle(fontWeight: FontWeight.w500),
                                ),
                              ),
                              Flexible(
                                flex: 2,
                                fit: FlexFit.tight,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    SizedBox(
                                      width: 40,
                                      height: 40,
                                      child: ElevatedButton(
                                        onPressed: () {
                                          handleAddToCart(
                                              food: controller.foods
                                                  .elementAt(index),
                                              buttonIndex: index);

                                          handleCartValue(prods);
                                        },
                                        child: Text('+'),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 40,
                                      height: 40,
                                      child: ElevatedButton(
                                        onPressed: () {
                                          if (1 != 0) {
                                            setState(() {});
                                          } else {
                                            orderVal = orderVal;
                                          }
                                        },
                                        style: ElevatedButton.styleFrom(
                                          foregroundColor:
                                              Color.fromARGB(255, 255, 94, 0),
                                          textStyle: const TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        child: Text('-'),
                                      ),
                                    ),
                                    Text("${quantity.elementAt(index)}"),
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
