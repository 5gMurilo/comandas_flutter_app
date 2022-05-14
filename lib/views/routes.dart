import 'package:comandas_app/views/comanda_detail.dart';
import 'package:comandas_app/views/edit_infos.dart';
import 'package:comandas_app/views/home.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AppRoutes extends Module {
  @override
  List<Bind> get binds => [];

  @override
  // TODO: implement routes
  List<ModularRoute> get routes => [
        ChildRoute(
          '/',
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
