import 'package:erastar_apps/app/controller/dashboard_controller.dart';
import 'package:erastar_apps/app/models/profile_model.dart';
import 'package:erastar_apps/export.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  late Future<ProfileModel?> futureProfile;
  @override
  void initState() {
    super.initState();
    fetchData();
  }

  fetchData() async {
    futureProfile = DashboardController().getProfile();
    print('masukkk');
    futureProfile.then((value) async {
      // print('dashboard 1');
      //   print(value);
      //   if (value != null) {
      //     print(value.status);
      //     if (value.status == "success") {
      //       print('dashboard 2');
      //     }
      //   }
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('Dashboarsssd'),
      ),
    );
  }
}
