import 'package:erastar_apps/app/themes/themes.dart';
import 'package:erastar_apps/app/widgets/card_model/card_model_approval.dart';
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
    return CustomContainer(
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
          TextWidget(approvalCardModel.title),
          TextWidget(approvalCardModel.description),
          const Divider(
            color: AppColor.naturalGrey1,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Tanggal",
              ),
              Text(
                approvalCardModel.date.toString(),
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
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
              Text(
                "Status",
                // style: dateTextStyle,
              ),
              TextWidget(
                approvalCardModel.status,
                // style: incomePriceTextStyle,
              )
            ],
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
                text: TextWidget(
                  'Approve',
                  color: Colors.white,
                ),
              ),
              CustomButton(
                isRounded: true,
                buttonType: ButtonType.noOutLined,
                borderRadius: 8,
                onPressed: () {},
                width: 100,
                height: 40,
                text: TextWidget(
                  'Tolak',
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
