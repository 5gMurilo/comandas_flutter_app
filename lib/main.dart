import 'package:comandas_app/views/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

void main(List<String> args) {
  runApp(ModularApp(module: AppRoutes(), child: MainWidget()));
}

const _title = "espetinho bdp";

class MainWidget extends StatelessWidget {
  const MainWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: _title,
      routeInformationParser: Modular.routeInformationParser,
      routerDelegate: Modular.routerDelegate,
    );
  }
}
