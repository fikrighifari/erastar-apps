import 'package:erastar_apps/app/ui/sales/detail_sales_screen.dart';
import 'package:erastar_apps/app/widgets/card_model/sales_card_model.dart';
import 'package:erastar_apps/app/widgets/reusable_components/extentions.dart';
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
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailSalesScreen(
              salesCardItem: salesCardModel,
            ),
          ),
        );
      },
      child: CustomContainer(
        padding: const EdgeInsets.all(8),
        margin: const EdgeInsets.symmetric(
          vertical: 5,
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
                  rupiah(salesCardModel.value.toString()),
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                  color: salesCardModel.status == 'Sold'
                      ? AppColor.greenColor
                      : AppColor.primayRedColor,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: 200,
                  child: Text(
                    salesCardModel.title.toString().toTitleCase(),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                SizedBox(
                  width: 100,
                  child: TextWidget(
                    Jiffy(salesCardModel.date).yMMMMd,
                    fontSize: 12,
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
                      salesCardModel.marketingName.toString(),
                      // style: dateTextStyle,
                      overflow: TextOverflow.ellipsis,
                    ),
            ),
            Text(
              salesCardModel.officeName.toString(),
              // style: dateTextStyle,
              overflow: TextOverflow.ellipsis,
            ),
            Text(
              // 'dataSales.status!.name.toString().toTitleCase()',
              salesCardModel.status.toString(),
              style: TextStyle(
                color: salesCardModel.status == 'Sold'
                    ? AppColor.greenColor
                    : AppColor.primayRedColor,
              ),
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }
}
