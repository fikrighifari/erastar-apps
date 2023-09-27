import 'package:erastar_apps/app/ui/profile/change_password_screen.dart';
import 'package:erastar_apps/app/ui/profile/edit_profile_screen.dart';
import 'package:erastar_apps/app/ui/profile/profile_screen.dart';
import 'package:erastar_apps/export.dart';

List<ModularRoute> profileRoutes = [
  ChildRoute('/', child: (context, args) => const ProfileScreen()),
  ChildRoute('/edit-profile',
      child: (context, args) => const EditProfileScreen()),
  ChildRoute('/change-password',
      child: (context, args) => const ChangePasswordScreen()),
];
