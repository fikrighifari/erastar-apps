import 'package:erastar_apps/app/ui/profile/profile_screen.dart';
import 'package:erastar_apps/export.dart';

List<ModularRoute> profileRoutes = [
  ChildRoute('/', child: (context, args) => const ProfileScreen()),
];
