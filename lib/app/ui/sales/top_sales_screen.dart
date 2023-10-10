import 'package:erastar_apps/app/themes/themes.dart';
import 'package:erastar_apps/app/widgets/reusable_components/reusable_components.dart';
import 'package:erastar_apps/export.dart';

class TopSalesScreen extends StatefulWidget {
  const TopSalesScreen({super.key});

  @override
  State<TopSalesScreen> createState() => _TopSalesScreenState();
}

class _TopSalesScreenState extends State<TopSalesScreen> {
  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      hideAppBar: true,
      hideBackButton: true,
      child: SingleChildScrollView(
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
            Padding(
              padding: EdgeInsets.all(defaultMargin),
              child: const Column(
                children: [
                  TextWidget.titleMedium('Top Sales Marketing'),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
