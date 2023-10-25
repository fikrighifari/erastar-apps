import 'package:erastar_apps/app/ui/asset/detail_asset_screen.dart';
import 'package:erastar_apps/app/widgets/card_model/asset_card_model.dart';
import 'package:erastar_apps/app/widgets/reusable_components/extentions.dart';
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
        // height: 200,
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
                        borderRadius: BorderRadius.circular(10),
                        child: Image.network(
                          assetCardModel.imgUrl.toString(),
                          width: double.infinity,
                          height: 150,
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
                        decoration: BoxDecoration(
                          color: assetCardModel.type == 'new'
                              ? AppColor.cyanColor
                              : AppColor.yellowColor,
                          borderRadius: const BorderRadius.only(
                            bottomRight: Radius.circular(10),
                            topLeft: Radius.circular(10),
                          ),
                        ),
                        child: TextWidget(
                          assetCardModel.type.toString().toTitleCase(),
                          color: assetCardModel.type == 'new'
                              ? AppColor.whiteColor
                              : AppColor.blackColor,
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
                        decoration: BoxDecoration(
                          color: assetCardModel.status == 'Open'
                              ? AppColor.cyanColor
                              : AppColor.yellowColor,
                          borderRadius: const BorderRadius.only(
                            bottomLeft: Radius.circular(5),
                            topRight: Radius.circular(5),
                          ),
                        ),
                        child: TextWidget(
                          assetCardModel.status.toString().toTitleCase(),
                          color: assetCardModel.status == 'Open'
                              ? AppColor.whiteColor
                              : AppColor.blackColor,
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
                    rupiah(assetCardModel.price.toString()),
                    color: AppColor.primayRedColor,
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
                  TextWidget(
                    Jiffy(assetCardModel.date).yMMMMd,
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
