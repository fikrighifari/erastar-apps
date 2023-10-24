import 'package:erastar_apps/app/config/api_path.dart';
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
  final GlobalKey<RefreshIndicatorState> _refreshIndicatorKey =
      GlobalKey<RefreshIndicatorState>();

  String? month = '';
  String? topName = '';
  String? topOfficeName = '';
  String? avatarProfile;

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> refreshTopMarketing() async {
    setState(() {
      _refreshIndicatorKey.currentState!.show();
      fetchData();
    });
  }

  fetchData() async {
    futureTopMarketing = TopMarketingController().getTopMarketing();
    futureTopMarketing.then((valueTopMarketing) {
      if (valueTopMarketing != null) {
        if (valueTopMarketing.status == 'success') {
          setState(() {
            avatarProfile =
                '${valueTopMarketing.dataTopMarketing!.dataListTopMarketing.first.avatarPath}${valueTopMarketing.dataTopMarketing!.dataListTopMarketing.first.avatar}';
            month =
                valueTopMarketing.dataTopMarketing!.dataMonthYear.toString();
            listTopMarketing =
                valueTopMarketing.dataTopMarketing!.dataListTopMarketing;
            topName = valueTopMarketing
                .dataTopMarketing!.dataListTopMarketing.first.name;
          });
        }
      }
    });

    return futureTopMarketing;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
          future: futureTopMarketing,
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
                return isLoading
                    ? SizedBox(
                        height: MediaQuery.of(context).size.height,
                        width: MediaQuery.of(context).size.width,
                        child: const Center(
                          child: CircularProgressIndicator(
                            color: AppColor.primayRedColor,
                          ),
                        ),
                      )
                    : RefreshIndicator(
                        onRefresh: refreshTopMarketing,
                        key: _refreshIndicatorKey,
                        child: SafeArea(
                            child: SingleChildScrollView(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: EdgeInsets.all(defaultMargin),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const TextWidget.titleMedium(
                                        'Top Sales Marketing'),
                                    CustomContainer(
                                      margin: const EdgeInsets.only(top: 8),
                                      backgroundColor: AppColor.primayRedColor,
                                      padding: EdgeInsets.all(defaultMargin),
                                      radius: 4,
                                      child: Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Image.asset(
                                            "assets/images/img_trophy.png",
                                            width: 50,
                                            height: 50,
                                          ),
                                          const SizedBox(width: 8),
                                          Expanded(
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Container(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          bottom: 0.0),
                                                  child: Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        const TextWidget
                                                            .titleSmall(
                                                          'Top Of The Month',
                                                          color: AppColor
                                                              .whiteColor,
                                                        ),
                                                        TextWidget.titleSmall(
                                                          month.toString(),
                                                          color: AppColor
                                                              .whiteColor,
                                                        ),
                                                        const TextWidget
                                                            .titleSmall(
                                                          'Marketing Associate',
                                                          color: AppColor
                                                              .whiteColor,
                                                        ),
                                                      ]),
                                                ),
                                              ],
                                            ),
                                          ),
                                          // avatarProfile!.isNotEmpty
                                          //     ? Image.network(
                                          //         '$baseAPIUrlImage$avatarProfile',
                                          //         width: 50,
                                          //       )
                                          //     :
                                          Image.asset(
                                            "assets/images/img_trophy.png",
                                            width: 50,
                                            height: 50,
                                          ),
                                          const SizedBox(
                                            width: 5,
                                          ),
                                          Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    const TextWidget.titleSmall(
                                                      'National',
                                                      color:
                                                          AppColor.whiteColor,
                                                    ),
                                                    const TextWidget.titleSmall(
                                                      'ERA STAR',
                                                      color:
                                                          AppColor.whiteColor,
                                                    ),
                                                    TextWidget.titleSmall(
                                                      topName.toString(),
                                                      color:
                                                          AppColor.whiteColor,
                                                    ),
                                                  ]),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      margin:
                                          EdgeInsets.only(top: defaultMargin),
                                      // color: Colors.red,
                                      child: listTopMarketing!.isNotEmpty
                                          ? GridView.count(
                                              primary: true,
                                              crossAxisCount: 2,
                                              shrinkWrap: true,
                                              scrollDirection: Axis.vertical,
                                              physics:
                                                  const NeverScrollableScrollPhysics(),
                                              childAspectRatio:
                                                  MediaQuery.of(context)
                                                          .size
                                                          .width /
                                                      (MediaQuery.of(context)
                                                              .size
                                                              .height /
                                                          1.18),
                                              // mainAxisSpacing: 5.0,
                                              crossAxisSpacing: 5.0,
                                              children:
                                                  listTopMarketing!.map((dt) {
                                                return Column(
                                                  children: [
                                                    TopMarketingCard(
                                                        topMarketingCardModel:
                                                            TopMarketingCardModel(
                                                      avatarUrl:
                                                          baseAPIUrlImage +
                                                              dt.avatarPath! +
                                                              dt.avatar
                                                                  .toString(),
                                                      provinceName: dt
                                                          .provinsi!.lokasiNama,
                                                      officeName:
                                                          dt.office!.name,
                                                      marketingName: dt.name,
                                                    ))
                                                  ],
                                                );
                                              }).toList(),
                                            )
                                          : const EmptyData(
                                              text:
                                                  'Data Top Marketing tidak ditemukan',
                                            ),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        )),
                      );
            }
          }),
    );
  }
}
