import 'package:erastar_apps/app/controller/asset_controller.dart';
import 'package:erastar_apps/app/models/asset_detail_model.dart';
import 'package:erastar_apps/app/models/asset_model.dart';
import 'package:erastar_apps/app/widgets/card_model/asset_card_model.dart';
import 'package:erastar_apps/export.dart';

class DetailAssetScreen extends StatefulWidget {
  const DetailAssetScreen({
    super.key,
    required this.assetItem,
  });
  final AssetCardModel assetItem;

  @override
  State<DetailAssetScreen> createState() => _DetailAssetScreenState();
}

class _DetailAssetScreenState extends State<DetailAssetScreen> {
  DataAsset? dataAsset;
  late Future<DetailAssetModel?> futureAssetDetail;

  @override
  void initState() {
    fetchData(widget.assetItem.idAsset);

    super.initState();
  }

  fetchData(String? idAssetData) {
    futureAssetDetail = AssetController().getDetailAsset(idAssetData);
    print(idAssetData);
  }

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      centralize: true,
      child: Column(
        children: [Text('Detail Asset Screen')],
      ),
    );
  }
}
