import 'package:erastar_apps/app/controller/cash_flow_controller.dart';
import 'package:erastar_apps/app/models/approval_cost_model.dart';
import 'package:erastar_apps/app/models/cash_flow_model.dart';
import 'package:erastar_apps/app/widgets/card_model/approval_card_model.dart';
import 'package:erastar_apps/app/widgets/card_model/cash_flow_card_model.dart';
import 'package:erastar_apps/app/widgets/cards/approval_card.dart';
import 'package:erastar_apps/app/widgets/cards/cash_flow_card.dart';
import 'package:erastar_apps/export.dart';

class CashFlowScreen extends StatefulWidget {
  const CashFlowScreen({super.key});

  @override
  State<CashFlowScreen> createState() => _CashFlowScreenState();
}

class _CashFlowScreenState extends State<CashFlowScreen>
    with SingleTickerProviderStateMixin {
  late TabController tabController;
  bool isLoading = false;
  late Future<CashFlowModel?> futureCashFlow;
  late Future<ApprovalCostModel?> futureApprovalCost;

  late List<ListDataCashFlow>? listDataCashFlow = [];
  late List<DataListApproval>? listApproval = [];

  @override
  void initState() {
    tabController = TabController(length: 2, vsync: this);
    fetchData();
    super.initState();
  }

  fetchData() async {
    futureCashFlow = CashFlowController().getCashFlow();
    futureCashFlow.then((valueCashFlow) {
      if (valueCashFlow != null) {
        if (valueCashFlow.status == 'success') {
          setState(() {
            listDataCashFlow = valueCashFlow.data!.dataListCashFlow;
          });
        }
      }
    });

    //Get Approval List
    futureApprovalCost = CashFlowController().getApproval();
    futureApprovalCost.then((valueApproval) {
      if (valueApproval != null) {
        if (valueApproval.status == 'success') {
          setState(() {
            listApproval = valueApproval.data!.dataListApproval;
          });
        }
      }
    });
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Column(
              children: [
                Padding(
                  padding: EdgeInsets.all(defaultMargin),
                  child: TabBar(
                      labelColor: Colors.black,
                      unselectedLabelColor: Colors.grey,
                      indicator: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(5)),
                      controller: tabController,
                      tabs: const [
                        Tab(
                          text: "Arus Kas",
                        ),
                        Tab(
                          text: "Menunggu Persetujuan",
                        ),
                      ]),
                ),
              ],
            ),
            Expanded(
              child: TabBarView(
                controller: tabController,
                children: [
                  Padding(
                    padding: EdgeInsets.all(defaultMargin),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // _filterKas(),
                        // _contentKas(),
                        Text('Arus Kas'),
                        listDataCashFlow!.isNotEmpty
                            ? ListView.builder(
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                itemCount: listDataCashFlow!.length,
                                itemBuilder: (context, index) {
                                  var cashFlowList = listDataCashFlow![index];
                                  return Column(
                                    children: [
                                      ArusKasCard(
                                        arusKasCardModel: ArusKasCardModel(
                                          title: cashFlowList.title,
                                          description: cashFlowList.description,
                                          date:
                                              cashFlowList.createdAt.toString(),
                                          value: cashFlowList.value,
                                          status: cashFlowList.status,
                                        ),
                                      ),
                                    ],
                                  );
                                },
                              )
                            : Text('Data Arus Kas Kosong')
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(defaultMargin),
                    child: Column(
                      children: [
                        Text('Approval'),
                        listApproval!.isNotEmpty
                            ? ListView.builder(
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                itemCount: listApproval!.length,
                                itemBuilder: (context, index) {
                                  var approvalList = listApproval![index];
                                  return Column(
                                    children: [
                                      ApprovalCard(
                                          approvalCardModel: ApprovalCardModel(
                                        title: approvalList.title,
                                        description: approvalList.description,
                                        date: approvalList.createdAt.toString(),
                                        value: approvalList.value,
                                        status: approvalList.status,
                                      ))
                                    ],
                                  );
                                })
                            : Text('Data Approval Kosong')
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
