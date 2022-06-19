import 'package:comandas_app/models/categories.dart';
import 'package:comandas_app/widgets/appbar.dart';
import 'package:comandas_app/widgets/custom_buttom.dart';
import 'package:comandas_app/widgets/styled_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class NewProduct extends StatefulWidget {
  const NewProduct({Key? key}) : super(key: key);

  @override
  State<NewProduct> createState() => _NewProductState();
}

class _NewProductState extends State<NewProduct> {
  String _gValue = Categories.bebida;
  String nomeProduto = "";
  String valorProduto = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(120),
        child: CustomAppBar(
          iconButton: IconButton(
            onPressed: () => Modular.to.navigate('/foodsPage'),
            icon: Icon(Icons.arrow_back_ios),
          ),
          title: 'Novo produto',
        ),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
        child: Form(
          child: Column(
            children: [
              StyledFormField(
                  labelTitle: 'Nome do produto',
                  onChange: (value) {
                    setState(() {
                      nomeProduto = value ?? "";
                    });
                  }),
              Column(
                children: [
                  ListTile(
                    title: const Text('Bebida'),
                    leading: Radio(
                      value: Categories.bebida,
                      activeColor: Theme.of(context).colorScheme.onPrimary,
                      groupValue: _gValue,
                      onChanged: (String? value) {
                        setState(() {
                          _gValue = value!;
                        });
                      },
                    ),
                  ),
                  ListTile(
                    title: const Text('Porção'),
                    leading: Radio(
                      value: Categories.porcao,
                      activeColor: Theme.of(context).colorScheme.onPrimary,
                      groupValue: _gValue,
                      onChanged: (String? value) {
                        setState(() {
                          _gValue = value!;
                        });
                      },
                    ),
                  ),
                  ListTile(
                    title: const Text('Espetinho'),
                    leading: Radio(
                      value: Categories.espetos,
                      groupValue: _gValue,
                      activeColor: Theme.of(context).colorScheme.onPrimary,
                      onChanged: (String? value) {
                        setState(() {
                          _gValue = value!;
                        });
                      },
                    ),
                  ),
                  ListTile(
                    title: const Text('Outros'),
                    leading: Radio(
                      value: Categories.outros,
                      groupValue: _gValue,
                      activeColor: Theme.of(context).colorScheme.onPrimary,
                      onChanged: (String? value) {
                        setState(() {
                          _gValue = value!;
                        });
                      },
                    ),
                  ),
                ],
              ),
              StyledFormField(
                labelTitle: 'valor',
                onChange: (value) {
                  setState(() {
                    valorProduto = value ?? "";
                  });
                },
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                child: CustomButton(
                  title: 'Cadastrar novo produto',
                  function: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        backgroundColor: Theme.of(context).colorScheme.primary,
                        content: Text(
                          '$nomeProduto - ${_gValue.toString()} - R\$$valorProduto',
                          style: TextStyle(
                              color: Theme.of(context).colorScheme.onPrimary),
                        ),
                      ),
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
