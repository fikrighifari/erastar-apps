import 'package:erastar_apps/app/themes/themes.dart';
import 'package:erastar_apps/app/widgets/reusable_components/reusable_components.dart';
import 'package:erastar_apps/export.dart';

class ArusKasScreen extends StatefulWidget {
  const ArusKasScreen({super.key});

  @override
  State<ArusKasScreen> createState() => _ArusKasScreenState();
}

class _ArusKasScreenState extends State<ArusKasScreen>
    with SingleTickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
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
                        colorFilter: const ColorFilter.mode(
                          AppColor.whiteColor,
                          BlendMode.srcIn,
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    const Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
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
            Column(
              children: [
                Padding(
                  padding: EdgeInsets.all(defaultMargin),
                  child: TabBar(
                      labelColor: Colors.black,
                      unselectedLabelColor: Colors.grey,
                      indicator: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(5)),
                      controller: tabController,
                      tabs: const [
                        Tab(
                          text: "Arus Kas",
                        ),
                        Tab(
                          text: "Menunggu Persetujuan",
                        ),
                      ]),
                ),
              ],
            ),
            Expanded(
              child: TabBarView(
                controller: tabController,
                children: const [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // _filterKas(),
                      // _contentKas(),
                      Text('Arus Kas')
                    ],
                  ),
                  Column(
                    children: [
                      Text('Approval')
                      // ApprovalCard(
                      //   approvalModel: ApprovalModel(
                      //     title: "Sewa Pengacara",
                      //     description:
                      //         "Biaya sewa pengacara untuk sengketa rumah lelang dengan ID Listing M000035",
                      //     dateTime: DateTime.now(),
                      //     price: 50000000,
                      //   ),
                      // ),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
