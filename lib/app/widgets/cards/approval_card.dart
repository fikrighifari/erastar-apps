import 'package:erastar_apps/app/themes/themes.dart';
import 'package:erastar_apps/app/ui/cash_flow/detail_approval_cost_screen.dart';
import 'package:erastar_apps/app/widgets/card_model/approval_card_model.dart';
import 'package:erastar_apps/app/widgets/reusable_components/reusable_components.dart';
import 'package:erastar_apps/export.dart';

class ApprovalCard extends StatelessWidget {
  final ApprovalCardModel approvalCardModel;
  const ApprovalCard({
    super.key,
    required this.approvalCardModel,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        // print(approvalCardModel.idCost);
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailApprovalCostScreen(
              approvalItem: approvalCardModel,
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
            TextWidget.labelLarge(
              approvalCardModel.title.toString(),
            ),
            TextWidget.labelLarge(
              approvalCardModel.description.toString(),
            ),
            const Divider(
              color: AppColor.naturalGrey1,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const TextWidget.labelLarge(
                  "Tanggal",
                ),
                TextWidget(
                  approvalCardModel.date.toString(),
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const TextWidget.labelLarge(
                  "Biaya Pengeluaran",
                ),
                Text(
                  approvalCardModel.value.toString(),
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const TextWidget.labelLarge(
                  "Status",
                  // style: dateTextStyle,
                ),
                TextWidget(
                  approvalCardModel.status,
                  // style: incomePriceTextStyle,
                )
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomButton(
                  isRounded: true,
                  buttonType: ButtonType.noOutLined,
                  borderRadius: 8,
                  onPressed: () {},
                  width: 100,
                  height: 40,
                  backgroundColor: AppColor.greenColor,
                  text: const TextWidget(
                    'Approve',
                    color: Colors.white,
                  ),
                ),
                CustomButton(
                  isRounded: true,
                  buttonType: ButtonType.noOutLined,
                  backgroundColor: AppColor.primayRedColor,
                  borderRadius: 8,
                  onPressed: () {},
                  width: 100,
                  height: 40,
                  text: const TextWidget(
                    'Tolak',
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
