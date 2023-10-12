import 'package:erastar_apps/app/controller/sales_controller.dart';
import 'package:erastar_apps/app/models/invoice_model.dart';
import 'package:erastar_apps/app/themes/themes.dart';
import 'package:erastar_apps/app/widgets/card_model/sales_card_model.dart';
import 'package:erastar_apps/app/widgets/cards/sales_card.dart';
import 'package:erastar_apps/app/widgets/reusable_components/reusable_components.dart';
import 'package:erastar_apps/export.dart';

class SalesScreen extends StatefulWidget {
  const SalesScreen({super.key});

  @override
  State<SalesScreen> createState() => _SalesScreenState();
}

class _SalesScreenState extends State<SalesScreen> {
  bool isLoading = false;
  late Future<InvoiceModel?> futureInvoice;
  late List<DataListInvoice>? listInvoice = [];

  final GlobalKey<RefreshIndicatorState> _refreshIndicatorKey =
      GlobalKey<RefreshIndicatorState>();

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> refreshSales() async {
    setState(() {
      _refreshIndicatorKey.currentState!.show();
      fetchData();
    });
  }

  fetchData() async {
    futureInvoice = SalesController().getInvoice();
    futureInvoice.then((valueInvoice) {
      if (valueInvoice != null) {
        if (valueInvoice.status == 'success') {
          setState(() {
            listInvoice = valueInvoice.data!.dataListInvoice;
          });
        }
      }
    });

    return futureInvoice;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<InvoiceModel?>(
          future: futureInvoice,
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
                return isLoading
                    ? SizedBox(
                        height: MediaQuery.of(context).size.height,
                        width: MediaQuery.of(context).size.width,
                        child: const Center(
                          child: CircularProgressIndicator(
                            color: AppColor.primayRedColor,
                          ),
                        ),
                      )
                    : RefreshIndicator(
                        onRefresh: refreshSales,
                        key: _refreshIndicatorKey,
                        child: SafeArea(
                          child: SingleChildScrollView(
                            child: SizedBox(
                              height: MediaQuery.of(context).size.height,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
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
                                              colorFilter:
                                                  const ColorFilter.mode(
                                                AppColor.whiteColor,
                                                BlendMode.srcIn,
                                              ),
                                            ),
                                          ),
                                          const SizedBox(
                                            width: 10,
                                          ),
                                          const Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
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
                                  Padding(
                                    padding: EdgeInsets.all(defaultMargin),
                                    child: Column(
                                      children: [
                                        TextWidget.titleMedium(
                                            'Penjualan Aset'),
                                        listInvoice!.isNotEmpty
                                            ? ListView.builder(
                                                shrinkWrap: true,
                                                physics:
                                                    const NeverScrollableScrollPhysics(),
                                                itemCount: listInvoice!.length,
                                                itemBuilder: (context, index) {
                                                  var listDataInvoice =
                                                      listInvoice![index];
                                                  return Column(
                                                    children: [
                                                      SalesCard(
                                                        salesCardModel:
                                                            SalesCardModel(
                                                          idListing:
                                                              listDataInvoice
                                                                  .asset!
                                                                  .listingId,
                                                          title: listDataInvoice
                                                              .asset!.title,
                                                          marketingName:
                                                              listDataInvoice
                                                                  .commission!
                                                                  .marketing!
                                                                  .name,
                                                          officeName:
                                                              listDataInvoice
                                                                  .asset!
                                                                  .office!
                                                                  .name,
                                                          status:
                                                              listDataInvoice
                                                                  .status!.name,
                                                          value: listDataInvoice
                                                              .valueInvoice,
                                                          date: listDataInvoice
                                                              .createdAt
                                                              .toString(),
                                                        ),
                                                      ),
                                                    ],
                                                  );
                                                })
                                            : Text('Data Penjualan Aset Kosong')
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ));
            }
          }),
    );
  }
}
