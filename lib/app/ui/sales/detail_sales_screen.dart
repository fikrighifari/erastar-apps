import 'package:erastar_apps/app/controller/sales_controller.dart';
import 'package:erastar_apps/app/models/invoice_detail_model.dart';
import 'package:erastar_apps/app/widgets/card_model/sales_card_model.dart';
import 'package:erastar_apps/export.dart';

class DetailSalesScreen extends StatefulWidget {
  const DetailSalesScreen({
    super.key,
    required this.salesCardItem,
  });

  final SalesCardModel salesCardItem;
  @override
  State<DetailSalesScreen> createState() => _DetailSalesScreenState();
}

class _DetailSalesScreenState extends State<DetailSalesScreen> {
  late Future<DetailInvoiceModel?> futureInvoiceDetail;

  String? listingId, assetName, address, status, type, assetPrice;
  String? invoiceNumber,
      buyerName,
      buyerEmail,
      buyerPhone,
      valueInvoice,
      statusInvoice,
      createdDate;
  String? auctionPrice, statusAuction, endDateAuction, noteAuction;

  @override
  void initState() {
    fetchData(widget.salesCardItem.idInvoice);
    super.initState();
  }

  fetchData(String? idInvoiceData) {
    futureInvoiceDetail = SalesController().getDetailInvoice(idInvoiceData);
    futureInvoiceDetail.then((valueDetailInvoice) {
      if (valueDetailInvoice != null) {
        print('sini');
        listingId = valueDetailInvoice.dataDetailInvoice!.asset!.listingId;
        assetName = valueDetailInvoice.dataDetailInvoice!.asset!.title;
        address = valueDetailInvoice.dataDetailInvoice!.asset!.address;
        status = valueDetailInvoice.dataDetailInvoice!.asset!.status!.name;
        type = valueDetailInvoice.dataDetailInvoice!.asset!.type;
        assetPrice =
            valueDetailInvoice.dataDetailInvoice!.asset!.price.toString();
      }
    });

    return futureInvoiceDetail;
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
            title: 'Detail Sales'),
        body: FutureBuilder<DetailInvoiceModel?>(
            future: futureInvoiceDetail,
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
                    child: Column(
                      children: [
                        CustomContainer(
                            radius: 4,
                            padding: EdgeInsets.all(defaultMargin),
                            width: double.infinity,
                            backgroundColor: AppColor.whiteColor,
                            child: Column(
                              children: [
                                TextWidget(
                                  'Detail Asset',
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
                                    const TextWidget('ID Listing'),
                                    TextWidget(listingId)
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    const TextWidget('Nama Asset'),
                                    TextWidget(assetName)
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    const TextWidget('Alamat'),
                                    TextWidget(address)
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    const TextWidget('Status Asset'),
                                    TextWidget(status)
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    const TextWidget('Tipe Asset'),
                                    TextWidget(type)
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    const TextWidget('Harga Asset'),
                                    TextWidget(assetPrice)
                                  ],
                                ),
                              ],
                            ))
                      ],
                    ),
                  ));
              }
            }));
  }
}
