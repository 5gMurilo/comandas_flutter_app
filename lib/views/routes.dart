import 'package:comandas_app/controller/client/dio_client.dart';
import 'package:comandas_app/controller/comandas_controller.dart';
import 'package:comandas_app/views/comanda_detail.dart';
import 'package:comandas_app/views/edit_infos.dart';
import 'package:comandas_app/views/foods.dart';
import 'package:comandas_app/views/home.dart';
import 'package:comandas_app/views/new_comanda_form.dart';
import 'package:comandas_app/views/new_product.dart';
import 'package:comandas_app/views/splash_screen.dart';
import 'package:comandas_app/widgets/styled_form_field.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AppRoutes extends Module {
  @override
  List<Bind> get binds => [
        Bind.singleton((i) => DioClient()),
        Bind.singleton((i) => ComandasController(i()))
      ];

  @override
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
          '/comanda/:position',
          child: (context, args) => ComandaDetails(
            position: args.data,
          ),
          transition: TransitionType.rightToLeftWithFade,
        ),
        ChildRoute(
          '/editinfos/:position',
          child: (context, args) => EditInfos(
            position: args.data,
          ),
          transition: TransitionType.rightToLeftWithFade,
        ),
        ChildRoute(
          '/newComanda',
          child: (context, args) => NewComandaForm(appBarTitle: 'Nova comanda'),
          transition: TransitionType.rightToLeftWithFade,
        ),
        ChildRoute(
          '/foodsPage',
          child: (context, args) => Foods(),
          transition: TransitionType.rightToLeftWithFade,
        ),
        ChildRoute(
          '/newProduct',
          child: (context, args) => NewProduct(),
          transition: TransitionType.rightToLeftWithFade,
        )
      ];
}
