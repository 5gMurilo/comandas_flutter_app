import 'package:comandas_app/widgets/appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class EditInfos extends StatelessWidget {
  const EditInfos({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 33, 33, 33),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(120),
        child: CustomAppBar(
          iconButton: IconButton(
              onPressed: () {
                Modular.to.navigate('/comanda');
              },
              icon: Icon(Icons.arrow_back_ios_new)),
          title: 'Editar informações',
        ),
      ),
      body: Column(
        children: [
          Image.network(
              'https://is1-ssl.mzstatic.com/image/thumb/Music125/v4/91/4a/e7/914ae7aa-833b-f9ec-11b1-e9bcbc2f7ea8/artwork.jpg/1200x1200bf-60.jpg')
        ],
      ),
    );
  }
}
