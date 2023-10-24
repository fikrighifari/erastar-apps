import 'package:erastar_apps/app/config/api_path.dart';
import 'package:erastar_apps/app/controller/profile_controller.dart';
import 'package:erastar_apps/app/models/profile_model.dart';
import 'package:erastar_apps/app/services/local_storage_service.dart';
import 'package:erastar_apps/export.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  late Future<ProfileModel?> futureProfile;
  late DataProfile dataProfile;
  late String? nameProfile,
      emailProfile,
      avatarProfile,
      roleProfile,
      phoneProfile,
      deviceProfile,
      nameOffice,
      addressOffice,
      provinceOffice = '';

  late String? appVersion = '';

  final GlobalKey<RefreshIndicatorState> _refreshIndicatorKey =
      GlobalKey<RefreshIndicatorState>();

  @override
  void initState() {
    super.initState();
    fetchData();
    getAppVersion();
  }

  Future<void> getAppVersion() async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    String version = packageInfo.version;
    setState(() {
      appVersion = version;
    });
  }

  Future<void> refreshProfile() async {
    setState(() {
      _refreshIndicatorKey.currentState!.show();
      fetchData();
    });
  }

  fetchData() async {
    futureProfile = ProfileController().getProfile();
    futureProfile.then((value) async {
      nameProfile = value!.data.name;
      emailProfile = value.data.email;
      avatarProfile = '${value.data.avatarPath}${value.data.avatar}';
      roleProfile = value.data.role!.name;
      phoneProfile = value.data.phone;
      deviceProfile = value.data.device;
      nameOffice = value.data.office!.name;
      addressOffice = value.data.office!.address;
      provinceOffice = value.data.office!.provinsiName;
    });
  }

  void showLogoutDialog() {
    showDialog(
      builder: (_) => AlertDialog(
        title: const TextWidget.titleMedium(
          'Logout',
          textAlign: TextAlign.center,
          color: AppColor.blackColor,
        ),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            const TextWidget.bodyMedium(
              'Apakah anda yakin ingin keluar dari akun anda?',
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: defaultMargin,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4),
                          side: const BorderSide(color: Colors.green))),
                  child: TextWidget.titleSmall(
                    'No',
                    color: AppColor.whiteColor,
                    fontWeight: boldWeight,
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColor.primayRedColor,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                  child: TextWidget.titleSmall(
                    'Logout',
                    color: AppColor.whiteColor,
                    fontWeight: boldWeight,
                  ),
                  onPressed: () {
                    LocalStorageService.remove("headerToken");
                    Modular.to.popAndPushNamed('/auth/');
                  },
                ),
              ],
            ),
          ],
        ),
      ),
      context: context,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        backButton: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios_new,
            color: AppColor.whiteColor,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: 'Profile',
        rightWidget: GestureDetector(
            onTap: () {
              showLogoutDialog();
            },
            child: const Icon(
              Icons.logout,
              weight: 50,
              color: AppColor.whiteColor,
            )),
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
                  child: CircularProgressIndicator(),
                );
              case ConnectionState.done:
                return RefreshIndicator(
                  onRefresh: refreshProfile,
                  key: _refreshIndicatorKey,
                  child: SafeArea(
                    child: Padding(
                      padding: EdgeInsets.all(defaultMargin),
                      child: SingleChildScrollView(
                        child: SizedBox(
                          height: MediaQuery.of(context).size.height,
                          child: Column(
                            children: [
                              Center(
                                child: avatarProfile != null
                                    ? SizedBox(
                                        width: 100,
                                        height: 100,
                                        child: CircleAvatar(
                                          backgroundImage: NetworkImage(
                                            '$baseAPIUrlImage$avatarProfile',
                                          ),
                                          backgroundColor: AppColor.whiteColor,
                                        ),
                                      )
                                    : SizedBox(
                                        width: 100,
                                        height: 100,
                                        child: SvgPicture.asset(
                                          'assets/icons/ic_avatar.svg',
                                          colorFilter: const ColorFilter.mode(
                                            AppColor.whiteColor,
                                            BlendMode.srcIn,
                                          ),
                                        ),
                                      ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              TextWidget(
                                nameProfile,
                                color: AppColor.blackColor,
                                fontWeight: boldWeight,
                                fontSize: 16,
                              ),
                              TextWidget(
                                emailProfile, color: AppColor.naturalGrey2,
                                fontWeight: boldWeight,
                                fontSize: 14,
                                // style: houseTitleTextStyle.copyWith(
                                //   fontSize: 14,
                                //   color: AppColors.naturalGrey2,
                                // ),
                              ),
                              CustomContainer(
                                radius: 10,
                                margin: EdgeInsets.only(top: defaultMargin),
                                padding: EdgeInsets.all(defaultMargin),
                                width: double.infinity,
                                backgroundColor: AppColor.whiteColor,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    TextWidget(
                                      'Akun',
                                      color: AppColor.primayRedColor,
                                      fontSize: 16,
                                      fontWeight: semiBoldWeight,
                                    ),
                                    SizedBox(
                                      height: defaultSizedbox,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        const TextWidget(
                                          'Role',
                                          fontSize: 14,
                                        ),
                                        TextWidget(
                                          roleProfile,
                                          fontSize: 14,
                                          fontWeight: semiBoldWeight,
                                        ),
                                      ],
                                    ),
                                    const Divider(
                                      thickness: 1,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        const TextWidget(
                                          'No. Telpon',
                                          fontSize: 14,
                                        ),
                                        TextWidget(
                                          phoneProfile,
                                          fontSize: 14,
                                          fontWeight: semiBoldWeight,
                                        ),
                                      ],
                                    ),
                                    const Divider(
                                      thickness: 1,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        const TextWidget(
                                          'Device',
                                          fontSize: 14,
                                        ),
                                        TextWidget(
                                          deviceProfile,
                                          fontSize: 14,
                                          fontWeight: semiBoldWeight,
                                        ),
                                      ],
                                    ),
                                    const Divider(
                                      thickness: 1,
                                    ),
                                    SizedBox(
                                      height: defaultSizedbox,
                                    ),
                                    TextWidget(
                                      'Kantor',
                                      color: AppColor.primayRedColor,
                                      fontSize: 16,
                                      fontWeight: semiBoldWeight,
                                    ),
                                    SizedBox(
                                      height: defaultSizedbox,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        const TextWidget(
                                          'Nama Kantor',
                                          fontSize: 14,
                                        ),
                                        TextWidget(
                                          nameOffice,
                                          fontSize: 14,
                                          fontWeight: semiBoldWeight,
                                        ),
                                      ],
                                    ),
                                    const Divider(
                                      thickness: 1,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        const TextWidget(
                                          'Alamat',
                                          fontSize: 14,
                                        ),
                                        SizedBox(
                                          width: defaultMargin,
                                        ),
                                        Expanded(
                                          child: TextWidget(
                                            addressOffice,
                                            fontSize: 14,
                                            fontWeight: semiBoldWeight,
                                            textAlign: TextAlign.right,
                                          ),
                                        ),
                                      ],
                                    ),
                                    const Divider(
                                      thickness: 1,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        const TextWidget(
                                          'Provinsi',
                                          fontSize: 14,
                                        ),
                                        TextWidget(
                                          provinceOffice,
                                          fontSize: 14,
                                          fontWeight: semiBoldWeight,
                                        ),
                                      ],
                                    ),
                                    const Divider(
                                      thickness: 1,
                                    ),
                                  ],
                                ),
                              ),
                              CustomContainer(
                                radius: 10,
                                margin: EdgeInsets.only(top: defaultMargin),
                                padding: EdgeInsets.all(defaultMargin),
                                width: double.infinity,
                                backgroundColor: AppColor.whiteColor,
                                child: Column(
                                  children: [
                                    InkWell(
                                      onTap: () {
                                        Modular.to
                                            .pushNamed('/profile/edit-profile');
                                      },
                                      child: const Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          TextWidget(
                                            "Edit Profile",
                                          ),
                                          Icon(
                                            Icons.arrow_forward_ios_rounded,
                                          ),
                                        ],
                                      ),
                                    ),
                                    const Divider(
                                      thickness: 1,
                                    ),
                                    InkWell(
                                      onTap: () {
                                        Modular.to.pushNamed(
                                            '/profile/change-password');
                                      },
                                      child: const Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          TextWidget(
                                            "Ubah Password",
                                          ),
                                          Icon(
                                            Icons.arrow_forward_ios_rounded,
                                          ),
                                        ],
                                      ),
                                    ),
                                    const Divider(
                                      thickness: 1,
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    RichText(
                                      text: TextSpan(
                                        style:
                                            DefaultTextStyle.of(context).style,
                                        children: <TextSpan>[
                                          const TextSpan(
                                            text: 'Versi Aplikasi ',
                                            style: TextStyle(
                                                color: AppColor.blackColor),
                                          ),
                                          TextSpan(
                                            text: appVersion,
                                            style: const TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: AppColor.blackColor,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                );
            }
          }),
    );
  }
}
