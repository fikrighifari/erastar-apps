import 'package:erastar_apps/app/config/api_path.dart';
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
  late List<ImageDetailAsset?> listImages = [];

  String? listingId,
      title,
      description,
      price,
      status,
      type,
      address,
      buildingArea,
      landArea,
      bedRoom,
      bathroom,
      certificate,
      picName,
      picContactNumber,
      imgPath,
      imgName,
      imgUrl;

  @override
  void initState() {
    fetchData(widget.assetItem.idAsset);
    super.initState();
  }

  fetchData(String? idAssetData) {
    futureAssetDetail = AssetController().getDetailAsset(idAssetData);
    futureAssetDetail.then((valueDetailAsset) {
      if (valueDetailAsset != null) {
        listingId = valueDetailAsset.dataDetailAsset!.listingId;
        title = valueDetailAsset.dataDetailAsset!.title;
        description = valueDetailAsset.dataDetailAsset!.description;
        price = valueDetailAsset.dataDetailAsset!.price.toString();
        status = valueDetailAsset.dataDetailAsset!.status!.name;
        type = valueDetailAsset.dataDetailAsset!.type;
        address = valueDetailAsset.dataDetailAsset!.address;
        buildingArea =
            valueDetailAsset.dataDetailAsset!.luasBangunan.toString();
        landArea = valueDetailAsset.dataDetailAsset!.luasTanah.toString();
        bedRoom = valueDetailAsset.dataDetailAsset!.kamarTidur.toString();
        bathroom = valueDetailAsset.dataDetailAsset!.kamarTidur.toString();
        certificate = valueDetailAsset.dataDetailAsset!.statusSertifikat!.name;
        picName = valueDetailAsset.dataDetailAsset!.namaPic;
        picContactNumber = valueDetailAsset.dataDetailAsset!.telpPic;
        imgPath = valueDetailAsset.dataDetailAsset!.images.first.path;
        imgName = valueDetailAsset.dataDetailAsset!.images.first.filename;
        listImages = valueDetailAsset.dataDetailAsset!.images;
      }

      return futureAssetDetail;
    });
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
          title: 'Detail Asset'),
      body: FutureBuilder<DetailAssetModel?>(
        future: futureAssetDetail,
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
              return Column(
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Stack(
                        children: [
                          Image.network(baseAPIUrlImage + imgPath! + imgName!),
                          // ListView(
                          //   children: [
                          //     const SizedBox(
                          //       height: 328,
                          //     ),
                          //     Container(
                          //       padding: const EdgeInsets.only(
                          //         bottom: 20,
                          //       ),
                          //       // height: 50,
                          //       width: MediaQuery.of(context).size.width,
                          //       decoration: const BoxDecoration(
                          //         color: AppColor.whiteColor,
                          //         borderRadius: BorderRadius.vertical(
                          //           top: Radius.circular(20),
                          //         ),
                          //       ),
                          //     ),
                          //     Column(
                          //       children: [
                          //         SizedBox(
                          //           height: 30,
                          //         ),
                          //         Padding(
                          //           padding: const EdgeInsets.symmetric(
                          //             horizontal: 20,
                          //           ),
                          //           child: Column(
                          //             crossAxisAlignment:
                          //                 CrossAxisAlignment.start,
                          //             mainAxisAlignment:
                          //                 MainAxisAlignment.start,
                          //             children: [
                          //               Row(
                          //                 children: [
                          //                   TextWidget(
                          //                     listingId.toString(),
                          //                   ),
                          //                   Spacer(),
                          //                   TextWidget(
                          //                     type.toString(),
                          //                     color: AppColor.blueColor,
                          //                   ),
                          //                   TextWidget(status.toString()),
                          //                 ],
                          //               ),
                          //             ],
                          //           ),
                          //         ),
                          //       ],
                          //     ),
                          //   ],
                          // ),
                        ],
                      ),
                      // TextWidget(title),
                      // TextWidget(price),
                      // TextWidget(description),
                      // const TextWidget(
                      //   'Photo',
                      //   color: AppColor.primayRedColor,
                      //   fontSize: 15,
                      // ),
                      // TextWidget(address),
                      // const TextWidget(
                      //   'Spesifikasi',
                      //   color: AppColor.primayRedColor,
                      //   fontSize: 15,
                      // ),
                      // Row(
                      //   children: [
                      //     Column(
                      //       mainAxisAlignment: MainAxisAlignment.start,
                      //       crossAxisAlignment: CrossAxisAlignment.start,
                      //       children: [
                      //         TextWidget('L. Bangunan'),
                      //         TextWidget(buildingArea),
                      //         TextWidget('L. Tanah'),
                      //         TextWidget(landArea),
                      //       ],
                      //     ),
                      //     SizedBox(
                      //       width: 5,
                      //     ),
                      //     Column(
                      //       mainAxisAlignment: MainAxisAlignment.start,
                      //       crossAxisAlignment: CrossAxisAlignment.start,
                      //       children: [
                      //         TextWidget('Kamar Tidur'),
                      //         TextWidget(bedRoom),
                      //         TextWidget('Kamar Mandi'),
                      //         TextWidget(bathroom),
                      //       ],
                      //     ),
                      //   ],
                      // ),
                      // const TextWidget(
                      //   'Sertifikat',
                      //   color: AppColor.primayRedColor,
                      //   fontSize: 15,
                      // ),
                      // TextWidget(certificate),
                      // const TextWidget(
                      //   'Kontak PIC',
                      //   color: AppColor.primayRedColor,
                      //   fontSize: 15,
                      // ),
                      // TextWidget(picName),
                      // TextWidget(picContactNumber),
                    ],
                  ),
                  // SingleChildScrollView(
                  //   scrollDirection:
                  //       Axis.horizontal, // Set scroll direction to horizontal
                  //   child: Row(
                  //     children: listImages.map((listDataImages) {
                  //       return SizedBox(
                  //         width: 100,
                  //         height: 100,
                  //         child: Image.network(
                  //           baseAPIUrlImage +
                  //               listDataImages!.path! +
                  //               listDataImages.filename.toString(),
                  //         ),
                  //       );
                  //     }).toList(),
                  //   ),
                  // ),
                ],
              );
          }
        },
      ),
    );
  }
}
