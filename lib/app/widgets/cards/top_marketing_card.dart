import 'package:erastar_apps/app/models/top_marketing_model.dart';
import 'package:erastar_apps/app/widgets/card_model/top_marketing_card_model.dart';
import 'package:erastar_apps/export.dart';

class TopMarketingCard extends StatelessWidget {
  // final DataListTopMarketing dataListTopMarketing;
  final TopMarketingCardModel topMarketingCardModel;
  const TopMarketingCard({
    super.key,
    // required this.dataListTopMarketing,
    required this.topMarketingCardModel,
  });

  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      padding: EdgeInsets.all(5),
      margin: const EdgeInsets.symmetric(
        vertical: 10,
      ),
      width: 167,
      // height: 154,
      containerType: RoundedContainerType.noOutline,
      backgroundColor: AppColor.cyanColor,
      radius: 10,
      child: Column(
        // mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(
            height: 16,
          ),
          TextWidget(
            // 'topMarketing.office!.provinsiName.toString()',
            topMarketingCardModel.provinceName,
            color: AppColor.blueColor,
            fontWeight: FontWeight.bold,
            textAlign: TextAlign.center,
          ),

          const SizedBox(
            height: 8,
          ),
          // topMarketing.avatar!.isEmpty
          //     ?
          SizedBox(
              width: 60,
              height: 60,
              child: SvgPicture.asset(
                'assets/icons/ic_default_avatar.svg',
              )),
          // : Image.network(
          //     urlImage +
          //         this
          //             .topMarketing
          //             .avatarPath
          //             .toString()
          //             .replaceAll('.', '') +
          //         this.topMarketing.avatar.toString(),
          //     width: 70,
          //     fit: BoxFit.cover,
          //   ),
          const SizedBox(
            height: 8,
          ),

          // TextWidget(
          //   topMarketing.type.toString().toUpperCase(),
          //   // style: dateTextStyle,
          // ),
          // TextWidget(
          //   topMarketing.name,
          //   // style: houseTitleTextStyle,
          // ),
          TextWidget(
            // 'topMarketing.name.toString()',
            topMarketingCardModel.marketingName,
            color: AppColor.naturalGrey2,
            fontWeight: FontWeight.bold,
          ),
          TextWidget(
            // 'topMarketing.office!.name.toString().toUpperCase()',
            topMarketingCardModel.officeName,
            color: AppColor.naturalGrey3,
            fontWeight: FontWeight.bold,
            textAlign: TextAlign.center,
          ),
          // Expanded(
          //   child: TextWidget(
          //     rupiah(topMarketing.totalInvoice.toString()),
          //     color: AppColors.greenColor,
          //     fontWeight: FontWeight.bold,
          //     // style: houseTitleTextStyle,
          //   ),
          // ),
        ],
      ),
    );
  }
}
