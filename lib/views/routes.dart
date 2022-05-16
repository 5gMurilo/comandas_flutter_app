import 'package:comandas_app/controller/client/dio_client.dart';
import 'package:comandas_app/controller/comandas_controller.dart';
import 'package:comandas_app/controller/services/get_comandas_service.dart';
import 'package:comandas_app/views/comanda_detail.dart';
import 'package:comandas_app/views/edit_infos.dart';
import 'package:comandas_app/views/home.dart';
import 'package:comandas_app/views/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AppRoutes extends Module {
  @override
  List<Bind> get binds => [
        Bind.singleton((i) => DioClient()),
        Bind.singleton((i) => GetComandasService(client: i())),
        Bind.singleton((i) => ComandasController(i()))
      ];

  @override
  // TODO: implement routes
  List<ModularRoute> get routes => [
        ChildRoute(
          '/',
          child: (context, args) => SplashScreen(),
          transition: TransitionType.rightToLeftWithFade,
        ),
        ChildRoute(
          '/home',
          child: (context, args) => HomeWidget(),
          transition: TransitionType.rightToLeftWithFade,
        ),
        ChildRoute(
          '/comanda',
          child: (context, args) => ComandaDetails(),
          transition: TransitionType.rightToLeftWithFade,
        ),
        ChildRoute(
          '/editinfos',
          child: (context, args) => EditInfos(),
          transition: TransitionType.rightToLeftWithFade,
        )
      ];
}
