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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header Content
              CustomContainer(
                padding: EdgeInsets.symmetric(
                  horizontal: defaultMargin,
                  vertical: 10,
                ),
                width: double.infinity,
                backgroundColor: AppColor.primayRedColor,
                child: Row(
                  children: [
                    const SizedBox(
                      width: 50,
                      height: 50,
                      child: CircleAvatar(
                        backgroundImage: NetworkImage(
                          "https://images.unsplash.com/photo-1506794778202-cad84cf45f1d?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=774&q=80",
                        ),
                        backgroundColor: AppColor.whiteColor,
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    const Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextWidget(
                          "Ryan Greenway",
                          color: AppColor.whiteColor,
                        ),
                        TextWidget(
                          "Director",
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
                          TextWidget('approval.title'),
                          TextWidget('approval.description'),
                          const Divider(
                            color: AppColor.naturalGrey1,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  TextWidget(
                                    'arusKas.title.toString().toTitleCase()',
                                    fontWeight: FontWeight.bold,
                                  ),
                                  Container(
                                    width:
                                        MediaQuery.of(context).size.width / 1.5,
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
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
}
