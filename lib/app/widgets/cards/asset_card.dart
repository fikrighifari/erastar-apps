import 'package:erastar_apps/app/themes/themes.dart';
import 'package:erastar_apps/app/ui/asset/detail_asset_screen.dart';
import 'package:erastar_apps/app/widgets/card_model/asset_card_model.dart';
import 'package:erastar_apps/app/widgets/reusable_components/reusable_components.dart';
import 'package:erastar_apps/export.dart';

class AssetCard extends StatelessWidget {
  final AssetCardModel assetCardModel;
  const AssetCard({
    super.key,
    required this.assetCardModel,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        print(assetCardModel.idAsset);
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailAssetScreen(
              assetItem: assetCardModel,
            ),
          ),
        );
      },
      child: CustomContainer(
        margin: EdgeInsets.fromLTRB(
          0,
          0,
          defaultMargin,
          defaultMargin,
        ),
        width: 200,
        containerType: RoundedContainerType.outlined,
        radius: 10,
        borderColor: AppColor.naturalGrey1,
        child: Column(
          children: [
            Stack(
              children: [
                assetCardModel.imgUrl == null
                    ? Image.asset(
                        'assets/images/no_image.png',
                        fit: BoxFit.cover,
                      )
                    : ClipRRect(
                        borderRadius: BorderRadius.circular(5),
                        child: Image.network(
                          assetCardModel.imgUrl.toString(),
                          // width: 50,
                          height: 200,
                          fit: BoxFit.cover,
                        ),
                      ),
                Align(
                  alignment: Alignment.topLeft,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        margin: const EdgeInsets.only(bottom: 5),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 10,
                        ),
                        height: 25,
                        decoration: const BoxDecoration(
                          color:
                              // properti.type == 'new'
                              // ? AppColors.cyanColor
                              // :
                              AppColor.yellowColor,
                          borderRadius: BorderRadius.only(
                            bottomRight: Radius.circular(5),
                            topLeft: Radius.circular(5),
                          ),
                        ),
                        child: TextWidget(
                          assetCardModel.type,
                          // 'New',
                          // properti.type.toString().toTitleCase(),
                          color:
                              // properti.type == 'new'
                              // ? AppColors.whiteColor
                              // :
                              AppColor.blackColor,
                        ),
                      ),
                    ],
                  ),
                ),
                Align(
                  alignment: Alignment.topRight,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        margin: const EdgeInsets.only(bottom: 5),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 10,
                        ),
                        height: 25,
                        decoration: const BoxDecoration(
                          color:
                              // properti.type == 'new'
                              // ? AppColors.cyanColor
                              // :
                              AppColor.yellowColor,
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(5),
                            topRight: Radius.circular(5),
                          ),
                        ),
                        child: TextWidget(
                          assetCardModel.type,
                          // properti.type.toString().toTitleCase(),
                          color:
                              // properti.type == 'new'
                              // ? AppColors.whiteColor
                              // :
                              AppColor.blackColor,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(
                bottom: 8,
                left: 8,
                right: 8,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const TextWidget(
                        "ID Listing: ",
                        color: AppColor.blackColor,
                      ),
                      Expanded(
                        child: Text(
                          assetCardModel.idListing.toString(),
                          overflow: TextOverflow.ellipsis,
                          style:
                              defaultTextStyle.copyWith(fontWeight: boldWeight),
                        ),
                      ),
                    ],
                  ),
                  TextWidget(
                    assetCardModel.price.toString(),
                    color: AppColor.primayRedColor,
                    // properti.price.toString(),
                  ),

                  Text(
                    assetCardModel.title.toString().toUpperCase(),
                    overflow: TextOverflow.ellipsis,
                    style: defaultTextStyle.copyWith(fontWeight: boldWeight),
                  ),
                  Text(
                    assetCardModel.address.toString().toUpperCase(),
                    overflow: TextOverflow.ellipsis,
                    style: defaultTextStyle.copyWith(fontWeight: boldWeight),
                  ),
                  // Text(
                  //   properti.createdAt.toString(),
                  //   style: dateTextStyle,
                  //   overflow: TextOverflow.ellipsis,
                  // ),
                  TextWidget(
                    // 'Jiffy(properti.createdAt).yMMMMd',
                    assetCardModel.date.toString(),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
