import 'package:erastar_apps/app/config/api_path.dart';
import 'package:erastar_apps/app/controller/asset_controller.dart';
import 'package:erastar_apps/app/models/asset_model.dart';
import 'package:erastar_apps/app/models/profile_model.dart';
import 'package:erastar_apps/app/widgets/card_model/asset_card_model.dart';
import 'package:erastar_apps/app/widgets/cards/asset_card.dart';
import 'package:erastar_apps/export.dart';

class AssetScreen extends StatefulWidget {
  const AssetScreen({super.key});

  @override
  State<AssetScreen> createState() => _AssetScreenState();
}

class _AssetScreenState extends State<AssetScreen> {
  bool isLoading = false;
  late Future<AssetModel?> futureAsset;
  late List<DataListAsset>? listAsset = [];

  late DataProfile dataProfile;
  late String? nameProfile, roleProfile, avatarProfile = '';

  final GlobalKey<RefreshIndicatorState> _refreshIndicatorKey =
      GlobalKey<RefreshIndicatorState>();

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> refreshAsset() async {
    setState(() {
      _refreshIndicatorKey.currentState!.show();
      fetchData();
    });
  }

  fetchData() async {
    futureAsset = AssetController().getAsset();
    futureAsset.then((valueAsset) {
      if (valueAsset != null) {
        if (valueAsset.status == 'success') {
          setState(() {
            listAsset = valueAsset.dataAsset!.data;
          });
        }
      }
    });

    return futureAsset;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<AssetModel?>(
          future: futureAsset,
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
                        onRefresh: refreshAsset,
                        key: _refreshIndicatorKey,
                        child: SafeArea(
                          child: SingleChildScrollView(
                            child: SizedBox(
                              height: MediaQuery.of(context).size.height,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: EdgeInsets.all(defaultMargin),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        TextWidget.bodyLarge(
                                          'Listing Properti',
                                          fontWeight: boldWeight,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            SizedBox(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width /
                                                  1.5,
                                              child: CustomTextField(
                                                prefixIcon:
                                                    const Icon(Icons.search),
                                                hintText: "Cari Properti",
                                                textStyle: defaultTextStyle,
                                              ),
                                            ),
                                            ElevatedButton(
                                              onPressed: () {
                                                // _showBottomSheetFilter(context);
                                              },
                                              style: ElevatedButton.styleFrom(
                                                fixedSize: const Size(70, 40),
                                                backgroundColor:
                                                    AppColor.whiteColor,
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                  side: const BorderSide(
                                                    color: AppColor.blackColor,
                                                  ),
                                                ),
                                              ),
                                              child: const TextWidget(
                                                "+ Filter",
                                              ),
                                            ),
                                          ],
                                        ),
                                        Container(
                                            margin: EdgeInsets.only(
                                                top: defaultMargin),
                                            // color: Colors.red,
                                            child: listAsset!.isNotEmpty
                                                ? GridView.count(
                                                    primary: true,
                                                    crossAxisCount: 2,
                                                    shrinkWrap: true,
                                                    scrollDirection:
                                                        Axis.vertical,
                                                    physics:
                                                        const NeverScrollableScrollPhysics(),
                                                    childAspectRatio:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width /
                                                            (MediaQuery.of(
                                                                        context)
                                                                    .size
                                                                    .height /
                                                                1.18),
                                                    // mainAxisSpacing: 5.0,
                                                    crossAxisSpacing: 5.0,
                                                    children:
                                                        listAsset!.map((dt) {
                                                      return Column(
                                                        children: [
                                                          AssetCard(
                                                            assetCardModel: AssetCardModel(
                                                                idAsset: dt.id,
                                                                title: dt.title,
                                                                idListing: dt
                                                                    .listingId,
                                                                address:
                                                                    dt.address,
                                                                type: dt.type,
                                                                price: dt.price,
                                                                date: dt
                                                                    .createdAt
                                                                    .toString(),
                                                                imgUrl: baseAPIUrlImage +
                                                                    dt.images!
                                                                        .path
                                                                        .toString() +
                                                                    dt.images!
                                                                        .filename
                                                                        .toString()),
                                                          ),
                                                        ],
                                                      );
                                                    }).toList(),
                                                  )
                                                : const Text(
                                                    'Data Asset Kosong')),
                                      ],
                                    ),
                                  )
                                ],
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
