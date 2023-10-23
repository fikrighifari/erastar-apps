import 'package:erastar_apps/app/controller/cash_flow_controller.dart';
import 'package:erastar_apps/app/ui/cash_flow/detail_approval_cost_screen.dart';
import 'package:erastar_apps/app/widgets/card_model/approval_card_model.dart';
import 'package:erastar_apps/export.dart';

class ApprovalCard extends StatefulWidget {
  final ApprovalCardModel approvalCardModel;
  const ApprovalCard({
    super.key,
    required this.approvalCardModel,
  });

  @override
  State<ApprovalCard> createState() => _ApprovalCardState();
}

class _ApprovalCardState extends State<ApprovalCard> {
  void showApproveDialog() {
    showDialog(
      builder: (_) => AlertDialog(
        title: const TextWidget.titleMedium(
          'Approval Cost',
          textAlign: TextAlign.center,
          color: AppColor.blackColor,
        ),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            const TextWidget.bodyMedium(
              'Apakah anda yakin akan menyetujui cost ini?',
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: defaultMargin,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4),
                          side: const BorderSide(color: Colors.green))),
                  child: TextWidget.titleSmall(
                    'Ya',
                    color: AppColor.whiteColor,
                    fontWeight: boldWeight,
                  ),
                  onPressed: () {
                    // print(
                    //     'idCost ' + widget.approvalCardModel.idCost.toString());
                    // print('idInvoice ' +
                    //     widget.approvalCardModel.idInvoice.toString());

                    // setState(() {
                    //   isLoading = true;
                    // });

                    Future.delayed(const Duration(seconds: 1), () {
                      setState(() async {
                        CashFlowController.approveCost(
                          widget.approvalCardModel.idCost.toString(),
                          widget.approvalCardModel.idInvoice.toString(),
                          'approved',
                        );
                        Navigator.of(context).pop();
                        UiUtils.successMessage('Data Telah disetujui', context);
                        // Future.delayed(const Duration(seconds: 1), () {
                        //   Navigator.of(context).pop();
                        // });
                      });
                    });
                  },
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColor.primayRedColor,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                  child: TextWidget.titleSmall(
                    'Tidak',
                    color: AppColor.whiteColor,
                    fontWeight: boldWeight,
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
          ],
        ),
      ),
      context: context,
    );
  }

  void showRejectDialog() {
    showDialog(
      builder: (_) => AlertDialog(
        title: const TextWidget.titleMedium(
          'Approval Cost',
          textAlign: TextAlign.center,
          color: AppColor.blackColor,
        ),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            const TextWidget.bodyMedium(
              'Apakah anda yakin akan menolak cost ini?',
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: defaultMargin,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4),
                          side: const BorderSide(color: Colors.green))),
                  child: TextWidget.titleSmall(
                    'Ya',
                    color: AppColor.whiteColor,
                    fontWeight: boldWeight,
                  ),
                  onPressed: () {
                    // print(
                    //     'idCost ' + widget.approvalCardModel.idCost.toString());
                    // print('idInvoice ' +
                    //     widget.approvalCardModel.idInvoice.toString());

                    // setState(() {
                    //   isLoading = true;
                    // });

                    Future.delayed(const Duration(seconds: 1), () {
                      setState(() async {
                        CashFlowController.approveCost(
                          widget.approvalCardModel.idCost.toString(),
                          widget.approvalCardModel.idInvoice.toString(),
                          'reject',
                        );
                        Navigator.of(context).pop();
                        UiUtils.successMessage(
                            'Data berhasil ditolak', context);
                        // Future.delayed(const Duration(seconds: 1), () {
                        //   Navigator.of(context).pop();
                        // });
                      });
                    });
                  },
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColor.primayRedColor,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                  child: TextWidget.titleSmall(
                    'Tidak',
                    color: AppColor.whiteColor,
                    fontWeight: boldWeight,
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
          ],
        ),
      ),
      context: context,
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        // print(approvalCardModel.idCost);
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailApprovalCostScreen(
              approvalItem: widget.approvalCardModel,
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
              widget.approvalCardModel.title.toString(),
            ),
            TextWidget.labelLarge(
              widget.approvalCardModel.description.toString(),
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
                  widget.approvalCardModel.date.toString(),
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
                  widget.approvalCardModel.value.toString(),
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
                  widget.approvalCardModel.status,
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
                  onPressed: () {
                    showApproveDialog();
                  },
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
                  onPressed: () {
                    showRejectDialog();
                  },
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
