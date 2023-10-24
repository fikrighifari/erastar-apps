import 'package:erastar_apps/app/ui/cash_flow/detail_cash_flow_screen.dart';
import 'package:erastar_apps/app/widgets/card_model/cash_flow_card_model.dart';
import 'package:erastar_apps/export.dart';

class ArusKasCard extends StatelessWidget {
  final ArusKasCardModel arusKasCardModel;
  const ArusKasCard({
    super.key,
    required this.arusKasCardModel,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailCashFlowScreen(
              arusKasCardItem: arusKasCardModel,
            ),
          ),
        );
      },
      child: CustomContainer(
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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextWidget(
                      arusKasCardModel.title,
                      fontWeight: FontWeight.bold,
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 1.5,
                      child: TextWidget(
                        arusKasCardModel.description,
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
                const TextWidget(
                  "Jumlah",
                  // color: AppColors.naturalGrey1,
                  fontSize: 13,
                ),
                TextWidget(
                  arusKasCardModel.value.toString(),
                  // style: arusKas.type == "cost"
                  //     ? priceTextStyle
                  //     : incomePriceTextStyle,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const TextWidget(
                  "Tanggal",
                  color: AppColor.naturalGrey1,
                  fontSize: 13,
                ),
                TextWidget(
                  arusKasCardModel.date.toString(),
                  // style: listingTextStyle,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const TextWidget(
                  "Status",
                  color: AppColor.naturalGrey1,
                  fontSize: 13,
                ),
                TextWidget(
                  arusKasCardModel.status,
                  // style: listingTextStyle,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
