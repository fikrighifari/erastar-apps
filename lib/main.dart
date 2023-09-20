import 'package:erastar_apps/app/modules/app_modules.dart';
import 'package:erastar_apps/app/ui/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_modular/flutter_modular.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  runApp(ModularApp(module: AppModule(), child: const MyApp()));

  // runApp(MultiProvider(
  //   providers: [
  //     // ChangeNotifierProvider<AuthServices>(
  //     //   create: (context) => AuthServices(),
  //     // ),
  //   ],
  //   child: ModularApp(module: AppModule(), child: const MyApp()),
  // ));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Era Star',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routerDelegate: Modular.routerDelegate,
      routeInformationParser: Modular.routeInformationParser,
    );
  }
}
