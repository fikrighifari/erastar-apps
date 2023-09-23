import 'package:erastar_apps/app/services/local_storage_service.dart';
import 'package:erastar_apps/app/themes/themes.dart';
import 'package:erastar_apps/app/widgets/reusable_components/reusable_components.dart';
import 'package:erastar_apps/export.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            // Header Content
            CustomContainer(
              padding: EdgeInsets.symmetric(
                horizontal: defaultMargin,
                vertical: 8,
              ),
              width: double.infinity,
              backgroundColor: AppColor.primayRedColor,
              child: Row(
                children: [
                  const SizedBox(
                    width: 50,
                    height: 50,
                    child: CircleAvatar(
                      backgroundImage: NetworkImage(
                        "https://images.unsplash.com/photo-1506794778202-cad84cf45f1d?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=774&q=80",
                      ),
                      backgroundColor: AppColor.whiteColor,
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
                        "Ryan Greenway",
                        color: AppColor.whiteColor,
                      ),
                      TextWidget(
                        "Director",
                        color: AppColor.whiteColor,
                      ),
                    ],
                  ),
                  const Spacer(),
                  SvgPicture.asset(
                    'assets/icons/ic_notification.svg',
                  )
                ],
              ),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColor.cyanColor,
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(4),
                ),
              ),
              child: TextWidget.titleSmall(
                'Logout',
                color: AppColor.blackColor,
                fontWeight: boldWeight,
              ),
              onPressed: () {
                LocalStorageService.remove("headerToken");

                Modular.to.popAndPushNamed('/auth/');
              },
            ),
          ],
        ),
      ),
    );
  }
}
