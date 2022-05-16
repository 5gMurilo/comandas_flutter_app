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
      theme: ThemeData(
        colorScheme: ColorScheme(
            brightness: Brightness.dark,
            primary: Color.fromARGB(255, 22, 22, 22),
            onPrimary: Color.fromARGB(255, 216, 187, 83),
            secondary: Color.fromARGB(255, 57, 57, 57),
            onSecondary: Colors.white,
            error: Colors.red.shade600,
            onError: Colors.white,
            background: Color.fromARGB(255, 22, 22, 22),
            onBackground: Color.fromARGB(255, 57, 57, 57),
            surface: Color.fromARGB(255, 57, 57, 57),
            onSurface: Colors.white),
      ),
    );
  }
}
