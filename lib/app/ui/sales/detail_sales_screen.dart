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

  @override
  void initState() {
    fetchData(widget.salesCardItem.idInvoice);
    print(widget.salesCardItem.idInvoice);
    super.initState();
  }

  fetchData(String? idInvoiceData) {
    futureInvoiceDetail = SalesController().getDetailInvoice(idInvoiceData);
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
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          children: [Text('Detail Sales')],
        ),
      )),
    );
  }
}
