import 'package:erastar_apps/app/themes/themes.dart';
import 'package:erastar_apps/app/ui/sales/detail_sales_screen.dart';
import 'package:erastar_apps/app/widgets/card_model/sales_card_model.dart';
import 'package:erastar_apps/app/widgets/reusable_components/reusable_components.dart';
import 'package:erastar_apps/export.dart';

class SalesCard extends StatelessWidget {
  final SalesCardModel salesCardModel;
  const SalesCard({
    super.key,
    required this.salesCardModel,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        print(salesCardModel.idInvoice);
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) =>
                  DetailSalesScreen(salesCardItem: salesCardModel)

              // DetailCashFlowScreen(
              //   arusKasCardItem: arusKasCardModel,
              // ),
              ),
        );
      },
      child: CustomContainer(
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
                  "ID Listing: ${salesCardModel.idListing}",
                  // style: houseTitleTextStyle,
                  overflow: TextOverflow.ellipsis,
                ),
                TextWidget(
                  salesCardModel.value.toString(),
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
                    salesCardModel.title.toString(),
                    // .toString()
                    // .toTitleCase(),
                    // style: listingTextStyle,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                SizedBox(
                  width: 100,
                  child: TextWidget(
                    // 'Jiffy(dataSales.createdAt).yMMMMd'
                    salesCardModel.date.toString(),
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
              child: salesCardModel.marketingName == null
                  ? const TextWidget('-')
                  : Text(
                      // 'dataSales.commission!.marketing!.name.toString()',
                      salesCardModel.marketingName.toString(),
                      // style: dateTextStyle,
                      overflow: TextOverflow.ellipsis,
                    ),
            ),
            Text(
              // ' dataSales.asset!.office!.name.toString()',
              salesCardModel.officeName.toString(),
              // style: dateTextStyle,
              overflow: TextOverflow.ellipsis,
            ),
            Text(
              // 'dataSales.status!.name.toString().toTitleCase()',
              salesCardModel.status.toString(),
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
    );
  }
}
