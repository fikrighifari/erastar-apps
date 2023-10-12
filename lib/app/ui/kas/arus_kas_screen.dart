import 'package:erastar_apps/app/controller/cash_flow_controller.dart';
import 'package:erastar_apps/app/models/cash_flow_model.dart';
import 'package:erastar_apps/app/themes/themes.dart';
import 'package:erastar_apps/app/widgets/card_model/arus_kas_card_model.dart';
import 'package:erastar_apps/app/widgets/cards/arus_kas_card.dart';
import 'package:erastar_apps/app/widgets/reusable_components/reusable_components.dart';
import 'package:erastar_apps/export.dart';

class ArusKasScreen extends StatefulWidget {
  const ArusKasScreen({super.key});

  @override
  State<ArusKasScreen> createState() => _ArusKasScreenState();
}

class _ArusKasScreenState extends State<ArusKasScreen>
    with SingleTickerProviderStateMixin {
  late TabController tabController;
  bool isLoading = false;
  late Future<CashFlowModel?> futureCashFlow;
  late List<ListDataCashFlow>? listDataCashFlow = [];

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
            //Header Profile
            InkWell(
              onTap: () {
                Modular.to.pushNamed('/profile/');
              },
              child: CustomContainer(
                padding: EdgeInsets.symmetric(
                  horizontal: defaultMargin,
                  vertical: 10,
                ),
                width: double.infinity,
                backgroundColor: AppColor.primayRedColor,
                child: Row(
                  children: [
                    // avatarProfile != null
                    //     ? SizedBox(
                    //         width: 50,
                    //         height: 50,
                    //         child: CircleAvatar(
                    //           backgroundImage: NetworkImage(
                    //             '$baseAPIUrlImage$avatarProfile',
                    //           ),
                    //           backgroundColor: AppColor.whiteColor,
                    //         ),
                    //       )
                    //     :
                    SizedBox(
                      width: 50,
                      height: 50,
                      child: SvgPicture.asset(
                        'assets/icons/ic_default_avatar.svg',
                        colorFilter: const ColorFilter.mode(
                          AppColor.whiteColor,
                          BlendMode.srcIn,
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    const Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextWidget(
                          'nameProfile',
                          color: AppColor.whiteColor,
                        ),
                        TextWidget(
                          'roleProfile',
                          color: AppColor.whiteColor,
                        ),
                      ],
                    ),
                    const Spacer(),
                    SvgPicture.asset(
                      'assets/icons/ic_notification.svg',
                    ),
                  ],
                ),
              ),
            ),
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
                        ListView.builder(
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
                                    date: cashFlowList.createdAt.toString(),
                                    value: cashFlowList.value,
                                    status: cashFlowList.status,
                                  ),
                                ),
                              ],
                            );
                          },
                        )
                      ],
                    ),
                  ),
                  const Column(
                    children: [
                      Text('Approval')
                      // ApprovalCard(
                      //   approvalModel: ApprovalModel(
                      //     title: "Sewa Pengacara",
                      //     description:
                      //         "Biaya sewa pengacara untuk sengketa rumah lelang dengan ID Listing M000035",
                      //     dateTime: DateTime.now(),
                      //     price: 50000000,
                      //   ),
                      // ),
                    ],
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
