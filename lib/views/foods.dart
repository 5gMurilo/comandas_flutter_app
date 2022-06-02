import 'package:comandas_app/controller/comandas_controller.dart';
import 'package:comandas_app/widgets/action_button.dart';
import 'package:comandas_app/widgets/appbar.dart';
import 'package:comandas_app/widgets/expandable_fab.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:provider/provider.dart';

class Foods extends StatefulWidget {
  const Foods({Key? key}) : super(key: key);

  @override
  State<Foods> createState() => _FoodsState();
}

class _FoodsState extends State<Foods> {
  final controller = Modular.get<ComandasController>();

  @override
  void initState() {
    controller.fetchFoods();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
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
          title: 'Produtos',
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
        child: AnimatedBuilder(
          animation: controller,
          builder: (context, position){ 
            if(controller.foods.isEmpty){ 
              return Center(
                child: Text('Ainda não existem produtos para serem exibidos'),
              );
            }else{ 
              return Consumer<ComandasController>(
                builder: (context, value, child) {
                  return ListView.builder(itemCount: controller.foods.length,itemBuilder: (context, index) {
                    final food = controller.foods.elementAt(index);
                    return foodsCard(food.nome, food.categoria);    
                  },);
                },
              );
            }
          },
        ),
      ),
      floatingActionButton: ExpandableFab(
        distance: 120,
        children: [
          Actionbutton(
            icon: Icon(Icons.add),
            onPressed: () {
              Modular.to.navigate('/newProduct');
            },
          ),
        ],
      ),
    );
  }
}

Widget foodsCard (String title, String categorie) {
  return Card(
    margin: EdgeInsets.symmetric(vertical: 10),
    color: Color.fromARGB(255, 57, 57, 57),
    elevation: 5,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(15),
    ),
    child: Padding(
      padding: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
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
                  Text(
                    title,
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                  Text(
                    categorie,
                    style: TextStyle(fontSize: 14, color: Colors.white),
                  ),
                ],
              ),
            ),
          ),
          Flexible(
            flex: 1,
            fit: FlexFit.tight,
            child: Text(
              'R\$5.0',
              style: TextStyle(fontSize: 20, color: Colors.white),
            ),
          ),
        ],
      ),
    ),
  );
}
