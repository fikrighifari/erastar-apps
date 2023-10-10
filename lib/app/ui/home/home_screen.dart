import 'package:erastar_apps/app/config/api_path.dart';
import 'package:erastar_apps/app/controller/home_controller.dart';
import 'package:erastar_apps/app/models/asset_model.dart';
import 'package:erastar_apps/app/models/profile_model.dart';
import 'package:erastar_apps/app/services/local_storage_service.dart';
import 'package:erastar_apps/app/themes/themes.dart';
import 'package:erastar_apps/app/widgets/cards/asset_card.dart';
import 'package:erastar_apps/app/widgets/reusable_components/reusable_components.dart';
import 'package:erastar_apps/export.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Future<ProfileModel?> futureProfile;
  late Future<AssetModel?> futureAssetHome;
  late DataProfile dataProfile;
  late String? nameProfile, roleProfile, avatarProfile = '';

  final GlobalKey<RefreshIndicatorState> _refreshIndicatorKey =
      GlobalKey<RefreshIndicatorState>();

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> refreshHome() async {
    setState(() {
      _refreshIndicatorKey.currentState!.show();
      fetchData();
    });
  }

  fetchData() async {
    futureAssetHome = HomeController().getAssetHome();
    futureProfile = HomeController().getProfile();
    futureProfile.then((value) async {
      if (value != null) {
        if (value.status == "success") {
          dataProfile = value.data;
          nameProfile = value.data.name;
          avatarProfile = '${value.data.avatarPath}${value.data.avatar}';
          roleProfile = value.data.role!.name;
        }
      }
    });

    // return futureProfile;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                onRefresh: refreshHome,
                key: _refreshIndicatorKey,
                child: SafeArea(
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Header Content
                        InkWell(
                          onTap: () {
                            Modular.to.pushNamed('/profile/');
                          },
                          child: CustomContainer(
                            padding: EdgeInsets.symmetric(
                              horizontal: defaultMargin,
                              vertical: 10,
                            ),
                            width: double.infinity,
                            backgroundColor: AppColor.primayRedColor,
                            child: Row(
                              children: [
                                avatarProfile != null
                                    ? SizedBox(
                                        width: 50,
                                        height: 50,
                                        child: CircleAvatar(
                                          backgroundImage: NetworkImage(
                                            '$baseAPIUrlImage$avatarProfile',
                                          ),
                                          backgroundColor: AppColor.whiteColor,
                                        ),
                                      )
                                    : SizedBox(
                                        width: 50,
                                        height: 50,
                                        child: SvgPicture.asset(
                                          'assets/icons/ic_default_avatar.svg',
                                          colorFilter: const ColorFilter.mode(
                                            AppColor.whiteColor,
                                            BlendMode.srcIn,
                                          ),
                                        ),
                                      ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    TextWidget(
                                      nameProfile,
                                      color: AppColor.whiteColor,
                                    ),
                                    TextWidget(
                                      roleProfile,
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
                          ),
                        ),

                        Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: defaultMargin,
                            vertical: 8,
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // New Properti List
                              TextWidget(
                                'Listing Properti Terbaru',
                                fontWeight: boldWeight,
                                fontSize: 16,
                              ),
                              const SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Row(
                                  children: [
                                    AssetCard(),
                                    AssetCard(),
                                  ],
                                ),
                              ),
                              // Approval List
                              TextWidget(
                                'Menunggu Persetujuan',
                                fontWeight: boldWeight,
                                fontSize: 16,
                              ),
                              CustomContainer(
                                padding: const EdgeInsets.all(8),
                                margin: const EdgeInsets.symmetric(
                                  vertical: 10,
                                ),
                                containerType: RoundedContainerType.outlined,
                                radius: 10,
                                borderColor: AppColor.naturalGrey1,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    TextWidget('approval.title'),
                                    TextWidget('approval.description'),
                                    const Divider(
                                      color: AppColor.naturalGrey1,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "Tanggal",
                                        ),
                                        Text(
                                          'Jiffy(approval.createdAt).yMMMMd',
                                        )
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "Biaya Pengeluaran",
                                        ),
                                        Text(
                                          'rupiah(approval.value.toString())',
                                        )
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "Status",
                                          // style: dateTextStyle,
                                        ),
                                        Text(
                                          'approval.status.toString().toTitleCase()',
                                          // style: incomePriceTextStyle,
                                        )
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        CustomButton(
                                          isRounded: true,
                                          buttonType: ButtonType.noOutLined,
                                          borderRadius: 8,
                                          onPressed: () {},
                                          width: 100,
                                          height: 40,
                                          text: TextWidget(
                                            'Approve',
                                            color: Colors.white,
                                          ),
                                        ),
                                        CustomButton(
                                          isRounded: true,
                                          buttonType: ButtonType.noOutLined,
                                          borderRadius: 8,
                                          onPressed: () {},
                                          width: 100,
                                          height: 40,
                                          text: TextWidget(
                                            'Tolak',
                                            color: Colors.white,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),

                              //Arus Kas
                              TextWidget(
                                'Arus Kas',
                                fontWeight: boldWeight,
                                fontSize: 16,
                              ),
                              CustomContainer(
                                padding: EdgeInsets.all(8),
                                margin: EdgeInsets.symmetric(
                                  vertical: 10,
                                ),
                                containerType: RoundedContainerType.outlined,
                                radius: 10,
                                borderColor: AppColor.naturalGrey1,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            TextWidget(
                                              'arusKas.title.toString().toTitleCase()',
                                              fontWeight: FontWeight.bold,
                                            ),
                                            Container(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width /
                                                  1.5,
                                              child: TextWidget(
                                                'arusKas.description.toString()',
                                                // color: AppColors.naturalGrey1,
                                              ),
                                            ),
                                          ],
                                        ),
                                        // arusKas.type == "cost"
                                        //     ? SvgPicture.asset(
                                        //         "assets/icons/ic_arrow_red.svg",
                                        //         width: 30,
                                        //       )
                                        //     :
                                        SvgPicture.asset(
                                          "assets/icons/ic_arrow.svg",
                                          width: 30,
                                        )
                                      ],
                                    ),
                                    const Divider(
                                      color: AppColor.naturalGrey1,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        TextWidget(
                                          "Jumlah",
                                          // color: AppColors.naturalGrey1,
                                          fontSize: 13,
                                        ),
                                        Text(
                                          'rupiah(arusKas.value)',
                                          // style: arusKas.type == "cost"
                                          //     ? priceTextStyle
                                          //     : incomePriceTextStyle,
                                        ),
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        TextWidget(
                                          "Tanggal",
                                          color: AppColor.naturalGrey1,
                                          fontSize: 13,
                                        ),
                                        Text(
                                          'Jiffy(arusKas.createdAt).yMMMMd',
                                          // style: listingTextStyle,
                                        ),
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        TextWidget(
                                          "Status",
                                          color: AppColor.naturalGrey1,
                                          fontSize: 13,
                                        ),
                                        Text(
                                          'arusKas.status.toString().toTitleCase()',
                                          // style: listingTextStyle,
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),

                              //Arus Kas
                              TextWidget(
                                'Penjualan Aset',
                                fontWeight: boldWeight,
                                fontSize: 16,
                              ),
                              CustomContainer(
                                padding: EdgeInsets.all(8),
                                margin: EdgeInsets.symmetric(
                                  vertical: 10,
                                ),
                                containerType: RoundedContainerType.outlined,
                                radius: 10,
                                borderColor: AppColor.naturalGrey1,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "ID Listing: ",
                                          // +
                                          //     dataSales.asset!.listingId.toString(),
                                          // style: houseTitleTextStyle,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                        TextWidget(
                                          'rupiah(dataSales.asset!.price)',
                                          fontWeight: FontWeight.bold,
                                          fontSize: 15,
                                          // color: dataSales.status!.name == 'Sold'
                                          //     ? AppColors.greenColor
                                          //     : AppColors.primayRedColor,
                                        ),
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        SizedBox(
                                          width: 200,
                                          child: Text(
                                            'dataSales.asset!.title',
                                            // .toString()
                                            // .toTitleCase(),
                                            // style: listingTextStyle,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        ),
                                        SizedBox(
                                          width: 100,
                                          child: TextWidget(
                                            'Jiffy(dataSales.createdAt).yMMMMd',
                                            fontSize: 12,
                                            // color: AppColors.naturalGrey1,
                                            fontWeight: regularWeight,
                                            textAlign: TextAlign.right,
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      width: 200,
                                      child: Text(
                                        'dataSales.commission!.marketing!.name.toString()',
                                        // style: dateTextStyle,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                    Text(
                                      ' dataSales.asset!.office!.name.toString()',
                                      // style: dateTextStyle,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    Text(
                                      'dataSales.status!.name.toString().toTitleCase()',
                                      // style: listingTextStyle.copyWith(
                                      //   fontWeight: FontWeight.bold,
                                      //   color: dataSales.status!.name == 'Sold'
                                      //       ? AppColors.greenColor
                                      //       : AppColors.primayRedColor,
                                      // ),
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),

                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColor.cyanColor,
                            foregroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(4),
                            ),
                          ),
                          child: TextWidget.titleSmall(
                            'Logout',
                            color: AppColor.blackColor,
                            fontWeight: boldWeight,
                          ),
                          onPressed: () {
                            LocalStorageService.remove("headerToken");
                            Modular.to.popAndPushNamed('/auth/');
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              );
          }
        },
      ),
    );
  }
}
