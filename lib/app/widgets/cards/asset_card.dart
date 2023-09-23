import 'package:erastar_apps/app/themes/themes.dart';
import 'package:erastar_apps/app/widgets/reusable_components/reusable_components.dart';
import 'package:erastar_apps/export.dart';

class AssetCard extends StatefulWidget {
  const AssetCard({super.key});

  @override
  State<AssetCard> createState() => _AssetCardState();
}

class _AssetCardState extends State<AssetCard> {
  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      width: 200,
      containerType: RoundedContainerType.outlined,
      radius: 10,
      borderColor: AppColor.naturalGrey1,
      child: Column(
        children: [
          Stack(
            children: [
              Image.asset(
                'assets/images/no_image.png',
                fit: BoxFit.cover,
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
                          bottomLeft: Radius.circular(5),
                        ),
                      ),
                      child: const TextWidget(
                        'New',
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
                        ),
                      ),
                      child: const TextWidget(
                        'New',
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
            padding: EdgeInsets.only(
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
                    TextWidget(
                      "ID Listing: ",
                      color: AppColor.blackColor,
                    ),
                    Expanded(
                      child: Text(
                        'properti.listingId.toString()',
                        overflow: TextOverflow.ellipsis,
                        style:
                            defaultTextStyle.copyWith(fontWeight: boldWeight),
                      ),
                    ),
                  ],
                ),
                TextWidget(
                  'rupiah(properti.price)',
                  color: AppColor.primayRedColor,
                  // properti.price.toString(),
                ),

                Text(
                  'properti.title.toString().toUpperCase()',
                  overflow: TextOverflow.ellipsis,
                  style: defaultTextStyle.copyWith(fontWeight: boldWeight),
                ),
                Text(
                  'properti.address.toString().toCapitalized()',
                  overflow: TextOverflow.ellipsis,
                  style: defaultTextStyle.copyWith(fontWeight: boldWeight),
                ),
                // Text(
                //   properti.createdAt.toString(),
                //   style: dateTextStyle,
                //   overflow: TextOverflow.ellipsis,
                // ),
                TextWidget(
                  'Jiffy(properti.createdAt).yMMMMd',
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
