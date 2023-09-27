import 'package:erastar_apps/app/themes/themes.dart';
import 'package:erastar_apps/app/widgets/reusable_components/reusable_components.dart';
import 'package:erastar_apps/export.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return CustomScaffold.withAppBar(
      title: 'Profile',
      centerTitle: true,
      onBack: () {
        Navigator.of(context).pop();
      },
      child: Padding(
        padding: EdgeInsets.all(defaultMargin),
        child: Column(
          children: [
            Center(
              child: Container(
                margin: EdgeInsets.only(
                  bottom: defaultMargin,
                ),
                child: SvgPicture.asset(
                  'assets/icons/ic_avatar.svg',
                  width: 100,
                ),
              ),
            ),
            TextWidget(
              'nameProfile',
              color: AppColor.blackColor,
              fontWeight: boldWeight,
              fontSize: 16,
            ),
            TextWidget(
              'emailProfile', color: AppColor.naturalGrey2,
              fontWeight: boldWeight,
              fontSize: 14,
              // style: houseTitleTextStyle.copyWith(
              //   fontSize: 14,
              //   color: AppColors.naturalGrey2,
              // ),
            ),
            CustomContainer(
              radius: 10,
              margin: EdgeInsets.only(top: defaultMargin),
              padding: EdgeInsets.all(defaultMargin),
              width: double.infinity,
              backgroundColor: AppColor.whiteColor,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextWidget(
                    'Akun',
                    color: AppColor.primayRedColor,
                    fontSize: 16,
                    fontWeight: semiBoldWeight,
                  ),
                  SizedBox(
                    height: defaultSizedbox,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const TextWidget(
                        'Role',
                        fontSize: 14,
                      ),
                      TextWidget(
                        'Superadmin',
                        fontSize: 14,
                        fontWeight: semiBoldWeight,
                      ),
                    ],
                  ),
                  const Divider(
                    thickness: 1,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const TextWidget(
                        'Phone',
                        fontSize: 14,
                      ),
                      TextWidget(
                        '+6299999',
                        fontSize: 14,
                        fontWeight: semiBoldWeight,
                      ),
                    ],
                  ),
                  const Divider(
                    thickness: 1,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const TextWidget(
                        'Device',
                        fontSize: 14,
                      ),
                      TextWidget(
                        'Mobile',
                        fontSize: 14,
                        fontWeight: semiBoldWeight,
                      ),
                    ],
                  ),
                  const Divider(
                    thickness: 1,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
