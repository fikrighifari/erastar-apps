import 'package:erastar_apps/app/config/app_routes.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AppModule extends Module {
  @override
  List<ModularRoute> get routes => appRoutes;
  // @override
  // final List<ModularRoute> routes = [
  //   ChildRoute('/', child: (context, args) => const SplashScreen()),
  // ];
}
