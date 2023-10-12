import 'package:erastar_apps/app/controller/top_marketing_controller.dart';
import 'package:erastar_apps/app/models/top_marketing_model.dart';
import 'package:erastar_apps/app/widgets/card_model/top_marketing_card_model.dart';
import 'package:erastar_apps/app/widgets/cards/top_marketing_card.dart';
import 'package:erastar_apps/export.dart';

class TopMarketingScreen extends StatefulWidget {
  const TopMarketingScreen({super.key});

  @override
  State<TopMarketingScreen> createState() => _TopMarketingScreenState();
}

class _TopMarketingScreenState extends State<TopMarketingScreen> {
  bool isLoading = false;
  late Future<TopMarketingModel?> futureTopMarketing;
  late List<DataListTopMarketing>? listTopMarketing = [];
  String? avatarProfile;

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  fetchData() async {
    futureTopMarketing = TopMarketingController().getTopMarketing();
    futureTopMarketing.then((valueTopMarketing) {
      if (valueTopMarketing != null) {
        if (valueTopMarketing.status == 'success') {
          print(valueTopMarketing
              .dataTopMarketing!.dataListTopMarketing[0].avatarPath);
          print(valueTopMarketing
              .dataTopMarketing!.dataListTopMarketing[0].avatar);
          setState(() {
            // avatarProfile = valueTopMarketing
            //     .dataTopMarketing!.dataListTopMarketing[0].avatarPath;
            listTopMarketing =
                valueTopMarketing.dataTopMarketing!.dataListTopMarketing;
          });
        }
      }
    });

    return futureTopMarketing;
  }

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      hideAppBar: true,
      hideBackButton: true,
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //Header Profile
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
                    // avatarProfile != null
                    //     ? SizedBox(
                    //         width: 50,
                    //         height: 50,
                    //         child: CircleAvatar(
                    //           backgroundImage: NetworkImage(
                    //             '$baseAPIUrlImage$avatarProfile',
                    //           ),
                    //           backgroundColor: AppColor.whiteColor,
                    //         ),
                    //       )
                    //     :
                    SizedBox(
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
                    const Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextWidget(
                          'nameProfile',
                          color: AppColor.whiteColor,
                        ),
                        TextWidget(
                          'roleProfile',
                          color: AppColor.whiteColor,
                        ),
                      ],
                    ),
                    const Spacer(),
                    SvgPicture.asset(
                      'assets/icons/ic_notification.svg',
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(defaultMargin),
              child: Column(
                children: [
                  TextWidget.titleMedium('Top Sales Marketing'),
                  Container(
                      margin: EdgeInsets.only(top: defaultMargin),
                      // color: Colors.red,
                      child: listTopMarketing!.isNotEmpty
                          ? GridView.count(
                              primary: true,
                              crossAxisCount: 2,
                              shrinkWrap: true,
                              scrollDirection: Axis.vertical,
                              physics: const NeverScrollableScrollPhysics(),
                              childAspectRatio: MediaQuery.of(context)
                                      .size
                                      .width /
                                  (MediaQuery.of(context).size.height / 1.18),
                              // mainAxisSpacing: 5.0,
                              crossAxisSpacing: 5.0,
                              children: listTopMarketing!.map((dt) {
                                return Column(
                                  children: [
                                    // AssetCard(
                                    //   assetCardModel: AssetCardModel(
                                    //       title: dt.title,
                                    //       idListing: dt.listingId,
                                    //       address: dt.address,
                                    //       type: dt.type,
                                    //       price: dt.price,
                                    //       date: dt.createdAt.toString(),
                                    //       imgUrl: baseAPIUrlImage +
                                    //           dt.images!.path.toString() +
                                    //           dt.images!.filename.toString()),
                                    // ),
                                    TopMarketingCard(
                                        topMarketingCardModel:
                                            TopMarketingCardModel(
                                      provinceName: dt.provinsi!.lokasiNama,
                                      officeName: dt.office!.name,
                                      marketingName: dt.name,
                                    ))
                                  ],
                                );
                              }).toList(),
                            )
                          : Text('Data Asset Kosong')),
                  // TopMarketingCard()
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
