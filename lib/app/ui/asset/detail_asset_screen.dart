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
      // appBar: CustomAppBar(
      //     backButton: IconButton(
      //       icon: const Icon(
      //         Icons.arrow_back_ios_new,
      //         color: AppColor.whiteColor,
      //       ),
      //       onPressed: () {
      //         Navigator.of(context).pop();
      //       },
      //     ),
      //     title: 'Detail Asset'),
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
              return SafeArea(
                child: Stack(
                  children: [
                    Image.network(
                      baseAPIUrlImage + imgPath! + imgName!,
                      width: MediaQuery.of(context).size.width,
                      height: 350,
                      fit: BoxFit.cover,
                    ),
                    ListView(
                      children: [
                        const SizedBox(
                          height: 328,
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: defaultMargin,
                            vertical: defaultMargin,
                          ),
                          width: MediaQuery.of(context).size.width,
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.vertical(
                              top: Radius.circular(20),
                            ),
                            color: AppColor.whiteColor,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  TextWidget(
                                    listingId.toString(),
                                  ),
                                  const Spacer(),
                                  TextWidget(
                                    type.toString(),
                                    color: AppColor.blueColor,
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  TextWidget(status.toString()),
                                ],
                              ),
                              TextWidget(title),
                              TextWidget(price),
                              TextWidget(description),
                              TextWidget(address),
                              const TextWidget(
                                'Photos',
                                color: AppColor.primayRedColor,
                                fontSize: 15,
                              ),
                              SingleChildScrollView(
                                scrollDirection: Axis
                                    .horizontal, // Set scroll direction to horizontal
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: listImages.map((listDataImages) {
                                    return Container(
                                      margin: const EdgeInsets.symmetric(
                                          horizontal: 5),
                                      width: 100,
                                      height: 100,
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(10),
                                        child: Image.network(
                                          baseAPIUrlImage +
                                              listDataImages!.path! +
                                              listDataImages.filename
                                                  .toString(),
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    );
                                  }).toList(),
                                ),
                              ),
                              const TextWidget(
                                'Spesifikasi',
                                color: AppColor.primayRedColor,
                                fontSize: 15,
                              ),
                              Row(
                                children: [
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const TextWidget('L. Bangunan'),
                                      TextWidget(buildingArea),
                                      const TextWidget('L. Tanah'),
                                      TextWidget(landArea),
                                    ],
                                  ),
                                  const SizedBox(
                                    width: 5,
                                  ),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      SvgPicture.asset(
                                          'assets/icons/ic_bedroom.svg'),
                                      TextWidget('$bedRoom Kamar Tidur'),
                                      SvgPicture.asset(
                                          'assets/icons/ic_bathroom.svg'),
                                      TextWidget('$bathroom Kamar Mandi'),
                                    ],
                                  ),
                                ],
                              ),
                              const TextWidget(
                                'Sertifikat',
                                color: AppColor.primayRedColor,
                                fontSize: 15,
                              ),
                              TextWidget(certificate),
                              const TextWidget(
                                'Kontak PIC',
                                color: AppColor.primayRedColor,
                                fontSize: 15,
                              ),
                              TextWidget(picName),
                              TextWidget(picContactNumber),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: defaultMargin,
                        vertical: defaultMargin,
                      ),
                      child: Row(
                        children: [
                          InkWell(
                            onTap: () {
                              Navigator.of(context).pop();
                            },
                            child: SvgPicture.asset(
                                'assets/icons/ic_btn_back.svg'),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
          }
        },
      ),
    );
  }
}
