import 'package:erastar_apps/app/config/auth_routes.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AuthModule extends Module {
  @override
  List<ModularRoute> get routes => authRoutes;
}
