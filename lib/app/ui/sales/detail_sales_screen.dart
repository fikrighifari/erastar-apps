import 'package:erastar_apps/app/controller/sales_controller.dart';
import 'package:erastar_apps/app/models/invoice_detail_model.dart';
import 'package:erastar_apps/app/widgets/card_model/sales_card_model.dart';
import 'package:erastar_apps/app/widgets/reusable_components/extentions.dart';
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
        //get data asset
        listingId = valueDetailInvoice.dataDetailInvoice!.asset!.listingId;
        assetName = valueDetailInvoice.dataDetailInvoice!.asset!.title;
        address = valueDetailInvoice.dataDetailInvoice!.asset!.address;
        status = valueDetailInvoice.dataDetailInvoice!.asset!.status!.name;
        type = valueDetailInvoice.dataDetailInvoice!.asset!.type;
        assetPrice =
            valueDetailInvoice.dataDetailInvoice!.asset!.price.toString();

        //get data invoice
        invoiceNumber = valueDetailInvoice.dataDetailInvoice!.invoiceNum;
        buyerName = valueDetailInvoice.dataDetailInvoice!.buyerName;
        buyerPhone = valueDetailInvoice.dataDetailInvoice!.buyerPhone;
        buyerEmail = valueDetailInvoice.dataDetailInvoice!.buyerEmail;
        valueInvoice =
            valueDetailInvoice.dataDetailInvoice!.valueInvoice.toString();
        statusInvoice = valueDetailInvoice.dataDetailInvoice!.status!.name;
        createdDate =
            valueDetailInvoice.dataDetailInvoice!.createdAt.toString();

        //get data auction
        auctionPrice =
            valueDetailInvoice.dataDetailInvoice!.auction!.price.toString();
        statusAuction = valueDetailInvoice.dataDetailInvoice!.auction!.status;
        endDateAuction =
            valueDetailInvoice.dataDetailInvoice!.auction!.endDate.toString();
        noteAuction =
            valueDetailInvoice.dataDetailInvoice!.auction!.pengumumanLelang;
      }
    });

    return futureInvoiceDetail;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.backgroundGrey,
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
                  child: Padding(
                    padding: EdgeInsets.all(defaultMargin),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Detail Asset
                        CustomContainer(
                          radius: 6,
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
                              const Divider(
                                thickness: 1,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const TextWidget('Nama Asset'),
                                  TextWidget(assetName)
                                ],
                              ),
                              const Divider(
                                thickness: 1,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const TextWidget('Alamat'),
                                  TextWidget(address)
                                ],
                              ),
                              const Divider(
                                thickness: 1,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const TextWidget('Status Asset'),
                                  TextWidget(status)
                                ],
                              ),
                              const Divider(
                                thickness: 1,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const TextWidget('Tipe Asset'),
                                  TextWidget(
                                    type.toString().toTitleCase(),
                                  )
                                ],
                              ),
                              const Divider(
                                thickness: 1,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const TextWidget('Harga Asset'),
                                  TextWidget(
                                    rupiah(assetPrice),
                                    color: AppColor.primayRedColor,
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                        CustomContainer(
                          radius: 4,
                          padding: EdgeInsets.all(defaultMargin),
                          width: double.infinity,
                          backgroundColor: AppColor.whiteColor,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              TextWidget(
                                'Detail Invoice',
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
                                  const TextWidget('Nomor Invoice'),
                                  TextWidget(invoiceNumber)
                                ],
                              ),
                              const Divider(
                                thickness: 1,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const TextWidget('Nama Pembeli'),
                                  TextWidget(buyerName)
                                ],
                              ),
                              const Divider(
                                thickness: 1,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const TextWidget('Email Pembeli'),
                                  TextWidget(buyerEmail)
                                ],
                              ),
                              const Divider(
                                thickness: 1,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const TextWidget('Kontak Pembeli'),
                                  TextWidget(buyerPhone)
                                ],
                              ),
                              const Divider(
                                thickness: 1,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const TextWidget('Value Invoice'),
                                  TextWidget(
                                    rupiah(valueInvoice),
                                    color: AppColor.primayRedColor,
                                  )
                                ],
                              ),
                              const Divider(
                                thickness: 1,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const TextWidget('Status Invoice'),
                                  TextWidget(statusInvoice)
                                ],
                              ),
                              const Divider(
                                thickness: 1,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const TextWidget('Tanggal dibuat'),
                                  TextWidget(Jiffy(createdDate).yMMMMd)
                                ],
                              ),
                              const Divider(
                                thickness: 1,
                              ),
                              // Row(
                              //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              //   children: [
                              //     const TextWidget('Tanggal diperbaharui'),
                              //     TextWidget(invoiceNumber)
                              //   ],
                              // ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const TextWidget('Nomor Invoice'),
                                  TextWidget(invoiceNumber)
                                ],
                              ),
                            ],
                          ),
                        ),
                        CustomContainer(
                          radius: 4,
                          padding: EdgeInsets.all(defaultMargin),
                          width: double.infinity,
                          backgroundColor: AppColor.whiteColor,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              TextWidget(
                                'Detail Lelang',
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
                                  const TextWidget('Harga Lelang'),
                                  TextWidget(rupiah(auctionPrice),
                                      color: AppColor.primayRedColor)
                                ],
                              ),
                              const Divider(
                                thickness: 1,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const TextWidget('Status Lelang'),
                                  TextWidget(
                                    statusAuction.toString().toTitleCase(),
                                  )
                                ],
                              ),
                              const Divider(
                                thickness: 1,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const TextWidget('Tanggal Lelang Berakhir'),
                                  TextWidget(Jiffy(endDateAuction).yMMMMd)
                                ],
                              ),
                              const Divider(
                                thickness: 1,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const TextWidget('Pengumuman Lelang'),
                                  Expanded(
                                    child: TextWidget(
                                      noteAuction,
                                      textAlign: TextAlign.right,
                                    ),
                                  )
                                ],
                              ),
                            ],
                          ),
                        )
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
