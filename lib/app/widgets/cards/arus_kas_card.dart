import 'package:erastar_apps/app/themes/themes.dart';
import 'package:erastar_apps/app/widgets/reusable_components/reusable_components.dart';
import 'package:erastar_apps/export.dart';

class ArusKasCard extends StatelessWidget {
  const ArusKasCard({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomContainer(
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
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextWidget(
                    'arusKas.title.toString().toTitleCase()',
                    fontWeight: FontWeight.bold,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width / 1.5,
                    child: TextWidget(
                      'arusKas.description.toString()',
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
              TextWidget(
                "Jumlah",
                // color: AppColors.naturalGrey1,
                fontSize: 13,
              ),
              Text(
                'rupiah(arusKas.value)',
                // style: arusKas.type == "cost"
                //     ? priceTextStyle
                //     : incomePriceTextStyle,
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextWidget(
                "Tanggal",
                color: AppColor.naturalGrey1,
                fontSize: 13,
              ),
              Text(
                'Jiffy(arusKas.createdAt).yMMMMd',
                // style: listingTextStyle,
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextWidget(
                "Status",
                color: AppColor.naturalGrey1,
                fontSize: 13,
              ),
              Text(
                'arusKas.status.toString().toTitleCase()',
                // style: listingTextStyle,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
