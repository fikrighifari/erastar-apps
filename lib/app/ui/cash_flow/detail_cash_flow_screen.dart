import 'package:erastar_apps/app/controller/cash_flow_controller.dart';
import 'package:erastar_apps/app/models/cash_flow_detail_model.dart';
import 'package:erastar_apps/app/widgets/card_model/cash_flow_card_model.dart';
import 'package:erastar_apps/app/widgets/reusable_components/extentions.dart';
import 'package:erastar_apps/export.dart';

class DetailCashFlowScreen extends StatefulWidget {
  const DetailCashFlowScreen({
    super.key,
    required this.arusKasCardItem,
  });

  final ArusKasCardModel arusKasCardItem;
  @override
  State<DetailCashFlowScreen> createState() => _DetailCashFlowScreenState();
}

class _DetailCashFlowScreenState extends State<DetailCashFlowScreen> {
  bool isLoading = false;
  late Future<DetailCashFlow?> futureDetailCashFlow;
  String? invoiceNumber,
      buyerName,
      buyerEmail,
      buyerPhone,
      valueInvoice,
      statusInvoice,
      createdDate;
  late List<ListDataDetailCashFlow?> listDetailCashFlow = [];

  final GlobalKey<RefreshIndicatorState> _refreshIndicatorKey =
      GlobalKey<RefreshIndicatorState>();

  @override
  void initState() {
    fetchData(widget.arusKasCardItem.idInvoice);
    // print(widget.arusKasCardItem.idInvoice);
    super.initState();
  }

  Future<void> refreshData() async {
    setState(() {
      _refreshIndicatorKey.currentState!.show();
      // fetchData();
    });
  }

  fetchData(String? idInvoiceData) async {
    futureDetailCashFlow =
        CashFlowController().getDetailCashFlow(idInvoiceData);
    futureDetailCashFlow.then((valueDetailCashFlow) {
      if (valueDetailCashFlow != null) {
        listDetailCashFlow = valueDetailCashFlow.dataDetailCashFlow!.data;
      }
    });

    return futureDetailCashFlow;
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
            title: 'Detail Arus Kas'),
        body: FutureBuilder<DetailCashFlow?>(
            future: futureDetailCashFlow,
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
                          onRefresh: refreshData,
                          key: _refreshIndicatorKey,
                          child: SafeArea(
                            child: SingleChildScrollView(
                              child: Padding(
                                padding: EdgeInsets.all(defaultMargin),
                                child: listDetailCashFlow.isNotEmpty
                                    ? ListView.builder(
                                        shrinkWrap: true,
                                        physics:
                                            const NeverScrollableScrollPhysics(),
                                        itemCount: listDetailCashFlow.length,
                                        itemBuilder: (context, index) {
                                          var listDataDetailCashFlow =
                                              listDetailCashFlow[index];
                                          return Column(
                                            children: [
                                              // TextWidget(
                                              //   'Detail Invoice',
                                              //   color: AppColor.primayRedColor,
                                              //   fontSize: 16,
                                              //   fontWeight: boldWeight,
                                              // ),
                                              CustomContainer(
                                                radius: 4,
                                                padding: EdgeInsets.all(
                                                    defaultMargin),
                                                width: double.infinity,
                                                backgroundColor:
                                                    AppColor.whiteColor,
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    SizedBox(
                                                      height: defaultMargin,
                                                    ),
                                                    Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        const TextWidget(
                                                            'Termin Number'),
                                                        TextWidget(
                                                            listDataDetailCashFlow!
                                                                .terminNum
                                                                .toString())
                                                      ],
                                                    ),
                                                    const Divider(
                                                      thickness: 1,
                                                    ),
                                                    Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        const TextWidget(
                                                            'Nomor Invoice'),
                                                        TextWidget(
                                                            listDataDetailCashFlow
                                                                .invoice!
                                                                .invoiceNum
                                                                .toString())
                                                      ],
                                                    ),
                                                    const Divider(
                                                      thickness: 1,
                                                    ),
                                                    Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        const TextWidget(
                                                            'Nama Pembeli'),
                                                        TextWidget(
                                                            listDataDetailCashFlow
                                                                .invoice!
                                                                .buyerName)
                                                      ],
                                                    ),
                                                    const Divider(
                                                      thickness: 1,
                                                    ),
                                                    Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        const TextWidget(
                                                            'Email Pembeli'),
                                                        TextWidget(
                                                            listDataDetailCashFlow
                                                                .invoice!
                                                                .buyerEmail)
                                                      ],
                                                    ),
                                                    const Divider(
                                                      thickness: 1,
                                                    ),
                                                    Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        const TextWidget(
                                                            'Kontak Pembeli'),
                                                        TextWidget(
                                                            listDataDetailCashFlow
                                                                .invoice!
                                                                .buyerPhone)
                                                      ],
                                                    ),
                                                    const Divider(
                                                      thickness: 1,
                                                    ),
                                                    Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        const TextWidget(
                                                            'Deskripsi'),
                                                        TextWidget(
                                                            listDataDetailCashFlow
                                                                .description)
                                                      ],
                                                    ),
                                                    const Divider(
                                                      thickness: 1,
                                                    ),
                                                    Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        const TextWidget(
                                                            'Jumlah Invoice'),
                                                        TextWidget(rupiah(
                                                          listDataDetailCashFlow
                                                              .value
                                                              .toString(),
                                                        ))
                                                      ],
                                                    ),
                                                    const Divider(
                                                      thickness: 1,
                                                    ),
                                                    Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        const TextWidget(
                                                            'Status'),
                                                        TextWidget(
                                                          listDataDetailCashFlow
                                                              .type
                                                              .toString()
                                                              .toTitleCase(),
                                                        )
                                                      ],
                                                    ),
                                                    const Divider(
                                                      thickness: 1,
                                                    ),
                                                  ],
                                                ),
                                              )
                                            ],
                                          );
                                        },
                                      )
                                    : const Text('Data tidak ditemukan'),
                              ),
                            ),
                          ));
              }
            }));
  }
}
