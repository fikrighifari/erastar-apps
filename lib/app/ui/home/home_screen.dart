import 'package:erastar_apps/app/config/api_path.dart';
import 'package:erastar_apps/app/controller/home_controller.dart';
import 'package:erastar_apps/app/models/approval_cost_model.dart';
import 'package:erastar_apps/app/models/asset_model.dart';
import 'package:erastar_apps/app/models/cash_flow_model.dart';
import 'package:erastar_apps/app/models/invoice_model.dart';
import 'package:erastar_apps/app/models/profile_model.dart';
import 'package:erastar_apps/app/themes/themes.dart';
import 'package:erastar_apps/app/widgets/card_model/approval_card_model.dart';
import 'package:erastar_apps/app/widgets/card_model/arus_kas_card_model.dart';
import 'package:erastar_apps/app/widgets/card_model/sales_card_model.dart';
import 'package:erastar_apps/app/widgets/cards/approval_card.dart';
import 'package:erastar_apps/app/widgets/cards/arus_kas_card.dart';
import 'package:erastar_apps/app/widgets/cards/asset_card.dart';
import 'package:erastar_apps/app/widgets/cards/sales_card.dart';
import 'package:erastar_apps/app/widgets/reusable_components/reusable_components.dart';
import 'package:erastar_apps/export.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Future<AssetModel?> futureAssetHome;
  late Future<ProfileModel?> futureProfile;
  late Future<InvoiceModel?> futureInvoiceHome;
  late Future<CashFlowModel?> futureCashFlowHome;
  late Future<ApprovalCostModel?> futureApprovalCostHome;
  late DataProfile dataProfile;
  late String? nameProfile, roleProfile, avatarProfile = '';

  late List<DataListApproval>? listApproval = [];
  late List<ListDataCashFlow>? listCashFlow = [];
  late List<DataListInvoice>? listInvoice = [];

  final GlobalKey<RefreshIndicatorState> _refreshIndicatorKey =
      GlobalKey<RefreshIndicatorState>();

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> refreshHome() async {
    setState(() {
      _refreshIndicatorKey.currentState!.show();
      fetchData();
    });
  }

  fetchData() async {
    futureProfile = HomeController().getProfile();
    futureAssetHome = HomeController().getAssetHome();

    //Get Profile
    futureProfile.then((value) async {
      if (value != null) {
        if (value.status == "success") {
          dataProfile = value.data;
          nameProfile = value.data.name;
          avatarProfile = '${value.data.avatarPath}${value.data.avatar}';
          roleProfile = value.data.role!.name;
        }
      }

      //Get Approval List
      futureApprovalCostHome = HomeController().getApprovalHome();
      futureApprovalCostHome.then((valueApproval) {
        if (valueApproval != null) {
          if (valueApproval.status == 'success') {
            listApproval = valueApproval.data!.dataListApproval;
          }
        }
      });
    });

    futureCashFlowHome = HomeController().getCashFlowHome();
    futureCashFlowHome.then((valueCashFlow) {
      if (valueCashFlow != null) {
        if (valueCashFlow.status == 'success') {
          listCashFlow = valueCashFlow.data!.dataListCashFlow;
        }
      }
    });

    futureInvoiceHome = HomeController().getInvoiceHome();
    futureInvoiceHome.then((valueInvoice) {
      if (valueInvoice != null) {
        if (valueInvoice.status == 'success') {
          listInvoice = valueInvoice.data!.dataListInvoice;
        }
      }
    });

    // return futureProfile;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<ProfileModel?>(
        future: futureProfile,
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
              return RefreshIndicator(
                onRefresh: refreshHome,
                key: _refreshIndicatorKey,
                child: SafeArea(
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Header Content
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
                                avatarProfile != null
                                    ? SizedBox(
                                        width: 50,
                                        height: 50,
                                        child: CircleAvatar(
                                          backgroundImage: NetworkImage(
                                            '$baseAPIUrlImage$avatarProfile',
                                          ),
                                          backgroundColor: AppColor.whiteColor,
                                        ),
                                      )
                                    : SizedBox(
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
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    TextWidget(
                                      nameProfile,
                                      color: AppColor.whiteColor,
                                    ),
                                    TextWidget(
                                      roleProfile,
                                      color: AppColor.whiteColor,
                                    ),
                                  ],
                                ),
                                const Spacer(),
                                SvgPicture.asset(
                                  'assets/icons/ic_notification.svg',
                                )
                              ],
                            ),
                          ),
                        ),

                        Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: defaultMargin,
                            vertical: 8,
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // New Properti List
                              TextWidget(
                                'Listing Properti Terbaru',
                                fontWeight: boldWeight,
                                fontSize: 16,
                              ),
                              const SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Row(
                                  children: [
                                    AssetCard(),
                                    AssetCard(),
                                  ],
                                ),
                              ),
                              // Approval List
                              TextWidget(
                                'Menunggu Persetujuan',
                                fontWeight: boldWeight,
                                fontSize: 16,
                              ),
                              ListView.builder(
                                  shrinkWrap: true,
                                  physics: const NeverScrollableScrollPhysics(),
                                  itemCount: listApproval!.length,
                                  itemBuilder: (context, index) {
                                    var approvalList = listApproval![index];
                                    return Column(
                                      children: [
                                        ApprovalCard(
                                            approvalCardModel:
                                                ApprovalCardModel(
                                          title: approvalList.title,
                                          description: approvalList.description,
                                          date:
                                              approvalList.createdAt.toString(),
                                          value: approvalList.value,
                                          status: approvalList.status,
                                        ))
                                      ],
                                    );
                                  }),

                              //Arus Kas
                              TextWidget(
                                'Arus Kas',
                                fontWeight: boldWeight,
                                fontSize: 16,
                              ),
                              ListView.builder(
                                  shrinkWrap: true,
                                  physics: const NeverScrollableScrollPhysics(),
                                  itemCount: listCashFlow!.length,
                                  itemBuilder: (context, index) {
                                    var cashFlowList = listCashFlow![index];
                                    return Column(
                                      children: [
                                        ArusKasCard(
                                          arusKasCardModel: ArusKasCardModel(
                                            title: cashFlowList.title,
                                            description:
                                                cashFlowList.description,
                                            date: cashFlowList.createdAt
                                                .toString(),
                                            value: cashFlowList.value,
                                            status: cashFlowList.status,
                                          ),
                                        ),
                                      ],
                                    );
                                  }),

                              //Penjualan Aset
                              TextWidget(
                                'Penjualan Aset',
                                fontWeight: boldWeight,
                                fontSize: 16,
                              ),
                              ListView.builder(
                                  shrinkWrap: true,
                                  physics: const NeverScrollableScrollPhysics(),
                                  itemCount: listInvoice!.length,
                                  itemBuilder: (context, index) {
                                    var listDataInvoice = listInvoice![index];
                                    return Column(
                                      children: [
                                        SalesCard(
                                          salesCardModel: SalesCardModel(
                                            idListing: listDataInvoice
                                                .asset!.listingId,
                                            title: listDataInvoice.asset!.title,
                                            marketingName: listDataInvoice
                                                .commission!.marketing!.name,
                                            officeName: listDataInvoice
                                                .asset!.office!.name,
                                            status:
                                                listDataInvoice.status!.name,
                                            value: listDataInvoice.valueInvoice,
                                            date: listDataInvoice.createdAt
                                                .toString(),
                                            // title: listDataInvoice.asset!.title,
                                            // description: listDataInvoice
                                            //     .asset!.description,
                                            // date: listDataInvoice.createdAt
                                            //     .toString(),
                                            // value: listDataInvoice.valueInvoice,
                                            // status: listDataInvoice.status
                                            //     .toString(),
                                          ),
                                        ),
                                      ],
                                    );
                                  }),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
          }
        },
      ),
    );
  }
}
