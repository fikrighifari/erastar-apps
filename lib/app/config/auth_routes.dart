import 'package:erastar_apps/app/ui/auth/forgot_password_screen.dart';
import 'package:erastar_apps/app/ui/auth/login_screen.dart';
import 'package:flutter_modular/flutter_modular.dart';

List<ModularRoute> authRoutes = [
  ChildRoute('/', child: (context, args) => const LoginScreen()),
  ChildRoute('/forgot-password/',
      child: (context, args) => const ForgotPasswordScreen()),
];
