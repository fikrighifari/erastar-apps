import 'package:erastar_apps/app/config/api_path.dart';
import 'package:erastar_apps/app/controller/asset_controller.dart';
import 'package:erastar_apps/app/models/asset_model.dart';
import 'package:erastar_apps/app/models/profile_model.dart';
import 'package:erastar_apps/app/themes/themes.dart';
import 'package:erastar_apps/app/widgets/card_model/asset_card_model.dart';
import 'package:erastar_apps/app/widgets/cards/asset_card.dart';
import 'package:erastar_apps/app/widgets/reusable_components/reusable_components.dart';
import 'package:erastar_apps/export.dart';

class AssetScreen extends StatefulWidget {
  const AssetScreen({super.key});

  @override
  State<AssetScreen> createState() => _AssetScreenState();
}

class _AssetScreenState extends State<AssetScreen> {
  bool isLoading = false;
  late Future<AssetModel?> futureAsset;
  late Future<ProfileModel?> futureProfile;
  late List<DataListAsset>? listAsset = [];

  late DataProfile dataProfile;
  late String? nameProfile, roleProfile, avatarProfile = '';

  fetchData() async {
    //Get Profile
    futureProfile = AssetController().getProfile();
    futureProfile.then((valueProfile) async {
      if (valueProfile != null) {
        if (valueProfile.status == "success") {
          dataProfile = valueProfile.data;
          nameProfile = valueProfile.data.name;
          avatarProfile =
              '${valueProfile.data.avatarPath}${valueProfile.data.avatar}';
          roleProfile = valueProfile.data.role!.name;
        }
      }
    });

    futureAsset = AssetController().getAssetHome();
    futureAsset.then((valueAsset) {
      if (valueAsset != null) {
        if (valueAsset.status == 'success') {
          setState(() {
            listAsset = valueAsset.dataAsset!.data;
          });
        }
      }
    });
  }

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      hideBackButton: true,
      hideAppBar: true,
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
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextWidget.bodyLarge(
                  'Listing Properti',
                  fontWeight: boldWeight,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 1.5,
                      child: CustomTextField(
                        prefixIcon: const Icon(Icons.search),
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
                        backgroundColor: AppColor.whiteColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
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
                // AssetCard()
                Container(
                    margin: EdgeInsets.only(top: defaultMargin),
                    // color: Colors.red,
                    child: listAsset!.isNotEmpty
                        ? GridView.count(
                            primary: true,
                            crossAxisCount: 2,
                            shrinkWrap: true,
                            scrollDirection: Axis.vertical,
                            physics: const NeverScrollableScrollPhysics(),
                            childAspectRatio:
                                MediaQuery.of(context).size.width /
                                    (MediaQuery.of(context).size.height / 1.18),
                            // mainAxisSpacing: 5.0,
                            crossAxisSpacing: 5.0,
                            children: listAsset!.map((dt) {
                              return Column(
                                children: [
                                  AssetCard(
                                    assetCardModel: AssetCardModel(
                                        title: dt.title,
                                        idListing: dt.listingId,
                                        address: dt.address,
                                        type: dt.type,
                                        price: dt.price,
                                        date: dt.createdAt.toString(),
                                        imgUrl: baseAPIUrlImage +
                                            dt.images!.path.toString() +
                                            dt.images!.filename.toString()),
                                  ),
                                ],
                              );
                            }).toList(),
                          )
                        : Text('Data Asset Kosong')),
              ],
            ),
          )
        ],
      ),
    );
  }
}
