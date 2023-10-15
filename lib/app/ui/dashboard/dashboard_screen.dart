// ignore_for_file: deprecated_member_use

import 'package:erastar_apps/app/config/api_path.dart';
import 'package:erastar_apps/app/controller/dashboard_controller.dart';
import 'package:erastar_apps/app/models/profile_model.dart';
import 'package:erastar_apps/app/themes/themes.dart';
import 'package:erastar_apps/app/ui/asset/asset_screen.dart';
import 'package:erastar_apps/app/ui/home/home_screen.dart';
import 'package:erastar_apps/app/ui/cash_flow/cash_flow_screen.dart';
import 'package:erastar_apps/app/ui/sales/sales_screen.dart';
import 'package:erastar_apps/app/ui/sales/top_marketing_screen.dart';
import 'package:erastar_apps/export.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  late Future<ProfileModel?> futureProfile;
  late DataProfile dataProfile;
  late String? nameProfile = '';
  late String? roleProfile = '';
  late String? avatarProfile = '';
  bool isLoading = false;

  int currentIndex = 0;
  @override
  void initState() {
    super.initState();
    fetchData();
  }

  fetchData() async {
    //Get Profile
    futureProfile = DashboardController().getProfile();
    futureProfile.then((value) async {
      if (value != null) {
        if (value.status == "success") {
          dataProfile = value.data;
          nameProfile = value.data.name ?? '';
          avatarProfile = '${value.data.avatarPath}${value.data.avatar}';
          roleProfile = value.data.role!.name;

          print(roleProfile);
          // data1();
        }
      }

      return futureProfile;
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

    Widget customButtonNavigationMentor() {
      return BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (value) {
          // print(value);
          setState(() {
            currentIndex = value;
          });
        },
        selectedItemColor: AppColor.primayRedColor,
        backgroundColor: AppColor.whiteColor,
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
        ],
      );
    }

    bodyContentSuperAdmin() {
      switch (currentIndex) {
        case 0:
          return const HomeScreen();
        case 1:
          return const AssetScreen();
        case 2:
          return const CashFlowScreen();
        case 3:
          return const SalesScreen();
        case 4:
          return const TopMarketingScreen();
        default:
      }
    }

    bodyContentMentor() {
      switch (currentIndex) {
        case 0:
          return const HomeScreen();
        case 1:
          return const AssetScreen();
        case 2:
          return const TopMarketingScreen();
        default:
      }
    }

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: AppBar(
            automaticallyImplyLeading: false,
            backgroundColor: AppColor.primayRedColor,
            title: FutureBuilder<ProfileModel?>(
                future: futureProfile,
                builder:
                    (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                  switch (snapshot.connectionState) {
                    case ConnectionState.none:
                      return const Text('Press button to start');
                    case ConnectionState.active:
                      return const Text('Press button to start.');
                    case ConnectionState.waiting:
                      return const Center(
                        child: LinearProgressIndicator(
                          color: AppColor.whiteColor,
                        ),
                      );
                    case ConnectionState.done:
                      return InkWell(
                        onTap: () {
                          Modular.to.pushNamed('/profile/');
                        },
                        child: Row(
                          children: [
                            avatarProfile == null
                                ? SizedBox(
                                    width: 50,
                                    height: 50,
                                    child: SvgPicture.asset(
                                      'assets/icons/ic_default_avatar.svg',
                                      colorFilter: const ColorFilter.mode(
                                        AppColor.whiteColor,
                                        BlendMode.srcIn,
                                      ),
                                    ),
                                  )
                                : SizedBox(
                                    width: 50,
                                    height: 50,
                                    child: CircleAvatar(
                                      backgroundImage: NetworkImage(
                                        '$baseAPIUrlImage$avatarProfile',
                                      ),
                                      backgroundColor: AppColor.whiteColor,
                                    ),
                                  ),
                            const SizedBox(
                              width: 5,
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                TextWidget(
                                  nameProfile.toString(),
                                  color: AppColor.whiteColor,
                                ),
                                TextWidget(
                                  roleProfile.toString(),
                                  color: AppColor.whiteColor,
                                ),
                              ],
                            ),
                            const Spacer(),
                            SvgPicture.asset(
                              'assets/icons/ic_notification.svg',
                            )
                          ],
                        ),
                      );
                  }
                })),
      ),
      body: FutureBuilder<ProfileModel?>(
        future: futureProfile,
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
              return const Text('Press button to start');
            case ConnectionState.active:
              return const Text('Press button to start.');
            case ConnectionState.waiting:
              return const Center(
                child: LinearProgressIndicator(
                  color: AppColor.whiteColor,
                ),
              );
            case ConnectionState.done:
              if (roleProfile == 'Superadmin') {
                return Container(child: bodyContentSuperAdmin());
              } else {
                return Container(child: bodyContentMentor());
              }
          }
        },
      ),
      bottomNavigationBar: FutureBuilder<ProfileModel?>(
        future: futureProfile,
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
              return const Text('Press button to start');
            case ConnectionState.active:
              return const Text('Press button to start.');
            case ConnectionState.waiting:
              return const Center(
                child: LinearProgressIndicator(
                  color: AppColor.whiteColor,
                ),
              );
            case ConnectionState.done:
              if (roleProfile == 'Superadmin') {
                return customButtonNavigation();
              } else {
                return customButtonNavigationMentor();
              }
          }
        },
      ),
    );
  }
}
