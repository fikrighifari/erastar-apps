import 'package:erastar_apps/app/controller/cash_flow_controller.dart';
import 'package:erastar_apps/app/models/approval_cost_model.dart';
import 'package:erastar_apps/app/models/cost_detail_model.dart';
import 'package:erastar_apps/app/widgets/card_model/approval_card_model.dart';
import 'package:erastar_apps/export.dart';

class DetailApprovalCostScreen extends StatefulWidget {
  const DetailApprovalCostScreen({
    super.key,
    required this.approvalItem,
  });

  final ApprovalCardModel approvalItem;

  @override
  State<DetailApprovalCostScreen> createState() =>
      _DetailApprovalCostScreenState();
}

class _DetailApprovalCostScreenState extends State<DetailApprovalCostScreen> {
  DataListApproval? dataApproval;
  late Future<DetailCostModel?> futureCostDetail;
  String? title,
      description,
      value,
      createdDate,
      updatedDate,
      status,
      invoiceNumber,
      buyerName,
      buyerEmail,
      buyerPhone,
      valueInvoice,
      statusInvoice;

  @override
  void initState() {
    fetchData(widget.approvalItem.idCost);
    super.initState();
  }

  fetchData(String? idCostData) {
    futureCostDetail = CashFlowController().getDetailCost(idCostData);
    futureCostDetail.then((valueCostDetail) {
      if (valueCostDetail != null) {
        //Get Data Detail Cost
        title = valueCostDetail.dataDetailCost!.title;
        description = valueCostDetail.dataDetailCost!.description;
        value = valueCostDetail.dataDetailCost!.value.toString();
        createdDate = valueCostDetail.dataDetailCost!.createdAt.toString();
        updatedDate = valueCostDetail.dataDetailCost!.updatedAt.toString();
        status = valueCostDetail.dataDetailCost!.status;

        //Get Data Detail Invoice
        invoiceNumber = valueCostDetail.dataDetailCost!.invoice!.invoiceNum;
        buyerName = valueCostDetail.dataDetailCost!.invoice!.buyerName;
        buyerEmail = valueCostDetail.dataDetailCost!.invoice!.buyerEmail;
        valueInvoice =
            valueCostDetail.dataDetailCost!.invoice!.valueInvoice.toString();
        statusInvoice =
            valueCostDetail.dataDetailCost!.invoice!.status.toString();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBar(
            backButton: IconButton(
              icon: const Icon(
                Icons.arrow_back_ios_new,
                color: AppColor.whiteColor,
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            title: 'Detail Approval Cost'),
        body: FutureBuilder<DetailCostModel?>(
            future: futureCostDetail,
            builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
              switch (snapshot.connectionState) {
                case ConnectionState.none:
                  return const Text('Press button to start');
                case ConnectionState.active:
                  return const Text('Press button to start.');
                case ConnectionState.waiting:
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                case ConnectionState.done:
                  return SafeArea(
                      child: SingleChildScrollView(
                    child: Padding(
                      padding: EdgeInsets.all(defaultMargin),
                      child: Column(
                        children: [
                          CustomContainer(
                            radius: 4,
                            padding: EdgeInsets.all(defaultMargin),
                            width: double.infinity,
                            backgroundColor: AppColor.whiteColor,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                TextWidget(
                                  'Detail Cost',
                                  color: AppColor.primayRedColor,
                                  fontSize: 16,
                                  fontWeight: boldWeight,
                                ),
                                SizedBox(
                                  height: defaultMargin,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    const TextWidget('Judul'),
                                    TextWidget(title)
                                  ],
                                ),
                                Divider(
                                  thickness: 1,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ));
              }
            }));
  }
}
