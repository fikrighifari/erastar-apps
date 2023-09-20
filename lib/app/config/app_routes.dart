import 'package:erastar_apps/app/modules/auth_modules.dart';
import 'package:erastar_apps/app/modules/dashboard_modules.dart';
import 'package:erastar_apps/app/ui/splash_screen.dart';
import 'package:flutter_modular/flutter_modular.dart';

List<ModularRoute> appRoutes = [
  ChildRoute('/', child: (context, args) => const SplashScreen()),
  ModuleRoute('/home/', module: DashboardModule()),
  ModuleRoute('/auth/', module: AuthModule()),
  // ModuleRoute('/attendance/', module: AttendanceModule()),
  // ModuleRoute('/profile/', module: ProfileModule()),
];
