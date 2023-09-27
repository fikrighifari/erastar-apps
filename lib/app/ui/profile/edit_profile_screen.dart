import 'package:erastar_apps/app/themes/themes.dart';
import 'package:erastar_apps/app/widgets/reusable_components/reusable_components.dart';
import 'package:erastar_apps/export.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return CustomScaffold.withAppBar(
      centerTitle: true,
      title: 'Edit Profile',
      onBack: () {
        Navigator.of(context).pop();
      },
      child: Padding(
        padding: EdgeInsets.all(defaultMargin),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              margin: const EdgeInsets.only(bottom: 24),
              child: Image.asset(
                'assets/images/logo_transparent.png',
                width: 75,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            CustomTextField(
              controller: _emailController,
              prefixIcon: const Icon(Icons.people),
              labelText: "Nama",
              hintText: "Era Star Lelang Properti",
              labelStyle: labelTextStyle,
              textStyle: labelTextStyle,
            ),
            const SizedBox(
              height: 10,
            ),
            CustomTextField(
              controller: _phoneNumberController,
              prefixIcon: const Icon(Icons.phone),
              labelText: "No. Telpon",
              hintText: "+628123456789",
              labelStyle: labelTextStyle,
              textStyle: labelTextStyle,
            ),
            const SizedBox(
              height: 10,
            ),
            CustomButton(
              height: 50,
              width: MediaQuery.of(context).size.width,
              isRounded: true,
              borderRadius: 10,
              backgroundColor: AppColor.primayRedColor,
              onPressed: () {
                // _login(authServices);
              },
              text: const TextWidget(
                "Update",
                color: AppColor.whiteColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
