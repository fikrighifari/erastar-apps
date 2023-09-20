import 'package:erastar_apps/app/ui/dashboard/dashboard_screen.dart';
import 'package:flutter_modular/flutter_modular.dart';

List<ModularRoute> dashboardRoutes = [
  ChildRoute('/', child: (context, args) => const DashboardScreen()),
];
