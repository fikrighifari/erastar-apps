import 'package:erastar_apps/app/controller/dashboard_controller.dart';
import 'package:erastar_apps/app/models/profile_model.dart';
import 'package:erastar_apps/app/services/local_storage_service.dart';
import 'package:erastar_apps/app/themes/themes.dart';
import 'package:erastar_apps/app/ui/asset/asset_screen.dart';
import 'package:erastar_apps/app/ui/home/home_screen.dart';
import 'package:erastar_apps/app/ui/kas/arus_kas_screen.dart';
import 'package:erastar_apps/app/ui/sales/sales_screen.dart';
import 'package:erastar_apps/app/ui/sales/top_sales_screen.dart';
import 'package:erastar_apps/app/widgets/reusable_components/reusable_components.dart';
import 'package:erastar_apps/export.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  late Future<ProfileModel?> futureProfile;
  int currentIndex = 0;
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

  @override
  Widget build(BuildContext context) {
    Widget customButtonNavigation() {
      return BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (value) {
          // print(value);
          setState(() {
            currentIndex = value;
          });
        },
        selectedItemColor: AppColor.primayRedColor,
        backgroundColor: AppColor.blueColor,
        items: [
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/icons/ic_nav_home.svg',
              colorFilter: const ColorFilter.mode(
                AppColor.naturalGrey1,
                BlendMode.srcIn,
              ),
            ),
            activeIcon: SvgPicture.asset(
              'assets/icons/ic_nav_home.svg',
              colorFilter: const ColorFilter.mode(
                AppColor.primayRedColor,
                BlendMode.srcIn,
              ),
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/icons/ic_nav_building.svg',
              colorFilter: const ColorFilter.mode(
                AppColor.naturalGrey1,
                BlendMode.srcIn,
              ),
            ),
            activeIcon: SvgPicture.asset(
              'assets/icons/ic_nav_building.svg',
              colorFilter: const ColorFilter.mode(
                AppColor.primayRedColor,
                BlendMode.srcIn,
              ),
            ),
            label: 'Properti',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              "assets/icons/ic_nav_kas.svg",
              width: 24,
              color: currentIndex == 2
                  ? AppColor.primayRedColor
                  : AppColor.naturalGrey1,
            ),
            label: 'Kas',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              "assets/icons/ic_nav_dollar.svg",
              width: 24,
              color: currentIndex == 3
                  ? AppColor.primayRedColor
                  : AppColor.naturalGrey1,
            ),
            label: 'Penjualan',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              "assets/icons/ic_nav_award.svg",
              width: 24,
              color: currentIndex == 4
                  ? AppColor.primayRedColor
                  : AppColor.naturalGrey1,
            ),
            label: 'Top Sales',
          ),
        ],
      );
    }

    bodyContent() {
      switch (currentIndex) {
        case 0:
          return HomeScreen();
        case 1:
          return AssetScreen();
        case 2:
          return ArusKasScreen();
        case 3:
          return SalesScreen();
        case 4:
          return TopSalesScreen();
        default:
      }
    }

    return
        // Scaffold(
        //   body:
        //   Center(
        //     child: Column(
        //       children: [
        //         Text('Dashboarsssd'),
        //         ElevatedButton(
        //           style: ElevatedButton.styleFrom(
        //             backgroundColor: AppColor.cyanColor,
        //             foregroundColor: Colors.white,
        //             shape: RoundedRectangleBorder(
        //               borderRadius: BorderRadius.circular(4),
        //             ),
        //           ),
        //           child: TextWidget.titleSmall(
        //             'Logout',
        //             color: AppColor.blackColor,
        //             fontWeight: boldWeight,
        //           ),
        //           onPressed: () {
        //             LocalStorageService.remove("headerToken");

        //             Modular.to.popAndPushNamed('/auth/');
        //           },
        //         ),
        //       ],
        //     ),
        //   ),
        // );
        Scaffold(
      // appBar: _headerAppBar(),
      body: bodyContent(),
      bottomNavigationBar: customButtonNavigation(),
    );
  }
}
