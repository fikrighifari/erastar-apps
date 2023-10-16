import 'package:erastar_apps/app/controller/cash_flow_controller.dart';
import 'package:erastar_apps/app/models/cash_flow_detail_model.dart';
import 'package:erastar_apps/app/widgets/card_model/cash_flow_card_model.dart';
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
  late Future<DetailCashFlow?> futureDetailCashFlow;

  @override
  void initState() {
    fetchData(widget.arusKasCardItem.idInvoice);
    print(widget.arusKasCardItem.idInvoice);
    super.initState();
  }

  fetchData(String? idInvoiceData) {
    futureDetailCashFlow =
        CashFlowController().getDetailCashFlow(idInvoiceData);
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
      body: SafeArea(
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
                        'Detail Invoice',
                        color: AppColor.primayRedColor,
                        fontSize: 16,
                        fontWeight: boldWeight,
                      ),
                      SizedBox(
                        height: defaultMargin,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const TextWidget('Nomor Invoice'),
                          TextWidget('invoiceNumber')
                        ],
                      ),
                      const Divider(
                        thickness: 1,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const TextWidget('Nama Pembeli'),
                          TextWidget('buyerName')
                        ],
                      ),
                      const Divider(
                        thickness: 1,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const TextWidget('Email Pembeli'),
                          TextWidget('buyerEmail')
                        ],
                      ),
                      const Divider(
                        thickness: 1,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const TextWidget('Kontak Pembeli'),
                          TextWidget('buyerPhone')
                        ],
                      ),
                      const Divider(
                        thickness: 1,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const TextWidget('Jumlah Invoice'),
                          TextWidget('valueInvoice')
                        ],
                      ),
                      const Divider(
                        thickness: 1,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const TextWidget('Status'),
                          TextWidget('statusInvoice')
                        ],
                      ),
                      const Divider(
                        thickness: 1,
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
