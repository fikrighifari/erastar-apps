import 'package:erastar_apps/app/export.dart';
import 'package:erastar_apps/app/services/local_storage_service.dart';
import 'package:flutter_modular/flutter_modular.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final int duration = 2;

  @override
  void initState() {
    // TODO: implement initState
    Future.delayed(Duration(seconds: duration), () async {
      Modular.to.popAndPushNamed('/home/');
      // LocalStorageService.load("headerToken").then((value) {
      //   //    print("headerTokenValue :--------------->>> " + value.toString());
      //   if (value == null) {
      //     Modular.to.popAndPushNamed('/auth/');
      //     // print("headerTokenValue is Null ");
      //   } else {
      //     fetchData();
      //     Modular.to.popAndPushNamed('/home/');
      //     //Modular.to.popAndPushNamed('/auth/');
      //     // print("headerTokenValue is There ");
      //   }
      // });
    });
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset(
          'assets/images/logo_transparent.png',
          width: 100,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
